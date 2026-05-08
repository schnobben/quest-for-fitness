import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';
import 'adventurer_repository.dart';
import 'achievement_repository.dart';

class EquipmentRepository {
  const EquipmentRepository(this._database);

  static int _idSequence = 0;

  final AppDatabase _database;

  Future<EquipmentInventoryView> getInventoryView() async {
    await ensureBuiltInCosmetics();

    final equipment =
        await (_database.select(_database.equipmentDefinitions)..orderBy([
              (table) => OrderingTerm.asc(table.sortOrder),
              (table) => OrderingTerm.asc(table.name),
            ]))
            .get();
    final inventory = await _database
        .select(_database.equipmentInventory)
        .get();
    final equipped = await _database.select(_database.equippedEquipment).get();
    final titles =
        await (_database.select(_database.titleDefinitions)..orderBy([
              (table) => OrderingTerm.asc(table.sortOrder),
              (table) => OrderingTerm.asc(table.requiredLevel),
            ]))
            .get();
    final unlockedTitles = await _database
        .select(_database.adventurerTitles)
        .get();
    final adventurer =
        await (_database.select(_database.adventurers)..where(
              (table) =>
                  table.id.equals(AdventurerRepository.defaultAdventurerId),
            ))
            .getSingleOrNull();

    final inventoryById = {
      for (final item in inventory) item.equipmentId: item,
    };
    final equippedBySlot = {for (final item in equipped) item.slot: item};
    final titlesById = {for (final item in unlockedTitles) item.titleId: item};

    return EquipmentInventoryView(
      equipment: [
        for (final item in equipment)
          EquipmentItemView(
            definition: item,
            inventory: inventoryById[item.id],
            isEquipped: equippedBySlot[item.slot]?.equipmentId == item.id,
          ),
      ],
      equippedSlots: equippedBySlot,
      titles: [
        for (final title in titles)
          TitleItemView(
            definition: title,
            unlockedTitle: titlesById[title.id],
            isSelected: adventurer?.currentTitle == title.name,
          ),
      ],
    );
  }

  Future<void> ensureBuiltInCosmetics() async {
    final now = DateTime.now();
    for (final definition in _builtInEquipment) {
      await _database
          .into(_database.equipmentDefinitions)
          .insertOnConflictUpdate(
            EquipmentDefinitionsCompanion.insert(
              id: definition.id,
              name: definition.name,
              slot: definition.slot,
              description: definition.description,
              iconKey: definition.iconKey,
              rarity: Value(definition.rarity),
              sortOrder: Value(definition.sortOrder),
              createdAt: now,
            ),
          );
    }
    for (final definition in _builtInTitles) {
      await _database
          .into(_database.titleDefinitions)
          .insertOnConflictUpdate(
            TitleDefinitionsCompanion.insert(
              id: definition.id,
              name: definition.name,
              description: definition.description,
              requiredLevel: Value(definition.requiredLevel),
              sortOrder: Value(definition.sortOrder),
              createdAt: now,
            ),
          );
    }
    await _unlockTitle(
      titleId: TitleId.noviceAdventurer,
      fitnessEventId: null,
      occurredAt: now,
      createRewardEvent: false,
    );
  }

  Future<List<CosmeticUnlockView>> unlockEquipmentForAchievements({
    required String fitnessEventId,
    required List<AchievementStateView> achievements,
    required DateTime occurredAt,
  }) async {
    await ensureBuiltInCosmetics();
    final unlocks = <CosmeticUnlockView>[];
    for (final achievement in achievements) {
      final equipmentId =
          _equipmentRewardByAchievement[achievement.achievement.id];
      if (equipmentId == null) continue;
      final unlock = await _unlockEquipment(
        equipmentId: equipmentId,
        fitnessEventId: fitnessEventId,
        occurredAt: occurredAt,
      );
      if (unlock != null) unlocks.add(unlock);
    }
    return unlocks;
  }

  Future<List<CosmeticUnlockView>> unlockTitlesForLevelRange({
    required String fitnessEventId,
    required int levelBefore,
    required int levelAfter,
    required DateTime occurredAt,
  }) async {
    await ensureBuiltInCosmetics();
    final unlocks = <CosmeticUnlockView>[];
    for (final title in _builtInTitles) {
      if (title.requiredLevel <= levelBefore ||
          title.requiredLevel > levelAfter) {
        continue;
      }
      final unlock = await _unlockTitle(
        titleId: title.id,
        fitnessEventId: fitnessEventId,
        occurredAt: occurredAt,
      );
      if (unlock != null) unlocks.add(unlock);
    }
    return unlocks;
  }

  Future<void> equip(String equipmentId) async {
    await ensureBuiltInCosmetics();
    final definition = await (_database.select(
      _database.equipmentDefinitions,
    )..where((table) => table.id.equals(equipmentId))).getSingle();
    final inventory =
        await (_database.select(_database.equipmentInventory)
              ..where((table) => table.equipmentId.equals(equipmentId)))
            .getSingleOrNull();
    if (inventory == null) {
      throw StateError('Equipment is locked: $equipmentId');
    }
    await _database
        .into(_database.equippedEquipment)
        .insertOnConflictUpdate(
          EquippedEquipmentCompanion.insert(
            slot: definition.slot,
            equipmentId: equipmentId,
            equippedAt: DateTime.now(),
          ),
        );
  }

  Future<void> selectTitle(String titleId) async {
    await ensureBuiltInCosmetics();
    final unlocked = await (_database.select(
      _database.adventurerTitles,
    )..where((table) => table.titleId.equals(titleId))).getSingleOrNull();
    if (unlocked == null) {
      throw StateError('Title is locked: $titleId');
    }
    final title = await (_database.select(
      _database.titleDefinitions,
    )..where((table) => table.id.equals(titleId))).getSingle();
    await (_database.update(_database.adventurers)..where(
          (table) => table.id.equals(AdventurerRepository.defaultAdventurerId),
        ))
        .write(
          AdventurersCompanion(
            currentTitle: Value(title.name),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }

  Future<CosmeticUnlockView?> _unlockEquipment({
    required String equipmentId,
    required String fitnessEventId,
    required DateTime occurredAt,
  }) async {
    final existing =
        await (_database.select(_database.equipmentInventory)
              ..where((table) => table.equipmentId.equals(equipmentId)))
            .getSingleOrNull();
    if (existing != null) return null;

    final definition = await (_database.select(
      _database.equipmentDefinitions,
    )..where((table) => table.id.equals(equipmentId))).getSingle();
    final reward = await _recordRewardEvent(
      fitnessEventId: fitnessEventId,
      type: 'equipment_unlocked',
      summary: 'Equipment unlocked: ${definition.name}',
      occurredAt: occurredAt,
    );
    await _database
        .into(_database.equipmentInventory)
        .insert(
          EquipmentInventoryCompanion.insert(
            equipmentId: equipmentId,
            sourceRewardEventId: Value(reward.id),
            unlockedAt: occurredAt,
          ),
        );
    final slotEquipped = await (_database.select(
      _database.equippedEquipment,
    )..where((table) => table.slot.equals(definition.slot))).getSingleOrNull();
    if (slotEquipped == null) {
      await equip(equipmentId);
    }
    return CosmeticUnlockView(
      rewardEvent: reward,
      id: definition.id,
      name: definition.name,
      category: definition.slot,
    );
  }

  Future<CosmeticUnlockView?> _unlockTitle({
    required String titleId,
    required String? fitnessEventId,
    required DateTime occurredAt,
    bool createRewardEvent = true,
  }) async {
    final existing = await (_database.select(
      _database.adventurerTitles,
    )..where((table) => table.titleId.equals(titleId))).getSingleOrNull();
    if (existing != null) return null;

    final title = await (_database.select(
      _database.titleDefinitions,
    )..where((table) => table.id.equals(titleId))).getSingle();
    final reward = createRewardEvent && fitnessEventId != null
        ? await _recordRewardEvent(
            fitnessEventId: fitnessEventId,
            type: 'title_unlocked',
            summary: 'Title unlocked: ${title.name}',
            occurredAt: occurredAt,
          )
        : null;
    await _database
        .into(_database.adventurerTitles)
        .insert(
          AdventurerTitlesCompanion.insert(
            titleId: titleId,
            sourceRewardEventId: Value(reward?.id),
            unlockedAt: occurredAt,
          ),
        );
    final adventurer =
        await (_database.select(_database.adventurers)..where(
              (table) =>
                  table.id.equals(AdventurerRepository.defaultAdventurerId),
            ))
            .getSingleOrNull();
    if (adventurer == null) {
      await _database
          .into(_database.adventurers)
          .insert(
            AdventurersCompanion.insert(
              id: AdventurerRepository.defaultAdventurerId,
              name: 'Iron Ranger',
              selectedClass: 'Warrior',
              currentTitle: title.name,
              createdAt: occurredAt,
              updatedAt: occurredAt,
            ),
          );
    } else if (createRewardEvent) {
      await (_database.update(
        _database.adventurers,
      )..where((table) => table.id.equals(adventurer.id))).write(
        AdventurersCompanion(
          currentTitle: Value(title.name),
          updatedAt: Value(occurredAt),
        ),
      );
    }
    return CosmeticUnlockView(
      rewardEvent: reward,
      id: title.id,
      name: title.name,
      category: 'title',
    );
  }

  Future<RewardEvent> _recordRewardEvent({
    required String fitnessEventId,
    required String type,
    required String summary,
    required DateTime occurredAt,
  }) async {
    final id = _id('cosmetic-reward', occurredAt);
    await _database
        .into(_database.rewardEvents)
        .insert(
          RewardEventsCompanion.insert(
            id: id,
            fitnessEventId: fitnessEventId,
            type: type,
            summary: summary,
            createdAt: occurredAt,
          ),
        );
    return (_database.select(
      _database.rewardEvents,
    )..where((table) => table.id.equals(id))).getSingle();
  }

  String _id(String prefix, DateTime now) {
    _idSequence += 1;
    return '$prefix-${now.toUtc().microsecondsSinceEpoch}-$_idSequence';
  }
}

abstract final class EquipmentSlotId {
  static const weapon = 'weapon';
  static const offHand = 'off_hand';
  static const helmet = 'helmet';
  static const chest = 'chest';
  static const gloves = 'gloves';
  static const boots = 'boots';
  static const trinket = 'trinket';
  static const cloak = 'cloak';
}

abstract final class EquipmentId {
  static const trainingBlade = 'training-blade';
  static const trailBoots = 'trail-boots';
  static const weighInCharm = 'weigh-in-charm';
  static const prWraps = 'pr-wraps';
  static const ironWeekCloak = 'iron-week-cloak';
  static const tenQuestChestplate = 'ten-quest-chestplate';
  static const milestoneHelm = 'milestone-helm';
}

abstract final class TitleId {
  static const noviceAdventurer = 'novice-adventurer';
  static const trailInitiate = 'trail-initiate';
  static const ironRanger = 'iron-ranger';
  static const veteranAdventurer = 'veteran-adventurer';
}

class EquipmentInventoryView {
  const EquipmentInventoryView({
    required this.equipment,
    required this.equippedSlots,
    required this.titles,
  });

  final List<EquipmentItemView> equipment;
  final Map<String, EquippedEquipmentData> equippedSlots;
  final List<TitleItemView> titles;
}

class EquipmentItemView {
  const EquipmentItemView({
    required this.definition,
    required this.inventory,
    required this.isEquipped,
  });

  final EquipmentDefinition definition;
  final EquipmentInventoryData? inventory;
  final bool isEquipped;

  bool get isUnlocked => inventory != null;
}

class TitleItemView {
  const TitleItemView({
    required this.definition,
    required this.unlockedTitle,
    required this.isSelected,
  });

  final TitleDefinition definition;
  final AdventurerTitle? unlockedTitle;
  final bool isSelected;

  bool get isUnlocked => unlockedTitle != null;
}

class CosmeticUnlockView {
  const CosmeticUnlockView({
    required this.rewardEvent,
    required this.id,
    required this.name,
    required this.category,
  });

  final RewardEvent? rewardEvent;
  final String id;
  final String name;
  final String category;
}

class _EquipmentDefinition {
  const _EquipmentDefinition({
    required this.id,
    required this.name,
    required this.slot,
    required this.description,
    required this.iconKey,
    required this.sortOrder,
    this.rarity = 'common',
  });

  final String id;
  final String name;
  final String slot;
  final String description;
  final String iconKey;
  final int sortOrder;
  final String rarity;
}

class _TitleDefinition {
  const _TitleDefinition({
    required this.id,
    required this.name,
    required this.description,
    required this.requiredLevel,
    required this.sortOrder,
  });

  final String id;
  final String name;
  final String description;
  final int requiredLevel;
  final int sortOrder;
}

const _builtInEquipment = [
  _EquipmentDefinition(
    id: EquipmentId.trainingBlade,
    name: 'Training Blade',
    slot: EquipmentSlotId.weapon,
    description: 'A first quest keepsake.',
    iconKey: 'fitness_center',
    sortOrder: 10,
  ),
  _EquipmentDefinition(
    id: EquipmentId.trailBoots,
    name: 'Trail Boots',
    slot: EquipmentSlotId.boots,
    description: 'Earned by logging the first trail run.',
    iconKey: 'directions_run',
    sortOrder: 20,
  ),
  _EquipmentDefinition(
    id: EquipmentId.weighInCharm,
    name: 'Weigh-In Charm',
    slot: EquipmentSlotId.trinket,
    description: 'A small charm for tracking body metrics.',
    iconKey: 'monitor_weight',
    sortOrder: 30,
  ),
  _EquipmentDefinition(
    id: EquipmentId.prWraps,
    name: 'Forged PR Wraps',
    slot: EquipmentSlotId.gloves,
    description: 'Marked by the first personal record.',
    iconKey: 'back_hand',
    rarity: 'uncommon',
    sortOrder: 40,
  ),
  _EquipmentDefinition(
    id: EquipmentId.ironWeekCloak,
    name: 'Iron Week Cloak',
    slot: EquipmentSlotId.cloak,
    description: 'A consistency cloak for four workouts in a week.',
    iconKey: 'shield_moon',
    rarity: 'uncommon',
    sortOrder: 50,
  ),
  _EquipmentDefinition(
    id: EquipmentId.tenQuestChestplate,
    name: 'Ten-Quest Chestplate',
    slot: EquipmentSlotId.chest,
    description: 'Awarded after ten completed workouts.',
    iconKey: 'security',
    rarity: 'uncommon',
    sortOrder: 60,
  ),
  _EquipmentDefinition(
    id: EquipmentId.milestoneHelm,
    name: 'Milestone Helm',
    slot: EquipmentSlotId.helmet,
    description: 'A helm for completing a goal milestone.',
    iconKey: 'workspace_premium',
    rarity: 'uncommon',
    sortOrder: 70,
  ),
];

const _builtInTitles = [
  _TitleDefinition(
    id: TitleId.noviceAdventurer,
    name: 'Novice Adventurer',
    description: 'The road begins.',
    requiredLevel: 1,
    sortOrder: 10,
  ),
  _TitleDefinition(
    id: TitleId.trailInitiate,
    name: 'Trail Initiate',
    description: 'Reach level 2.',
    requiredLevel: 2,
    sortOrder: 20,
  ),
  _TitleDefinition(
    id: TitleId.ironRanger,
    name: 'Iron Ranger',
    description: 'Reach level 5.',
    requiredLevel: 5,
    sortOrder: 30,
  ),
  _TitleDefinition(
    id: TitleId.veteranAdventurer,
    name: 'Veteran Adventurer',
    description: 'Reach level 10.',
    requiredLevel: 10,
    sortOrder: 40,
  ),
];

const _equipmentRewardByAchievement = {
  AchievementId.firstWorkout: EquipmentId.trainingBlade,
  AchievementId.firstRun: EquipmentId.trailBoots,
  AchievementId.firstBodyweightLog: EquipmentId.weighInCharm,
  AchievementId.firstPr: EquipmentId.prWraps,
  AchievementId.fourWorkoutsWeek: EquipmentId.ironWeekCloak,
  AchievementId.tenTotalWorkouts: EquipmentId.tenQuestChestplate,
  AchievementId.firstGoalMilestone: EquipmentId.milestoneHelm,
};
