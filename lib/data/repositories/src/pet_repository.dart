import 'package:drift/drift.dart';

import '../../../core/ids/ids.dart';
import '../../local_database/local_database.dart';
import 'xp_event_service.dart';

const int bondXpWorkout = 20;
const int bondXpRun = 15;
const int bondXpBodyweight = 5;
const int bondXpTreat = 10;
const int bondXpPlay = 15;
const double energyTreat = 0.15;
const double energyRest = 0.25;

const Duration cooldownTreat = Duration(hours: 6);
const Duration cooldownPlay = Duration(hours: 3);
const Duration cooldownRest = Duration(hours: 12);

// Index = bond level (0–4); value = XP needed to advance to next level.
const List<int> bondLevelThresholds = [100, 200, 300, 400, 500];

// Index = from-stage (0–3); value = (minBondLevel, minAdventurerLevel).
const List<(int, int)> evolutionThresholds = [
  (1, 2),
  (2, 5),
  (4, 10),
  (5, 20),
];

const List<String> stageNames = [
  'Hatchling',
  'Companion',
  'Trailmate',
  'Guardian',
  'Mythic',
];

const String defaultPetId = 'primary-pet';

class PetRepository {
  PetRepository(this._database, this._ids);

  final AppDatabase _database;
  final IdGenerator _ids;

  Future<Pet> getOrCreatePrimary() async {
    final existing =
        await (_database.select(_database.pets)
              ..where((t) => t.id.equals(defaultPetId)))
            .getSingleOrNull();
    if (existing != null) return existing;

    final now = DateTime.now();
    await _database
        .into(_database.pets)
        .insert(
          PetsCompanion.insert(
            id: defaultPetId,
            createdAt: now,
            updatedAt: now,
          ),
        );
    return (_database.select(_database.pets)
          ..where((t) => t.id.equals(defaultPetId)))
        .getSingle();
  }

  Future<PetView> getPetView() async {
    final pet = await getOrCreatePrimary();
    final history =
        await (_database.select(_database.petEvolutionHistory)
              ..where((t) => t.petId.equals(pet.id))
              ..orderBy([(t) => OrderingTerm.asc(t.evolvedAt)]))
            .get();
    return PetView(pet: pet, evolutionHistory: history);
  }

  Future<void> feedTreat(DateTime now) async {
    await _database.transaction(() async {
      final pet = await getOrCreatePrimary();
      final pv = PetView(pet: pet, evolutionHistory: const []);
      if (pv.isTreatOnCooldown(now)) {
        throw CooldownException('treat', pv.treatCooldownRemaining(now));
      }
      final newEnergy = (pet.energyPercent + energyTreat).clamp(0.0, 1.0);
      await (_database.update(_database.pets)
            ..where((t) => t.id.equals(pet.id)))
          .write(
            PetsCompanion(
              bondXp: Value(pet.bondXp + bondXpTreat),
              energyPercent: Value(newEnergy),
              mood: const Value('happy'),
              lastTreatAt: Value(now),
              updatedAt: Value(now),
            ),
          );
      final updated = await getOrCreatePrimary();
      final adventurerLevel = await _currentAdventurerLevel();
      await _advanceBondXp(updated, 0, adventurerLevel, now);
    });
  }

  Future<void> play(DateTime now) async {
    await _database.transaction(() async {
      final pet = await getOrCreatePrimary();
      final pv = PetView(pet: pet, evolutionHistory: const []);
      if (pv.isPlayOnCooldown(now)) {
        throw CooldownException('play', pv.playCooldownRemaining(now));
      }
      await (_database.update(_database.pets)
            ..where((t) => t.id.equals(pet.id)))
          .write(
            PetsCompanion(
              bondXp: Value(pet.bondXp + bondXpPlay),
              mood: const Value('excited'),
              lastPlayAt: Value(now),
              updatedAt: Value(now),
            ),
          );
      final updated = await getOrCreatePrimary();
      final adventurerLevel = await _currentAdventurerLevel();
      await _advanceBondXp(updated, 0, adventurerLevel, now);
    });
  }

  Future<void> rest(DateTime now) async {
    await _database.transaction(() async {
      final pet = await getOrCreatePrimary();
      final pv = PetView(pet: pet, evolutionHistory: const []);
      if (pv.isRestOnCooldown(now)) {
        throw CooldownException('rest', pv.restCooldownRemaining(now));
      }
      final newEnergy = (pet.energyPercent + energyRest).clamp(0.0, 1.0);
      await (_database.update(_database.pets)
            ..where((t) => t.id.equals(pet.id)))
          .write(
            PetsCompanion(
              energyPercent: Value(newEnergy),
              mood: const Value('content'),
              lastRestAt: Value(now),
              updatedAt: Value(now),
            ),
          );
    });
  }

  // Called from inside XpEventService._recordXpReward's transaction.
  // Must NOT open its own transaction.
  Future<PetBondChange> processFitnessEvent({
    required String fitnessType,
    required DateTime occurredAt,
    required int adventurerLevel,
  }) async {
    int xpToAdd;
    String newMood;
    double? energyDelta;

    switch (fitnessType) {
      case FitnessEventType.workoutCompleted:
        xpToAdd = bondXpWorkout;
        newMood = 'proud';
        energyDelta = 0.1;
      case FitnessEventType.runLogged:
        xpToAdd = bondXpRun;
        newMood = 'excited';
      case FitnessEventType.bodyweightLogged:
        xpToAdd = bondXpBodyweight;
        newMood = 'content';
      default:
        return PetBondChange.noChange;
    }

    final pet = await getOrCreatePrimary();
    final levelBefore = pet.bondLevel;

    final energyUpdate =
        energyDelta != null
            ? Value((pet.energyPercent + energyDelta).clamp(0.0, 1.0))
            : const Value<double>.absent();

    await (_database.update(_database.pets)
          ..where((t) => t.id.equals(pet.id)))
        .write(
          PetsCompanion(
            mood: Value(newMood),
            energyPercent: energyUpdate,
            updatedAt: Value(occurredAt),
          ),
        );

    final refreshed = await getOrCreatePrimary();
    final change = await _advanceBondXp(
      refreshed,
      xpToAdd,
      adventurerLevel,
      occurredAt,
    );

    return PetBondChange(
      bondXpGained: xpToAdd,
      bondLevelBefore: levelBefore,
      bondLevelAfter: change.bondLevelAfter,
      evolved: change.evolved,
      evolutionStageAfter: change.evolutionStageAfter,
      newMood: newMood,
    );
  }

  Future<int> _currentAdventurerLevel() async {
    final adventurer =
        await (_database.select(_database.adventurers)).getSingleOrNull();
    return adventurer?.level ?? 1;
  }

  Future<PetBondChange> _advanceBondXp(
    Pet pet,
    int xpToAdd,
    int adventurerLevel,
    DateTime now,
  ) async {
    final levelBefore = pet.bondLevel;
    final stageBefore = pet.evolutionStage;

    var bondXpCurrent = pet.bondXp + xpToAdd;
    var bondLevel = pet.bondLevel;
    var evolutionStage = pet.evolutionStage;
    var evolved = false;

    while (bondLevel < bondLevelThresholds.length &&
        bondXpCurrent >= bondLevelThresholds[bondLevel]) {
      bondXpCurrent -= bondLevelThresholds[bondLevel];
      bondLevel++;
    }

    if (evolutionStage < 4) {
      final threshold = evolutionThresholds[evolutionStage];
      if (bondLevel >= threshold.$1 && adventurerLevel >= threshold.$2) {
        await _recordEvolution(pet.id, evolutionStage, evolutionStage + 1, now);
        evolutionStage++;
        evolved = true;
      }
    }

    await (_database.update(_database.pets)
          ..where((t) => t.id.equals(pet.id)))
        .write(
          PetsCompanion(
            bondXp: Value(bondXpCurrent),
            bondLevel: Value(bondLevel),
            evolutionStage: Value(evolutionStage),
            updatedAt: Value(now),
          ),
        );

    return PetBondChange(
      bondXpGained: xpToAdd,
      bondLevelBefore: levelBefore,
      bondLevelAfter: bondLevel,
      evolved: evolved,
      evolutionStageAfter: evolved ? evolutionStage : stageBefore,
      newMood: pet.mood,
    );
  }

  Future<void> _recordEvolution(
    String petId,
    int fromStage,
    int toStage,
    DateTime now,
  ) async {
    await _database
        .into(_database.petEvolutionHistory)
        .insert(
          PetEvolutionHistoryCompanion.insert(
            id: _ids.nextId(),
            petId: petId,
            fromStage: fromStage,
            toStage: toStage,
            evolvedAt: now,
          ),
        );
  }
}

// ─── Domain types ─────────────────────────────────────────────────────────────

class PetBondChange {
  const PetBondChange({
    required this.bondXpGained,
    required this.bondLevelBefore,
    required this.bondLevelAfter,
    required this.evolved,
    required this.evolutionStageAfter,
    required this.newMood,
  });

  final int bondXpGained;
  final int bondLevelBefore;
  final int bondLevelAfter;
  final bool evolved;
  final int evolutionStageAfter;
  final String newMood;

  static const PetBondChange noChange = PetBondChange(
    bondXpGained: 0,
    bondLevelBefore: 0,
    bondLevelAfter: 0,
    evolved: false,
    evolutionStageAfter: 0,
    newMood: 'content',
  );

  bool get bondLeveledUp => bondLevelAfter > bondLevelBefore;
}

class PetView {
  const PetView({required this.pet, required this.evolutionHistory});

  final Pet pet;
  final List<PetEvolutionHistoryData> evolutionHistory;

  int get bondXpToNext => bondLevelThresholds[pet.bondLevel.clamp(0, 4)];
  double get bondProgress =>
      bondXpToNext <= 0 ? 1.0 : (pet.bondXp / bondXpToNext).clamp(0.0, 1.0);
  String get stageName => stageNames[pet.evolutionStage.clamp(0, 4)];

  bool isTreatOnCooldown(DateTime now) =>
      pet.lastTreatAt != null &&
      now.difference(pet.lastTreatAt!) < cooldownTreat;
  bool isPlayOnCooldown(DateTime now) =>
      pet.lastPlayAt != null && now.difference(pet.lastPlayAt!) < cooldownPlay;
  bool isRestOnCooldown(DateTime now) =>
      pet.lastRestAt != null && now.difference(pet.lastRestAt!) < cooldownRest;

  Duration treatCooldownRemaining(DateTime now) =>
      isTreatOnCooldown(now)
          ? cooldownTreat - now.difference(pet.lastTreatAt!)
          : Duration.zero;
  Duration playCooldownRemaining(DateTime now) =>
      isPlayOnCooldown(now)
          ? cooldownPlay - now.difference(pet.lastPlayAt!)
          : Duration.zero;
  Duration restCooldownRemaining(DateTime now) =>
      isRestOnCooldown(now)
          ? cooldownRest - now.difference(pet.lastRestAt!)
          : Duration.zero;
}

class CooldownException implements Exception {
  const CooldownException(this.action, this.remaining);

  final String action;
  final Duration remaining;

  String get timeLabel {
    final h = remaining.inHours;
    final m = remaining.inMinutes % 60;
    return h > 0 ? '${h}h ${m}m' : '${m}m';
  }
}
