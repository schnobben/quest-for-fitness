import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../../quest/presentation/pet_evolution_dialog.dart';

class WorkoutCompletionScreen extends StatefulWidget {
  const WorkoutCompletionScreen({required this.result, super.key});

  static const routeName = 'workoutCompletion';
  static const routePath = '/workout-completion';

  final WorkoutCompletionResult? result;

  @override
  State<WorkoutCompletionScreen> createState() =>
      _WorkoutCompletionScreenState();
}

class _WorkoutCompletionScreenState extends State<WorkoutCompletionScreen> {
  @override
  void initState() {
    super.initState();
    final reward = widget.result?.workoutReward;
    if (reward != null && reward.petBondChange.evolved) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          PetEvolutionDialog.show(
            context,
            fromStage:
                reward.petBondChange.evolutionStageAfter - 1,
            toStage: reward.petBondChange.evolutionStageAfter,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.result;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: result == null
            ? _MissingCompletionResult()
            : ListView(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 120),
                children: [
                  QfScreenHeader(
                    salutation: 'Quest Complete',
                    title: result.workoutName,
                    trailing: const Icon(
                      Icons.emoji_events,
                      color: AppColors.gold,
                    ),
                  ),
                  _CompletionHero(result: result),
                  const SizedBox(height: 14),
                  _SummaryGrid(result: result),
                  const QfSectionHeader(title: 'Rewards'),
                  _RewardRows(result: result),
                  const QfSectionHeader(title: 'Progress'),
                  _ProgressRows(result: result),
                ],
              ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
          child: FilledButton.icon(
            key: const Key('completion-continue-button'),
            onPressed: () => context.go('/today'),
            icon: const Icon(Icons.check, size: 18),
            label: const Text('Continue'),
          ),
        ),
      ),
    );
  }
}

class _MissingCompletionResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: QfCard(
          padding: const EdgeInsets.all(16),
          child: const Text(
            'Completion rewards are no longer available.',
            style: TextStyle(color: AppColors.inkMute),
          ),
        ),
      ),
    );
  }
}

class _CompletionHero extends StatelessWidget {
  const _CompletionHero({required this.result});

  final WorkoutCompletionResult result;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.96, end: 1),
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: QfCard(
        variant: QfCardVariant.embossed,
        ornamentCorners: true,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surface3,
                border: Border.all(color: AppColors.outline),
              ),
              child: const Icon(Icons.auto_awesome, color: AppColors.gold),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '+${result.workoutReward.xpAmount} XP',
                    style: AppTheme.fantasyStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gold,
                    ),
                  ),
                  Text(
                    result.workoutReward.leveledUp
                        ? 'Level ${result.workoutReward.levelAfter} reached'
                        : 'Your Adventurer grows stronger.',
                    style: const TextStyle(
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
    );
  }
}

class _SummaryGrid extends StatelessWidget {
  const _SummaryGrid({required this.result});

  final WorkoutCompletionResult result;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.45,
      children: [
        _SummaryTile(label: 'SETS', value: '${result.completedSetCount}'),
        _SummaryTile(label: 'TIME', value: _duration(result.durationSeconds)),
        _SummaryTile(label: 'PRS', value: '${result.prCount}'),
      ],
    );
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.inkDim,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            value,
            style: AppTheme.monoStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}

class _RewardRows extends StatelessWidget {
  const _RewardRows({required this.result});

  final WorkoutCompletionResult result;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[
      _RewardRow(
        icon: Icons.bolt,
        tone: AppColors.ember,
        title: 'XP gained',
        subtitle: '+${result.workoutReward.xpAmount} XP',
      ),
      for (final achievement in result.workoutReward.unlockedAchievements)
        _RewardRow(
          icon: Icons.emoji_events_outlined,
          tone: AppColors.gold,
          title: achievement.achievement.name,
          subtitle: 'Achievement unlocked',
        ),
      for (final equipment in result.workoutReward.equipmentUnlocks)
        _RewardRow(
          icon: Icons.shield_outlined,
          tone: AppColors.rune,
          title: equipment.name,
          subtitle: 'Equipment unlocked',
        ),
      for (final title in result.workoutReward.titleUnlocks)
        _RewardRow(
          icon: Icons.workspace_premium_outlined,
          tone: AppColors.gold,
          title: title.name,
          subtitle: 'Title unlocked',
        ),
    ];

    return Column(children: rows);
  }
}

class _ProgressRows extends StatelessWidget {
  const _ProgressRows({required this.result});

  final WorkoutCompletionResult result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _RewardRow(
          icon: Icons.track_changes,
          tone: AppColors.forest,
          title: 'Achievement progress',
          subtitle: result.workoutReward.unlockedAchievements.isEmpty
              ? 'Progress updated'
              : '${result.workoutReward.unlockedAchievements.length} new unlock',
        ),
        const _RewardRow(
          icon: Icons.flag_outlined,
          tone: AppColors.sky,
          title: 'Goal progress',
          subtitle: 'Updated where linked goals changed',
        ),
        _RewardRow(
          icon: Icons.pets_outlined,
          tone: AppColors.rose,
          title: 'Pet bond',
          subtitle: result.workoutReward.petBondChange.bondXpGained > 0
              ? '+${result.workoutReward.petBondChange.bondXpGained} bond XP'
              : 'Pet is resting',
        ),
        if (result.workoutReward.petBondChange.evolved)
          _RewardRow(
            icon: Icons.auto_awesome,
            tone: AppColors.gold,
            title: 'Evolution!',
            subtitle:
                'Ember evolved into ${stageNames[result.workoutReward.petBondChange.evolutionStageAfter]}',
          ),
      ],
    );
  }
}

class _RewardRow extends StatelessWidget {
  const _RewardRow({
    required this.icon,
    required this.tone,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color tone;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: QfCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: tone, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.fantasyStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.inkMute,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _duration(int seconds) {
  final minutes = (seconds / 60).round();
  if (minutes < 60) return '${minutes}m';
  final hours = minutes ~/ 60;
  final remainder = minutes % 60;
  return '${hours}h ${remainder}m';
}
