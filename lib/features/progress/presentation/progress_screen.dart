import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/base/app_card.dart';
import '../../../shared/presentation/design_system/fitness/chart_card.dart';
import '../../../shared/presentation/design_system/fitness/metric_card.dart';
import '../../../shared/presentation/design_system/fitness/progress_bar.dart';
import '../application/progress_dashboard_controller.dart';

class ProgressScreen extends ConsumerStatefulWidget {
  const ProgressScreen({super.key});

  static const routeName = 'progress';
  static const routePath = '/progress';

  @override
  ConsumerState<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends ConsumerState<ProgressScreen> {
  final _weightController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboardAsync = ref.watch(progressDashboardProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text('Progress'), pinned: true),
        dashboardAsync.when(
          data: (data) => SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            sliver: SliverList.list(
              children: [
                _QuickBodyweightEntry(
                  controller: _weightController,
                  isSaving: _isSaving,
                  onSave: _saveBodyweight,
                ),
                const SizedBox(height: AppSpacing.lg),
                _BodyweightSummary(data: data),
                const SizedBox(height: AppSpacing.lg),
                _BodyweightGoalCard(goal: data.bodyweightGoal),
                const SizedBox(height: AppSpacing.lg),
                ChartCard(
                  title: 'Bodyweight Trend',
                  points: [
                    for (final entry in data.chronologicalBodyweightHistory)
                      entry.weightKg,
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                _BodyweightHistoryList(entries: data.bodyweightHistory),
              ],
            ),
          ),
          error: (error, stackTrace) => SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text('Progress could not be loaded: $error'),
              ),
            ),
          ),
          loading: () => const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }

  Future<void> _saveBodyweight() async {
    final weight = double.tryParse(_weightController.text.trim());
    if (weight == null || weight <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter a valid bodyweight')));
      return;
    }

    setState(() => _isSaving = true);
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.bodyweight.logBodyweight(
      weightKg: weight,
      loggedAt: DateTime.now(),
    );

    if (!mounted) {
      return;
    }
    _weightController.clear();
    ref.invalidate(progressDashboardProvider);
    setState(() => _isSaving = false);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Bodyweight logged')));
  }
}

class _QuickBodyweightEntry extends StatelessWidget {
  const _QuickBodyweightEntry({
    required this.controller,
    required this.isSaving,
    required this.onSave,
  });

  final TextEditingController controller;
  final bool isSaving;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Bodyweight', style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                    suffixText: 'kg',
                  ),
                  onSubmitted: (_) => onSave(),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              SizedBox(
                width: 96,
                height: AppSpacing.minTapTarget,
                child: FilledButton.icon(
                  onPressed: isSaving ? null : onSave,
                  icon: isSaving
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.add),
                  label: const Text('Log'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BodyweightSummary extends StatelessWidget {
  const _BodyweightSummary({required this.data});

  final ProgressDashboardData data;

  @override
  Widget build(BuildContext context) {
    final latest = data.latestBodyweight;
    final previous = data.bodyweightHistory.length > 1
        ? data.bodyweightHistory[1]
        : null;
    final detail = latest == null
        ? 'No bodyweight entries yet'
        : 'Latest: ${_formatDate(latest.loggedAt)}'
              '${previous == null ? '' : ' • ${_formatDelta(latest.weightKg - previous.weightKg)}'}';

    return MetricCard(
      label: 'Latest Bodyweight',
      value: latest == null ? '-- kg' : '${_formatNumber(latest.weightKg)} kg',
      icon: Icons.monitor_weight_outlined,
      detail: detail,
    );
  }
}

class _BodyweightGoalCard extends StatelessWidget {
  const _BodyweightGoalCard({required this.goal});

  final Goal? goal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final goal = this.goal;

    if (goal == null) {
      return const AppCard(child: Text('No bodyweight goal is active yet.'));
    }

    final current = goal.currentValue;
    final progress = current == null
        ? 0.0
        : goal.direction == 'lower'
        ? (goal.targetValue / current).clamp(0.0, 1.0)
        : (current / goal.targetValue).clamp(0.0, 1.0);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(goal.name, style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          Text(
            current == null
                ? 'Target ${_formatNumber(goal.targetValue)} ${goal.unit}'
                : '${_formatNumber(current)} ${goal.unit} of ${_formatNumber(goal.targetValue)} ${goal.unit}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FitnessProgressBar(value: progress),
        ],
      ),
    );
  }
}

class _BodyweightHistoryList extends StatelessWidget {
  const _BodyweightHistoryList({required this.entries});

  final List<BodyweightLog> entries;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bodyweight History', style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          if (entries.isEmpty)
            Text(
              'No entries yet.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            )
          else
            for (final entry in entries.take(10)) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDate(entry.loggedAt)),
                  Text('${_formatNumber(entry.weightKg)} kg'),
                ],
              ),
              const Divider(height: AppSpacing.lg),
            ],
        ],
      ),
    );
  }
}

String _formatDate(DateTime dateTime) {
  final local = dateTime.toLocal();
  return '${_monthName(local.month)} ${local.day}, ${local.year}';
}

String _formatDelta(double delta) {
  if (delta == 0) {
    return 'no change';
  }

  final sign = delta > 0 ? '+' : '';
  return '$sign${_formatNumber(delta)} kg';
}

String _formatNumber(double value) {
  return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
}

String _monthName(int month) {
  return const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ][month - 1];
}
