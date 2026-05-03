import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../data/local_database/local_database.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../../workout_execution/presentation/workout_execution_screen.dart';
import '../application/today_dashboard_controller.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  static const routeName = 'today';
  static const routePath = '/today';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(todayDashboardProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text('Today'), pinned: true),
        SliverPadding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          sliver: dashboard.when(
            data: (data) => SliverList.list(
              children: [
                _CampaignHeader(dashboard: data),
                const SizedBox(height: AppSpacing.lg),
                QuestCard(
                  title: data.primaryTitle,
                  description: data.primaryDescription,
                  progress: data.weeklyProgress,
                  actionLabel: data.isTrainingDay
                      ? 'Start Today\'s Quest'
                      : null,
                  onActionPressed: data.todayWorkout == null
                      ? null
                      : () => context.goNamed(
                          WorkoutExecutionScreen.routeName,
                          pathParameters: {
                            'scheduledWorkoutId': data.todayWorkout!.id,
                          },
                        ),
                ),
                const SizedBox(height: AppSpacing.lg),
                _WeeklyPlanCard(dashboard: data),
                const SizedBox(height: AppSpacing.lg),
                _GoalSnapshot(goals: data.goalSnapshot),
              ],
            ),
            error: (error, stackTrace) => SliverList.list(
              children: const [
                QuestCard(
                  title: 'Today Unavailable',
                  description: 'The local training database could not be read.',
                  progress: 0,
                ),
              ],
            ),
            loading: () => SliverList.list(
              children: const [
                QuestCard(
                  title: 'Loading Today',
                  description: 'Reading your local campaign and workout plan.',
                  progress: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CampaignHeader extends StatelessWidget {
  const _CampaignHeader({required this.dashboard});

  final TodayDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final campaignName = dashboard.activeCampaign?.name ?? 'No active campaign';
    final phaseName = dashboard.currentPhase?.name ?? 'Outside campaign phase';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(campaignName, style: theme.textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          phaseName,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _WeeklyPlanCard extends StatelessWidget {
  const _WeeklyPlanCard({required this.dashboard});

  final TodayDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    return MetricCard(
      label: 'Weekly Plan',
      value: '${dashboard.weeklyWorkouts.length} sessions',
      icon: Icons.event_available,
      detail: dashboard.weeklySummary,
      accentColor: AppColors.sky,
    );
  }
}

class _GoalSnapshot extends StatelessWidget {
  const _GoalSnapshot({required this.goals});

  final List<Goal> goals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (goals.isEmpty) {
      return const MetricCard(
        label: 'Goals',
        value: 'None',
        icon: Icons.flag_outlined,
        detail: 'No active goals are configured.',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Goal Snapshot', style: theme.textTheme.titleLarge),
        const SizedBox(height: AppSpacing.md),
        for (final goal in goals) ...[
          MetricCard(
            label: goal.name,
            value:
                '${_formatNumber(goal.currentValue)} / ${_formatNumber(goal.targetValue)} ${goal.unit}',
            icon: Icons.flag_outlined,
            detail: goal.direction == 'higher'
                ? 'Higher is better'
                : 'Lower is better',
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ],
    );
  }
}

String _formatNumber(double? value) {
  if (value == null) {
    return '-';
  }
  if (value == value.roundToDouble()) {
    return value.toInt().toString();
  }

  return value.toStringAsFixed(1);
}
