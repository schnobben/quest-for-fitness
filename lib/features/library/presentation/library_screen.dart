import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_theme.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../../exercise_builder/presentation/exercise_form_screen.dart';
import '../../exercise_builder/presentation/exercise_list_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  static const routeName = 'library';
  static const routePath = '/library';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _tab = 0;

  static const _tabs = [
    'Campaigns',
    'Programs',
    'Workouts',
    'Exercises',
    'Goals',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            QfScreenHeader(
              salutation: 'The Library',
              title: 'Codex',
              trailing: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.surface2,
                  foregroundColor: AppColors.ink,
                  side: const BorderSide(color: AppColors.outline),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _tab == 3
                    ? () => context.goNamed(ExerciseFormScreen.routeName)
                    : null,
                icon: const Icon(Icons.add, size: 18),
                tooltip: 'Create',
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 12),
              child: _LibraryNotice(),
            ),

            // Segmented control
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemCount: _tabs.length,
                separatorBuilder: (_, _) => const SizedBox(width: 6),
                itemBuilder: (context, i) {
                  final sel = i == _tab;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _tab = i);
                      if (i == 3) {
                        context.goNamed(ExerciseListScreen.routeName);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: sel ? AppColors.surface3 : Colors.transparent,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: sel ? AppColors.outline : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        _tabs[i],
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: sel ? AppColors.ink : AppColors.inkDim,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _tab == 3
                  ? const ExerciseListContent()
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: _ActiveCampaignCard(),
                        ),
                        const QfSectionHeader(title: 'Phase 1 · Sessions'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 1.8,
                            children: const [
                              _SessionCard(
                                day: 'A',
                                name: 'Upper Strength',
                                sched: 'MON',
                                exercises: 6,
                                tone: AppColors.ember,
                              ),
                              _SessionCard(
                                day: 'B',
                                name: 'Lower Strength',
                                sched: 'TUE',
                                exercises: 5,
                                tone: AppColors.forest,
                              ),
                              _SessionCard(
                                day: 'C',
                                name: 'Upper Volume',
                                sched: 'THU',
                                exercises: 7,
                                tone: AppColors.sky,
                              ),
                              _SessionCard(
                                day: 'D',
                                name: 'Lower Volume',
                                sched: 'SAT',
                                exercises: 6,
                                tone: AppColors.rune,
                              ),
                            ],
                          ),
                        ),
                        QfSectionHeader(
                          title: 'Goals (5)',
                          moreLabel: 'Browse all',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            children: [
                              for (final g in _goals) ...[
                                _GoalRow(goal: g),
                                const SizedBox(height: 10),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  static const _goals = [
    _GoalData(
      icon: Icons.fitness_center,
      name: 'Bench Press 1RM',
      target: '140 kg',
      tone: AppColors.ember,
    ),
    _GoalData(
      icon: Icons.directions_run,
      name: '5 km Run Time',
      target: '25:00',
      tone: AppColors.sky,
    ),
    _GoalData(
      icon: Icons.terrain,
      name: 'Weighted Pull-up',
      target: '+60 kg',
      tone: AppColors.rune,
    ),
    _GoalData(
      icon: Icons.air,
      name: 'Bodyweight Pull-ups',
      target: '25 reps',
      tone: AppColors.forest,
    ),
    _GoalData(
      icon: Icons.monitor_weight_outlined,
      name: 'Bodyweight',
      target: '83.0 kg',
      tone: AppColors.gold,
    ),
  ];
}

class _ActiveCampaignCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.embossed,
      ornamentCorners: true,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ACTIVE · SEED CAMPAIGN',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.rune,
                        letterSpacing: 0.16 * 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'The May–Sep Climb',
                      style: AppTheme.fantasyStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 1.15,
                      ),
                    ),
                    const Text(
                      'May 5 – Sep 30, 2026 · 5 goals',
                      style: TextStyle(fontSize: 11, color: AppColors.inkDim),
                    ),
                  ],
                ),
              ),
              const QfPill(tone: QfPillTone.ember, child: Text('Wk 2 / 22')),
            ],
          ),
          const SizedBox(height: 14),
          // Phase track
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.surface3,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: AppColors.outlineSoft),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.09, // week 2 of 22 ≈ 9%
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.forestDeep, AppColors.forest],
                  ),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _PhaseLabel(
                width: 0.36,
                name: '1 · The Foundation',
                sub: 'May 5 – Jun 29',
                active: true,
              ),
              _PhaseLabel(
                width: 0.36,
                name: '2 · The Quest',
                sub: 'Jul 1 – Aug 31',
                active: false,
              ),
              _PhaseLabel(
                width: 0.28,
                name: '3 · The Peak',
                sub: 'Sep 1 – Sep 30',
                active: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LibraryNotice extends StatelessWidget {
  const _LibraryNotice();

  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: const [
          Icon(Icons.science_outlined, size: 18, color: AppColors.rune),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Sample codex content. Editing, duplicating, and custom builders start in Milestone 5.',
              style: TextStyle(fontSize: 12, color: AppColors.inkMute),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhaseLabel extends StatelessWidget {
  const _PhaseLabel({
    required this.width,
    required this.name,
    required this.sub,
    required this.active,
  });

  final double width;
  final String name;
  final String sub;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 84) * width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10,
              color: active ? AppColors.forest : AppColors.inkMute,
              fontWeight: active ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
          Text(
            sub,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, color: AppColors.inkDim),
          ),
        ],
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({
    required this.day,
    required this.name,
    required this.sched,
    required this.exercises,
    required this.tone,
  });

  final String day;
  final String name;
  final String sched;
  final int exercises;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.surface3,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.outline),
                ),
                child: Center(
                  child: Text(
                    day,
                    style: AppTheme.fantasyStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: tone,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                sched,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.inkDim,
                  letterSpacing: 0.1 * 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppTheme.fantasyStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          Text(
            '$exercises exercises',
            style: AppTheme.monoStyle(fontSize: 11, color: AppColors.inkDim),
          ),
        ],
      ),
    );
  }
}

class _GoalData {
  const _GoalData({
    required this.icon,
    required this.name,
    required this.target,
    required this.tone,
  });

  final IconData icon;
  final String name;
  final String target;
  final Color tone;
}

class _GoalRow extends StatelessWidget {
  const _GoalRow({required this.goal});

  final _GoalData goal;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.outline),
            ),
            child: Icon(goal.icon, size: 16, color: goal.tone),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  'by Sep 30 · target ${goal.target}',
                  style: const TextStyle(fontSize: 11, color: AppColors.inkDim),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 14, color: AppColors.inkFaint),
        ],
      ),
    );
  }
}
