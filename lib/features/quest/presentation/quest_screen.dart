import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/repositories/repositories.dart';
import '../application/achievement_controller.dart';
import '../application/adventurer_profile_controller.dart';
import '../application/equipment_controller.dart';
import '../application/pet_controller.dart';
import '../../../shared/presentation/design_system/design_system.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  static const routeName = 'quest';
  static const routePath = '/quest';

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: switch (_selectedTab) {
          0 => _AdventurerView(
            selectedTab: _selectedTab,
            onTabChanged: (i) => setState(() => _selectedTab = i),
          ),
          1 => _PetView(
            selectedTab: _selectedTab,
            onTabChanged: (i) => setState(() => _selectedTab = i),
          ),
          2 => _QuestsView(
            selectedTab: _selectedTab,
            onTabChanged: (i) => setState(() => _selectedTab = i),
          ),
          3 => _AchievementsView(
            selectedTab: _selectedTab,
            onTabChanged: (i) => setState(() => _selectedTab = i),
          ),
          4 => _EquipmentView(
            selectedTab: _selectedTab,
            onTabChanged: (i) => setState(() => _selectedTab = i),
          ),
          _ => _ExpeditionsView(
            selectedTab: _selectedTab,
            onTabChanged: (i) => setState(() => _selectedTab = i),
          ),
        },
      ),
    );
  }
}

const _questTabs = [
  'Hero',
  'Pet',
  'Quests',
  'Achievements',
  'Equipment',
  'Expeditions',
];

// ─── Sub-tab bar ──────────────────────────────────────────────────────────────

class _QuestTabBar extends StatelessWidget {
  const _QuestTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        itemCount: tabs.length,
        separatorBuilder: (_, _) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final selected = i == selectedIndex;
          return GestureDetector(
            onTap: () => onTabChanged(i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: selected ? AppColors.surface3 : Colors.transparent,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: selected ? AppColors.outline : Colors.transparent,
                ),
              ),
              child: Text(
                tabs[i],
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: selected ? AppColors.ink : AppColors.inkDim,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Adventurer (Hero tab) ────────────────────────────────────────────────────

class _PreviewNotice extends StatelessWidget {
  const _PreviewNotice({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(
            Icons.visibility_outlined,
            size: 18,
            color: AppColors.rune,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: AppColors.inkMute),
            ),
          ),
        ],
      ),
    );
  }
}

class _AdventurerView extends ConsumerWidget {
  const _AdventurerView({
    required this.selectedTab,
    required this.onTabChanged,
  });

  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(adventurerProfileProvider);

    return profile.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: QfCard(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Unable to load Adventurer profile: $error',
              style: const TextStyle(color: AppColors.inkMute),
            ),
          ),
        ),
      ),
      data: (profile) => _AdventurerContent(
        profile: profile,
        onTabChanged: onTabChanged,
        onGrantXp: () async {
          await ref.read(adventurerXpControllerProvider).grantTestXp();
          if (context.mounted) QfNotification.show(context, '+125 XP gained');
        },
      ),
    );
  }
}

class _AdventurerContent extends StatelessWidget {
  const _AdventurerContent({
    required this.profile,
    required this.onTabChanged,
    required this.onGrantXp,
  });

  final AdventurerProfile profile;
  final ValueChanged<int> onTabChanged;
  final VoidCallback onGrantXp;

  @override
  Widget build(BuildContext context) {
    final adventurer = profile.adventurer;
    final attrs = [
      _Attr('MIGHT', adventurer.might, AppColors.ember),
      _Attr('ENDURANCE', adventurer.endurance, AppColors.sky),
      _Attr('DISCIPLINE', adventurer.discipline, AppColors.forest),
      _Attr('VITALITY', adventurer.vitality, AppColors.rose),
      _Attr('AGILITY', adventurer.agility, AppColors.gold),
      _Attr('WISDOM', adventurer.wisdom, AppColors.rune),
    ];

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        QfScreenHeader(
          salutation: 'The Adventurer',
          title: adventurer.name,
          trailing: const Icon(
            Icons.settings_outlined,
            size: 18,
            color: AppColors.inkMute,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 12),
          child: _PreviewNotice(
            text:
                'Adventurer, Achievements, and Equipment are live. Pet, Quests, and Expeditions arrive in later milestones.',
          ),
        ),
        _QuestTabBar(
          tabs: _questTabs,
          selectedIndex: 0,
          onTabChanged: onTabChanged,
        ),
        const SizedBox(height: 12),

        // Portrait + stats card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: QfCard(
            variant: QfCardVariant.embossed,
            ornamentCorners: true,
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PortraitPlaceholder(),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CLASS · ${adventurer.selectedClass.toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.rune,
                          letterSpacing: 0.16 * 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        adventurer.name,
                        style: AppTheme.fantasyStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 1.15,
                        ),
                      ),
                      Text(
                        adventurer.currentTitle,
                        style: AppTheme.fantasyStyle(
                          fontSize: 11,
                          color: AppColors.inkDim,
                          italic: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          QfPill(
                            tone: QfPillTone.gold,
                            icon: const Icon(Icons.workspace_premium),
                            child: Text('LV ${adventurer.level}'),
                          ),
                          const SizedBox(width: 8),
                          QfPill(
                            tone: QfPillTone.muted,
                            child: Text('${adventurer.xp} XP'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _QfBar(value: profile.xpProgress, tone: _BarTone.ember),
                      const SizedBox(height: 4),
                      Text(
                        '${adventurer.xp} / ${profile.xpToNextLevel} XP to level ${adventurer.level + 1}',
                        style: AppTheme.monoStyle(
                          fontSize: 10,
                          color: AppColors.inkDim,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FilledButton.icon(
                          key: const Key('grant-adventurer-xp-button'),
                          onPressed: onGrantXp,
                          icon: const Icon(Icons.bolt, size: 16),
                          label: const Text('Gain 125 XP'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const QfSectionHeader(title: 'Attributes'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2.5,
            children: [for (final a in attrs) _AttrCard(attr: a)],
          ),
        ),

        QfSectionHeader(title: 'Equipped', moreLabel: 'Inventory'),
        _EquippedGearGrid(onOpenInventory: () => onTabChanged(4)),

        _RecentAchievementsStrip(onSeeAll: () => onTabChanged(3)),

        const SizedBox(height: 24),
      ],
    );
  }
}

// ─── Pet view ─────────────────────────────────────────────────────────────────

class _RecentAchievementsStrip extends ConsumerWidget {
  const _RecentAchievementsStrip({required this.onSeeAll});

  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievements = ref.watch(achievementGalleryProvider);

    return achievements.when(
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: LinearProgressIndicator(color: AppColors.forest),
      ),
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Text(
          'Unable to load achievements: $error',
          style: const TextStyle(color: AppColors.inkMute),
        ),
      ),
      data: (items) {
        final unlocked = items.where((item) => item.state.isUnlocked).toList()
          ..sort((a, b) {
            final aTime =
                a.state.unlockedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
            final bTime =
                b.state.unlockedAt ?? DateTime.fromMillisecondsSinceEpoch(0);
            return bTime.compareTo(aTime);
          });
        final display = unlocked.isEmpty
            ? items.take(4).toList()
            : unlocked.take(4).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QfSectionHeader(
              title: 'Recent Achievements',
              moreLabel: 'See all · ${items.length}',
            ),
            SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemBuilder: (context, index) {
                  final item = display[index];
                  return GestureDetector(
                    onTap: onSeeAll,
                    child: _AchievementBadge(
                      icon: _achievementIcon(item.achievement.category),
                      tone: _achievementTone(item.achievement.category),
                      name: item.achievement.name,
                      desc: item.state.isUnlocked
                          ? 'Unlocked'
                          : '${item.state.currentValue}/${item.achievement.targetValue}',
                    ),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(width: 10),
                itemCount: display.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _EquippedGearGrid extends ConsumerWidget {
  const _EquippedGearGrid({required this.onOpenInventory});

  final VoidCallback onOpenInventory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(equipmentInventoryProvider);

    return inventory.when(
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: LinearProgressIndicator(color: AppColors.rune),
      ),
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Text(
          'Unable to load equipment: $error',
          style: const TextStyle(color: AppColors.inkMute),
        ),
      ),
      data: (view) {
        final slots = [
          EquipmentSlotId.weapon,
          EquipmentSlotId.offHand,
          EquipmentSlotId.helmet,
          EquipmentSlotId.chest,
          EquipmentSlotId.gloves,
          EquipmentSlotId.boots,
          EquipmentSlotId.trinket,
          EquipmentSlotId.cloak,
        ];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final slot in slots)
                GestureDetector(
                  onTap: onOpenInventory,
                  child: _EquipSlot(
                    icon: _equippedIcon(view, slot),
                    tone: AppColors.rune,
                    tag: _slotTag(slot),
                    unlocked: view.equippedSlots.containsKey(slot),
                    locked: !view.equipment.any(
                      (item) => item.definition.slot == slot && item.isUnlocked,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  IconData? _equippedIcon(EquipmentInventoryView view, String slot) {
    final equipped = view.equippedSlots[slot];
    if (equipped == null) return null;
    EquipmentItemView? item;
    for (final candidate in view.equipment) {
      if (candidate.definition.id == equipped.equipmentId) {
        item = candidate;
        break;
      }
    }
    return item == null ? null : _equipmentIcon(item.definition.iconKey);
  }
}

class _EquipmentView extends ConsumerWidget {
  const _EquipmentView({required this.selectedTab, required this.onTabChanged});

  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventory = ref.watch(equipmentInventoryProvider);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const QfScreenHeader(
          salutation: 'The Armory',
          title: 'Equipment',
          trailing: Icon(Icons.shield_outlined, color: AppColors.rune),
        ),
        _QuestTabBar(
          tabs: _questTabs,
          selectedIndex: selectedTab,
          onTabChanged: onTabChanged,
        ),
        const SizedBox(height: 12),
        inventory.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(18),
            child: LinearProgressIndicator(color: AppColors.rune),
          ),
          error: (error, stackTrace) => Padding(
            padding: const EdgeInsets.all(18),
            child: QfCard(
              padding: const EdgeInsets.all(14),
              child: Text(
                'Equipment could not be loaded: $error',
                style: const TextStyle(color: AppColors.inkMute),
              ),
            ),
          ),
          data: (view) => _EquipmentContent(view: view),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _EquipmentContent extends ConsumerWidget {
  const _EquipmentContent({required this.view});

  final EquipmentInventoryView view;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlockedGear = view.equipment.where((item) => item.isUnlocked).length;
    final unlockedTitles = view.titles.where((item) => item.isUnlocked).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: QfCard(
            variant: QfCardVariant.embossed,
            ornamentCorners: true,
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                const Icon(Icons.inventory_2_outlined, color: AppColors.gold),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$unlockedGear / ${view.equipment.length} gear pieces  ·  '
                    '$unlockedTitles / ${view.titles.length} titles',
                    style: AppTheme.fantasyStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const QfSectionHeader(title: 'Gear'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              for (final item in view.equipment) ...[
                _EquipmentListTile(item: item),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        const QfSectionHeader(title: 'Titles'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              for (final title in view.titles) ...[
                _TitleListTile(item: title),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _EquipmentListTile extends ConsumerWidget {
  const _EquipmentListTile({required this.item});

  final EquipmentItemView item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locked = !item.isUnlocked;
    return Opacity(
      opacity: locked ? 0.55 : 1,
      child: QfCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _RewardIcon(
              icon: locked
                  ? Icons.lock_outline
                  : _equipmentIcon(item.definition.iconKey),
              tone: locked ? AppColors.inkFaint : AppColors.rune,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.definition.name,
                    style: AppTheme.fantasyStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    locked
                        ? 'Locked · ${_slotLabel(item.definition.slot)}'
                        : '${_slotLabel(item.definition.slot)} · ${item.definition.description}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.inkMute,
                    ),
                  ),
                ],
              ),
            ),
            if (item.isEquipped)
              const QfPill(tone: QfPillTone.gold, child: Text('EQUIPPED'))
            else if (!locked)
              TextButton(
                key: ValueKey('equip-${item.definition.id}'),
                onPressed: () async {
                  await ref
                      .read(equipmentControllerProvider)
                      .equip(item.definition.id);
                  if (context.mounted) {
                    QfNotification.show(
                      context,
                      'Equipped ${item.definition.name}',
                    );
                  }
                },
                child: const Text('Equip'),
              ),
          ],
        ),
      ),
    );
  }
}

class _TitleListTile extends ConsumerWidget {
  const _TitleListTile({required this.item});

  final TitleItemView item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locked = !item.isUnlocked;
    return Opacity(
      opacity: locked ? 0.55 : 1,
      child: QfCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _RewardIcon(
              icon: locked
                  ? Icons.lock_outline
                  : Icons.workspace_premium_outlined,
              tone: locked ? AppColors.inkFaint : AppColors.gold,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.definition.name,
                    style: AppTheme.fantasyStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    locked
                        ? 'Unlocks at level ${item.definition.requiredLevel}'
                        : item.definition.description,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.inkMute,
                    ),
                  ),
                ],
              ),
            ),
            if (item.isSelected)
              const QfPill(tone: QfPillTone.gold, child: Text('ACTIVE'))
            else if (!locked)
              TextButton(
                key: ValueKey('select-title-${item.definition.id}'),
                onPressed: () async {
                  await ref
                      .read(equipmentControllerProvider)
                      .selectTitle(item.definition.id);
                  if (context.mounted) {
                    QfNotification.show(context, 'Title selected');
                  }
                },
                child: const Text('Select'),
              ),
          ],
        ),
      ),
    );
  }
}

class _RewardIcon extends StatelessWidget {
  const _RewardIcon({required this.icon, required this.tone});

  final IconData icon;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.surface3,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.outline),
      ),
      child: Icon(icon, color: tone, size: 20),
    );
  }
}

IconData _equipmentIcon(String iconKey) {
  return switch (iconKey) {
    'directions_run' => Icons.directions_run,
    'monitor_weight' => Icons.monitor_weight_outlined,
    'back_hand' => Icons.back_hand_outlined,
    'shield_moon' => Icons.shield_moon_outlined,
    'security' => Icons.security,
    'workspace_premium' => Icons.workspace_premium,
    _ => Icons.fitness_center,
  };
}

String _slotLabel(String slot) {
  return switch (slot) {
    EquipmentSlotId.weapon => 'Weapon',
    EquipmentSlotId.offHand => 'Off-hand',
    EquipmentSlotId.helmet => 'Helmet',
    EquipmentSlotId.chest => 'Chest',
    EquipmentSlotId.gloves => 'Gloves',
    EquipmentSlotId.boots => 'Boots',
    EquipmentSlotId.trinket => 'Trinket',
    EquipmentSlotId.cloak => 'Cloak',
    _ => slot,
  };
}

String _slotTag(String slot) {
  return switch (slot) {
    EquipmentSlotId.weapon => 'wpn',
    EquipmentSlotId.offHand => 'off',
    EquipmentSlotId.helmet => 'hlm',
    EquipmentSlotId.chest => 'cht',
    EquipmentSlotId.gloves => 'glv',
    EquipmentSlotId.boots => 'bts',
    EquipmentSlotId.trinket => 'trk',
    EquipmentSlotId.cloak => 'clk',
    _ => slot,
  };
}

class _AchievementsView extends ConsumerWidget {
  const _AchievementsView({
    required this.selectedTab,
    required this.onTabChanged,
  });

  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievements = ref.watch(achievementGalleryProvider);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const QfScreenHeader(
          salutation: 'The Chronicle',
          title: 'Achievements',
          trailing: Icon(Icons.workspace_premium, color: AppColors.gold),
        ),
        _QuestTabBar(
          tabs: _questTabs,
          selectedIndex: selectedTab,
          onTabChanged: onTabChanged,
        ),
        const SizedBox(height: 12),
        achievements.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(18),
            child: LinearProgressIndicator(color: AppColors.forest),
          ),
          error: (error, stackTrace) => Padding(
            padding: const EdgeInsets.all(18),
            child: QfCard(
              padding: const EdgeInsets.all(14),
              child: Text(
                'Achievements could not be loaded: $error',
                style: const TextStyle(color: AppColors.inkMute),
              ),
            ),
          ),
          data: (items) {
            final unlockedCount = items
                .where((item) => item.state.isUnlocked)
                .length;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: QfCard(
                    variant: QfCardVariant.embossed,
                    ornamentCorners: true,
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        const Icon(Icons.emoji_events, color: AppColors.gold),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$unlockedCount / ${items.length} unlocked',
                                style: AppTheme.fantasyStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.ink,
                                ),
                              ),
                              const Text(
                                'Progress updates from workouts, runs, bodyweight logs, PRs, and goal milestones.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.inkMute,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      for (final item in items) ...[
                        _AchievementProgressCard(item: item),
                        const SizedBox(height: 10),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _AchievementProgressCard extends StatelessWidget {
  const _AchievementProgressCard({required this.item});

  final AchievementStateView item;

  @override
  Widget build(BuildContext context) {
    final unlocked = item.state.isUnlocked;
    final category = item.achievement.category;
    final tone = _achievementTone(category);

    return QfCard(
      variant: unlocked ? QfCardVariant.embossed : QfCardVariant.raised,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: unlocked
                  ? tone.withValues(alpha: 0.16)
                  : AppColors.surface3,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: unlocked ? tone : AppColors.outline),
            ),
            child: Icon(
              unlocked ? Icons.workspace_premium : _achievementIcon(category),
              color: unlocked ? tone : AppColors.inkDim,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.achievement.name,
                  style: AppTheme.fantasyStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  item.achievement.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.inkMute,
                  ),
                ),
                const SizedBox(height: 8),
                _QfBar(value: item.progress, color: tone),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            unlocked
                ? 'DONE'
                : '${item.state.currentValue}/${item.achievement.targetValue}',
            style: AppTheme.monoStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: unlocked ? tone : AppColors.inkDim,
            ),
          ),
        ],
      ),
    );
  }
}

IconData _achievementIcon(String category) {
  return switch (category) {
    'cardio' => Icons.directions_run,
    'body' => Icons.monitor_weight_outlined,
    'consistency' => Icons.flag,
    'goals' => Icons.track_changes,
    _ => Icons.fitness_center,
  };
}

Color _achievementTone(String category) {
  return switch (category) {
    'cardio' => AppColors.sky,
    'body' => AppColors.rose,
    'consistency' => AppColors.forest,
    'goals' => AppColors.gold,
    _ => AppColors.ember,
  };
}

class _PetView extends ConsumerWidget {
  const _PetView({required this.selectedTab, required this.onTabChanged});

  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petAsync = ref.watch(petProvider);

    return petAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: QfCard(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Unable to load pet: $error',
              style: const TextStyle(color: AppColors.inkMute),
            ),
          ),
        ),
      ),
      data: (pv) => _PetContent(
        pv: pv,
        selectedTab: selectedTab,
        onTabChanged: onTabChanged,
        onFeedTreat: () => _onCareAction(
          context,
          ref,
          () => ref.read(petControllerProvider).feedTreat(),
          'Treat given! +$bondXpTreat bond XP',
        ),
        onPlay: () => _onCareAction(
          context,
          ref,
          () => ref.read(petControllerProvider).play(),
          'Played with Ember! +$bondXpPlay bond XP',
        ),
        onRest: () => _onCareAction(
          context,
          ref,
          () => ref.read(petControllerProvider).rest(),
          'Ember is resting…',
        ),
      ),
    );
  }

  Future<void> _onCareAction(
    BuildContext context,
    WidgetRef ref,
    Future<void> Function() action,
    String successMsg,
  ) async {
    try {
      await action();
      if (context.mounted) QfNotification.show(context, successMsg);
    } on CooldownException catch (e) {
      if (context.mounted) {
        QfNotification.show(
          context,
          '${e.action} on cooldown — ${e.timeLabel} remaining',
        );
      }
    }
  }
}

class _PetContent extends StatelessWidget {
  const _PetContent({
    required this.pv,
    required this.selectedTab,
    required this.onTabChanged,
    required this.onFeedTreat,
    required this.onPlay,
    required this.onRest,
  });

  final PetView pv;
  final int selectedTab;
  final ValueChanged<int> onTabChanged;
  final VoidCallback onFeedTreat;
  final VoidCallback onPlay;
  final VoidCallback onRest;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        QfScreenHeader(
          salutation: 'The Companion',
          title: pv.pet.name,
          trailing: QfPill(
            tone: QfPillTone.ember,
            child: Text('${pv.stageName} · Bond ${pv.pet.bondLevel}'),
          ),
        ),
        _QuestTabBar(
          tabs: _questTabs,
          selectedIndex: 1,
          onTabChanged: onTabChanged,
        ),
        const SizedBox(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _HabitatScene(name: pv.pet.name, mood: pv.pet.mood),
        ),

        const SizedBox(height: 14),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.3,
            children: [
              _PetStatCard(label: 'BOND', stars: pv.pet.bondLevel),
              _PetStatMoodCard(
                label: 'MOOD',
                mood: _capitalize(pv.pet.mood),
              ),
              _PetStatBarCard(
                label: 'ENERGY',
                value: pv.pet.energyPercent,
                display: '${(pv.pet.energyPercent * 100).round()}%',
                tone: AppColors.sky,
              ),
              _PetStatBarCard(
                label: 'GROWTH',
                value: pv.bondProgress,
                display: 'Stage ${pv.pet.evolutionStage + 1}/5',
                tone: AppColors.gold,
              ),
            ],
          ),
        ),

        const QfSectionHeader(title: 'Care Actions'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Expanded(
                child: _CareButton(
                  icon: Icons.coffee,
                  label: 'Treat',
                  onCooldown: pv.isTreatOnCooldown(now),
                  onTap: onFeedTreat,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _CareButton(
                  icon: Icons.pets,
                  label: 'Play',
                  onCooldown: pv.isPlayOnCooldown(now),
                  onTap: onPlay,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _CareButton(
                  icon: Icons.bedtime_outlined,
                  label: 'Rest',
                  onCooldown: pv.isRestOnCooldown(now),
                  onTap: onRest,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _CareButton(
                  icon: Icons.home_outlined,
                  label: 'Habitat',
                  onCooldown: false,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),

        const QfSectionHeader(title: 'Evolution Path'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: QfCard(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                _EvolutionPath(currentStage: pv.pet.evolutionStage),
                const SizedBox(height: 12),
                Text(
                  _nextEvolutionHint(pv.pet.evolutionStage),
                  textAlign: TextAlign.center,
                  style: AppTheme.fantasyStyle(
                    fontSize: 11,
                    color: AppColors.inkMute,
                    italic: true,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }

  String _nextEvolutionHint(int stage) {
    if (stage >= 4) return 'Ember has reached the pinnacle of evolution.';
    final t = evolutionThresholds[stage];
    final nextName = stageNames[stage + 1];
    return 'Reach Bond ${t.$1} + Adventurer Lv ${t.$2} to evolve into $nextName.';
  }
}

String _capitalize(String s) =>
    s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

class _CareButton extends StatelessWidget {
  const _CareButton({
    required this.icon,
    required this.label,
    required this.onCooldown,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool onCooldown;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onCooldown ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: onTap,
        child: QfCard(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surface3,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.outline),
                ),
                child: Icon(icon, size: 16, color: AppColors.inkMute),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HabitatScene extends StatelessWidget {
  const _HabitatScene({this.name = 'Ember', this.mood = 'content'});

  final String name;
  final String mood;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.outline),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A2A22), Color(0xFF243A30), Color(0xFF2C3D33)],
            stops: [0, 0.6, 1],
          ),
        ),
        child: Stack(
          children: [
            // Moon
            Positioned(
              top: 18,
              right: 24,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [AppColors.gold, Color(0xFFB7791F)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gold.withValues(alpha: 0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
            ),
            // Scene label
            const Positioned(
              top: 12,
              left: 14,
              child: Text(
                'THE OLD CAMP',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.rune,
                  letterSpacing: 0.16 * 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Pet in center
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.outline),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1A2A0A), Color(0xFF2A3A1A)],
                    ),
                  ),
                  child: const Icon(
                    Icons.pets,
                    color: AppColors.ember,
                    size: 32,
                  ),
                ),
              ),
            ),
            // Campfire
            const Positioned(
              bottom: 65,
              left: 80,
              child: Icon(
                Icons.local_fire_department,
                color: AppColors.ember,
                size: 28,
              ),
            ),
            // Flavor text
            Positioned(
              bottom: 8,
              right: 12,
              child: Text(
                '"…$name looks $mood."',
                style: AppTheme.fantasyStyle(
                  fontSize: 10,
                  color: AppColors.inkDim,
                  italic: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EvolutionPath extends StatelessWidget {
  const _EvolutionPath({this.currentStage = 0});

  final int currentStage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < stageNames.length; i++) ...[
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == currentStage
                      ? AppColors.ember
                      : i < currentStage
                      ? AppColors.surface3
                      : AppColors.bgDeep,
                  border: Border.all(
                    color: i == currentStage
                        ? AppColors.ember
                        : i < currentStage
                        ? AppColors.outline
                        : AppColors.outlineSoft,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${i + 1}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: i == currentStage
                          ? AppColors.bgDeep
                          : i < currentStage
                          ? AppColors.inkMute
                          : AppColors.inkFaint,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stageNames[i],
                style: TextStyle(
                  fontSize: 9,
                  color: i == currentStage
                      ? AppColors.ember
                      : i < currentStage
                      ? AppColors.inkMute
                      : AppColors.inkFaint,
                  fontWeight:
                      i == currentStage ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
          if (i < stageNames.length - 1)
            Expanded(
              child: Container(
                height: 1,
                margin: const EdgeInsets.only(bottom: 22),
                color: i < currentStage
                    ? AppColors.ember
                    : AppColors.outlineSoft,
              ),
            ),
        ],
      ],
    );
  }
}

// ─── Quests view (placeholder — Milestone 5+) ─────────────────────────────────

class _QuestsView extends StatelessWidget {
  const _QuestsView({required this.selectedTab, required this.onTabChanged});

  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const QfScreenHeader(
          salutation: 'The Board',
          title: 'Quests',
          trailing: Icon(Icons.flag_outlined, color: AppColors.rune),
        ),
        _QuestTabBar(
          tabs: _questTabs,
          selectedIndex: selectedTab,
          onTabChanged: onTabChanged,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: QfCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Icon(Icons.flag_outlined, size: 40, color: AppColors.rune),
                const SizedBox(height: 12),
                const Text(
                  'Quest Board',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Story quests, daily challenges, and campaign objectives arrive in a later milestone.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.inkMute),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

// ─── Expeditions view ─────────────────────────────────────────────────────────

class _ExpeditionsView extends StatelessWidget {
  const _ExpeditionsView({
    required this.selectedTab,
    required this.onTabChanged,
  });

  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        QfScreenHeader(
          salutation: 'The Wilds',
          title: 'Expeditions',
          trailing: QfPill(
            tone: QfPillTone.gold,
            icon: const Icon(Icons.auto_awesome, size: 11),
            child: Text('1,240', style: AppTheme.monoStyle(fontSize: 11)),
          ),
        ),
        _QuestTabBar(
          tabs: _questTabs,
          selectedIndex: selectedTab,
          onTabChanged: onTabChanged,
        ),
        const SizedBox(height: 12),

        // Active expedition
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: QfCard(
            variant: QfCardVariant.embossed,
            ornamentCorners: true,
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'IN PROGRESS',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.rune,
                              letterSpacing: 0.16 * 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Patrol the Old Road',
                            style: AppTheme.fantasyStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.surface3,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.outline),
                      ),
                      child: const Icon(Icons.terrain, color: AppColors.forest),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _QfBar(value: 0.68),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Returning in',
                      style: TextStyle(fontSize: 11, color: AppColors.inkDim),
                    ),
                    Text(
                      '3h 12m',
                      style: AppTheme.monoStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.forest,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Recall'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.local_fire_department, size: 14),
                        label: const Text('Heroic Boost'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        QfRuneDivider(label: 'Available Expeditions'),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              for (final exped in _expeditions) ...[
                _ExpeditionCard(exped: exped),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  static const _expeditions = [
    _Expedition(
      name: 'Explore the Ironwood',
      desc: 'Strength · 6h',
      power: '180/220',
      icon: Icons.terrain,
      tone: AppColors.ember,
      rewards: ['gear shard', 'crafting'],
      locked: false,
    ),
    _Expedition(
      name: 'Run the Moonlit Trail',
      desc: 'Cardio · 4h',
      power: '120/160',
      icon: Icons.directions_run,
      tone: AppColors.sky,
      rewards: ['lore', 'pet treat'],
      locked: false,
    ),
    _Expedition(
      name: 'Defend the Campfire',
      desc: 'Recovery · 8h',
      power: '90/100',
      icon: Icons.spa_outlined,
      tone: AppColors.forest,
      rewards: ['gold', 'habitat'],
      locked: false,
    ),
    _Expedition(
      name: 'Delve the Forgotten Gym',
      desc: 'Milestone · 12h',
      power: '— / 300',
      icon: Icons.local_fire_department,
      tone: AppColors.gold,
      rewards: ['title', 'cosmetic'],
      locked: true,
    ),
  ];
}

class _Expedition {
  const _Expedition({
    required this.name,
    required this.desc,
    required this.power,
    required this.icon,
    required this.tone,
    required this.rewards,
    required this.locked,
  });

  final String name;
  final String desc;
  final String power;
  final IconData icon;
  final Color tone;
  final List<String> rewards;
  final bool locked;
}

class _ExpeditionCard extends StatelessWidget {
  const _ExpeditionCard({required this.exped});

  final _Expedition exped;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: exped.locked ? 0.55 : 1.0,
      child: QfCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.outline),
              ),
              child: Icon(
                exped.locked ? Icons.lock_outline : exped.icon,
                color: exped.locked ? AppColors.inkFaint : exped.tone,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exped.name,
                    style: AppTheme.fantasyStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                  Text(
                    exped.desc,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.inkDim,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    children: [
                      for (final r in exped.rewards)
                        QfPill(
                          tone: QfPillTone.muted,
                          child: Text(r, style: const TextStyle(fontSize: 9)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'POWER',
                  style: TextStyle(
                    fontSize: 9,
                    color: AppColors.inkDim,
                    letterSpacing: 0.1 * 9,
                  ),
                ),
                Text(
                  exped.power,
                  style: AppTheme.monoStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: exped.locked ? AppColors.inkFaint : AppColors.ember,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Shared sub-widgets ───────────────────────────────────────────────────────

class _Attr {
  const _Attr(this.name, this.value, this.color);

  final String name;
  final int value;
  final Color color;
}

class _AttrCard extends StatelessWidget {
  const _AttrCard({required this.attr});

  final _Attr attr;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                attr.name,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.inkDim,
                  letterSpacing: 0.12 * 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${attr.value}',
                style: AppTheme.monoStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: attr.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _QfBar(value: attr.value / 50.0, color: attr.color),
        ],
      ),
    );
  }
}

class _EquipSlot extends StatelessWidget {
  const _EquipSlot({
    required this.tag,
    required this.unlocked,
    this.icon,
    this.tone,
    this.locked = false,
  });

  final IconData? icon;
  final Color? tone;
  final String tag;
  final bool unlocked;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: unlocked ? AppColors.surface2 : AppColors.bgDeep,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: unlocked ? AppColors.outline : AppColors.outlineSoft,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: unlocked && icon != null
                  ? Icon(icon, size: 20, color: tone)
                  : locked
                  ? const Icon(
                      Icons.lock_outline,
                      size: 14,
                      color: AppColors.inkFaint,
                    )
                  : Text(
                      tag.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 9,
                        color: AppColors.inkFaint,
                        letterSpacing: 0.1 * 9,
                      ),
                    ),
            ),
            if (unlocked)
              Positioned(
                bottom: 3,
                right: 4,
                child: Text(
                  tag.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 8,
                    color: AppColors.inkFaint,
                    letterSpacing: 0.1 * 8,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  const _AchievementBadge({
    required this.icon,
    required this.tone,
    required this.name,
    required this.desc,
  });

  final IconData icon;
  final Color tone;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.outlineSoft),
      ),
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            margin: const EdgeInsets.only(bottom: 8, top: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surface3,
              border: Border.all(color: AppColors.outline),
            ),
            child: Icon(icon, size: 22, color: tone),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: AppTheme.fantasyStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, color: AppColors.inkDim),
          ),
        ],
      ),
    );
  }
}

class _PortraitPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 116,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outline),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.surface3, AppColors.surface2],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shield, size: 36, color: AppColors.forest),
          const SizedBox(height: 8),
          Text(
            'portrait',
            style: AppTheme.monoStyle(fontSize: 9, color: AppColors.inkFaint),
          ),
        ],
      ),
    );
  }
}

class _PetStatCard extends StatelessWidget {
  const _PetStatCard({required this.label, required this.stars});

  final String label;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: AppColors.inkDim,
              letterSpacing: 0.12 * 9,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '★' * stars + '☆' * (5 - stars),
            style: const TextStyle(fontSize: 14, color: AppColors.ember),
          ),
        ],
      ),
    );
  }
}

class _PetStatMoodCard extends StatelessWidget {
  const _PetStatMoodCard({required this.label, required this.mood});

  final String label;
  final String mood;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: AppColors.inkDim,
              letterSpacing: 0.12 * 9,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            mood,
            style: AppTheme.fantasyStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.forest,
            ),
          ),
        ],
      ),
    );
  }
}

class _PetStatBarCard extends StatelessWidget {
  const _PetStatBarCard({
    required this.label,
    required this.value,
    required this.display,
    required this.tone,
  });

  final String label;
  final double value;
  final String display;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              color: AppColors.inkDim,
              letterSpacing: 0.12 * 9,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            display,
            style: AppTheme.monoStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: tone,
            ),
          ),
          const SizedBox(height: 4),
          _QfBar(value: value, color: tone),
        ],
      ),
    );
  }
}

// ─── Progress bar ─────────────────────────────────────────────────────────────

enum _BarTone { forest, ember, sky, gold }

class _QfBar extends StatelessWidget {
  const _QfBar({required this.value, this.tone = _BarTone.forest, this.color});

  final double value;
  final _BarTone tone;
  final Color? color;
  static const double height = 6.0;

  @override
  Widget build(BuildContext context) {
    Color start;
    Color end;

    if (color != null) {
      start = color!.withValues(alpha: 0.6);
      end = color!;
    } else {
      (start, end) = switch (tone) {
        _BarTone.forest => (AppColors.forestDeep, AppColors.forest),
        _BarTone.ember => (AppColors.emberDeep, AppColors.ember),
        _BarTone.sky => (const Color(0xFF2C5282), AppColors.sky),
        _BarTone.gold => (const Color(0xFFB7791F), AppColors.gold),
      };
    }

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface3,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.outlineSoft),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [start, end]),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
    );
  }
}
