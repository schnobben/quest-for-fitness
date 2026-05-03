import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_theme.dart';
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
        child: _selectedTab == 0
            ? _AdventurerView(
                selectedTab: _selectedTab,
                onTabChanged: (i) => setState(() => _selectedTab = i),
              )
            : _selectedTab == 1
                ? _PetView(
                    selectedTab: _selectedTab,
                    onTabChanged: (i) => setState(() => _selectedTab = i),
                  )
                : _ExpeditionsView(
                    selectedTab: _selectedTab,
                    onTabChanged: (i) => setState(() => _selectedTab = i),
                  ),
      ),
    );
  }
}

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

class _AdventurerView extends StatelessWidget {
  const _AdventurerView({
    required this.selectedTab,
    required this.onTabChanged,
  });

  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  static const _attrs = [
    _Attr('MIGHT', 38, AppColors.ember),
    _Attr('ENDURANCE', 24, AppColors.sky),
    _Attr('DISCIPLINE', 41, AppColors.forest),
    _Attr('VITALITY', 22, AppColors.rose),
    _Attr('AGILITY', 19, AppColors.gold),
    _Attr('WISDOM', 28, AppColors.rune),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        QfScreenHeader(
          salutation: 'The Adventurer',
          title: 'Iron Ranger',
          trailing: const Icon(
            Icons.settings_outlined,
            size: 18,
            color: AppColors.inkMute,
          ),
        ),
        _QuestTabBar(
          tabs: const ['Hero', 'Pet', 'Quests', 'Achievements', 'Expeditions'],
          selectedIndex: 0,
          onTabChanged: (i) {
            if (i <= 2) onTabChanged(i);
          },
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
                      const Text(
                        'CLASS · WARRIOR',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.rune,
                          letterSpacing: 0.16 * 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Iron Ranger',
                        style: AppTheme.fantasyStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          height: 1.15,
                        ),
                      ),
                      Text(
                        '"Earned for 3 strength + 2 runs this week"',
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
                            child: const Text('LV 7'),
                          ),
                          const SizedBox(width: 8),
                          const QfPill(
                            tone: QfPillTone.muted,
                            child: Text('Day 84'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _QfBar(value: 0.62, tone: _BarTone.ember),
                      const SizedBox(height: 4),
                      Text(
                        '1,840 / 3,000 XP',
                        style: AppTheme.monoStyle(
                          fontSize: 10,
                          color: AppColors.inkDim,
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
            children: [
              for (final a in _attrs) _AttrCard(attr: a),
            ],
          ),
        ),

        QfSectionHeader(title: 'Equipped', moreLabel: 'Inventory'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _EquipSlot(icon: Icons.fitness_center, tone: AppColors.ember, tag: 'wpn', unlocked: true),
              _EquipSlot(icon: Icons.shield, tone: AppColors.forest, tag: 'off', unlocked: true),
              _EquipSlot(icon: Icons.workspace_premium, tone: AppColors.rune, tag: 'hlm', unlocked: true),
              _EquipSlot(icon: null, tag: 'cht', unlocked: false),
              _EquipSlot(icon: null, tag: 'glv', unlocked: false),
              _EquipSlot(icon: Icons.terrain, tone: AppColors.forest, tag: 'bts', unlocked: true),
              _EquipSlot(icon: Icons.local_fire_department, tone: AppColors.ember, tag: 'trk', unlocked: true),
              _EquipSlot(icon: null, tag: 'clk', unlocked: false, locked: true),
            ],
          ),
        ),

        QfSectionHeader(title: 'Recent Achievements', moreLabel: 'See all · 12'),
        SizedBox(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            children: const [
              _AchievementBadge(
                icon: Icons.local_fire_department,
                tone: AppColors.ember,
                name: 'Forged in Steel',
                desc: 'New strength PR',
              ),
              SizedBox(width: 10),
              _AchievementBadge(
                icon: Icons.flag,
                tone: AppColors.forest,
                name: 'Iron Habit',
                desc: '4 in a week',
              ),
              SizedBox(width: 10),
              _AchievementBadge(
                icon: Icons.directions_run,
                tone: AppColors.sky,
                name: 'Road Worn',
                desc: '10 runs logged',
              ),
              SizedBox(width: 10),
              _AchievementBadge(
                icon: Icons.spa_outlined,
                tone: AppColors.rune,
                name: 'Campfire Wisdom',
                desc: 'Planned recovery',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

// ─── Pet view ─────────────────────────────────────────────────────────────────

class _PetView extends StatelessWidget {
  const _PetView({
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
          salutation: 'The Companion',
          title: 'Ember',
          trailing: const QfPill(
            tone: QfPillTone.ember,
            child: Text('Trailmate · L4'),
          ),
        ),
        _QuestTabBar(
          tabs: const ['Hero', 'Pet', 'Quests', 'Achievements', 'Expeditions'],
          selectedIndex: 1,
          onTabChanged: (i) {
            if (i <= 2) onTabChanged(i);
          },
        ),
        const SizedBox(height: 12),

        // Habitat scene
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _HabitatScene(),
        ),

        const SizedBox(height: 14),

        // Stats grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.3,
            children: const [
              _PetStatCard(label: 'BOND', stars: 4),
              _PetStatMoodCard(label: 'MOOD', mood: 'Proud'),
              _PetStatBarCard(label: 'ENERGY', value: 0.78, display: '78%', tone: AppColors.sky),
              _PetStatBarCard(label: 'GROWTH', value: 0.4, display: 'Stage 3/5', tone: AppColors.gold),
              _PetStatBarCard(label: 'CURIOSITY', value: 0.62, display: '62%', tone: AppColors.rune),
              _PetStatCard(label: 'EXPED PWR', text: '184'),
            ],
          ),
        ),

        const QfSectionHeader(title: 'Care Actions'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              for (final action in [
                (Icons.coffee, 'Treat'),
                (Icons.pets, 'Play'),
                (Icons.explore, 'Send'),
                (Icons.home_outlined, 'Habitat'),
              ]) ...[
                Expanded(
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
                          child: Icon(action.$1, size: 16, color: AppColors.inkMute),
                        ),
                        const SizedBox(height: 6),
                        Text(action.$2,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.ink)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
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
                _EvolutionPath(),
                const SizedBox(height: 12),
                Text(
                  'Reach Bond 5 + Adventurer Lv 10 to evolve into Guardian.',
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
}

class _HabitatScene extends StatelessWidget {
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
                  child: const Icon(Icons.pets,
                      color: AppColors.ember, size: 32),
                ),
              ),
            ),
            // Campfire
            const Positioned(
              bottom: 65,
              left: 80,
              child: Icon(Icons.local_fire_department,
                  color: AppColors.ember, size: 28),
            ),
            // Flavor text
            Positioned(
              bottom: 8,
              right: 12,
              child: Text(
                '"…ember looks proud."',
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
  static const _stages = ['Hatchling', 'Companion', 'Trailmate', 'Guardian', 'Mythic'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < _stages.length; i++) ...[
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == 2
                      ? AppColors.ember
                      : i < 2
                          ? AppColors.surface3
                          : AppColors.bgDeep,
                  border: Border.all(
                    color: i == 2
                        ? AppColors.ember
                        : i < 2
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
                      color: i == 2
                          ? AppColors.bgDeep
                          : i < 2
                              ? AppColors.inkMute
                              : AppColors.inkFaint,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _stages[i],
                style: TextStyle(
                  fontSize: 9,
                  color: i == 2
                      ? AppColors.ember
                      : i < 2
                          ? AppColors.inkMute
                          : AppColors.inkFaint,
                  fontWeight: i == 2 ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
          if (i < _stages.length - 1)
            Expanded(
              child: Container(
                height: 1,
                margin: const EdgeInsets.only(bottom: 22),
                color: i < 2 ? AppColors.ember : AppColors.outlineSoft,
              ),
            ),
        ],
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
            child: Text(
              '1,240',
              style: AppTheme.monoStyle(fontSize: 11),
            ),
          ),
        ),
        _QuestTabBar(
          tabs: const ['Hero', 'Pet', 'Quests', 'Achievements', 'Expeditions'],
          selectedIndex: 2,
          onTabChanged: (i) {
            if (i <= 2) onTabChanged(i);
          },
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
                        fontSize: 11, color: AppColors.inkDim),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    children: [
                      for (final r in exped.rewards)
                        QfPill(
                          tone: QfPillTone.muted,
                          child: Text(r,
                              style: const TextStyle(fontSize: 9)),
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
                      ? const Icon(Icons.lock_outline,
                          size: 14, color: AppColors.inkFaint)
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
                fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.ink),
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 10, color: AppColors.inkDim),
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
            style: AppTheme.monoStyle(
              fontSize: 9,
              color: AppColors.inkFaint,
            ),
          ),
        ],
      ),
    );
  }
}

class _PetStatCard extends StatelessWidget {
  const _PetStatCard({required this.label, this.stars, this.text});

  final String label;
  final int? stars;
  final String? text;

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
          if (stars != null)
            Text(
              '★' * stars! + '☆' * (5 - stars!),
              style: const TextStyle(fontSize: 14, color: AppColors.ember),
            )
          else if (text != null)
            Text(
              text!,
              style: AppTheme.fantasyStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.ember,
              ),
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
  const _QfBar({
    required this.value,
    this.tone = _BarTone.forest,
    this.color,
  });

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
