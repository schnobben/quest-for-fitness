import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/base/app_card.dart';
import '../application/session_history_controller.dart';

class LogScreen extends ConsumerWidget {
  const LogScreen({super.key});

  static const routeName = 'log';
  static const routePath = '/log';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(sessionHistoryProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text('Log'), pinned: true),
        historyAsync.when(
          data: (history) {
            if (history.isEmpty) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: _EmptySessionHistory(),
              );
            }

            return SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              sliver: SliverList.separated(
                itemBuilder: (context, index) => _SessionHistoryCard(
                  entry: history[index],
                  onDelete: () => _deleteSession(context, ref, history[index]),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: AppSpacing.md),
                itemCount: history.length,
              ),
            );
          },
          error: (error, stackTrace) => SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Text('Session history could not be loaded: $error'),
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

  Future<void> _deleteSession(
    BuildContext context,
    WidgetRef ref,
    SessionHistoryEntry entry,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete session?'),
        content: Text(
          '${entry.workoutName} from ${_formatDateTime(entry.session.startedAt)} will be removed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) {
      return;
    }

    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.sessions.deleteSession(entry.session.id);
    ref.invalidate(sessionHistoryProvider);

    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Session deleted')));
  }
}

class _EmptySessionHistory extends StatelessWidget {
  const _EmptySessionHistory();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_toggle_off,
            size: 52,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('No sessions yet', style: theme.textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Completed workouts will appear here with exercises and logged sets.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _SessionHistoryCard extends StatelessWidget {
  const _SessionHistoryCard({required this.entry, required this.onDelete});

  final SessionHistoryEntry entry;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      padding: EdgeInsets.zero,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        childrenPadding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        title: Text(entry.workoutName, style: theme.textTheme.titleMedium),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.xs),
          child: Text(
            '${_formatDateTime(entry.session.startedAt)} • '
            '${_formatDuration(entry.session.durationSeconds)} • '
            '${entry.exercises.length} exercises • ${entry.setCount} sets',
          ),
        ),
        trailing: IconButton(
          tooltip: 'Delete session',
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete,
        ),
        children: [
          for (final exercise in entry.exercises) ...[
            _ExerciseHistorySection(exercise: exercise),
            const SizedBox(height: AppSpacing.md),
          ],
          if (entry.session.notes != null && entry.session.notes!.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Notes: ${entry.session.notes}'),
            ),
        ],
      ),
    );
  }
}

class _ExerciseHistorySection extends StatelessWidget {
  const _ExerciseHistorySection({required this.exercise});

  final SessionExerciseHistoryEntry exercise;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exercise.exerciseName, style: theme.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.xs),
        for (final set in exercise.sets)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              'Set ${set.setNumber}: ${_formatSet(set)}',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        if (exercise.exerciseLog.notes != null &&
            exercise.exerciseLog.notes!.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Note: ${exercise.exerciseLog.notes}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

String _formatSet(SetLog set) {
  final parts = <String>[];
  if (set.reps != null) {
    parts.add('${set.reps} reps');
  }
  if (set.weight != null) {
    parts.add('${_formatNumber(set.weight!)} kg');
  }
  if (set.rpe != null) {
    parts.add('RPE ${_formatNumber(set.rpe!)}');
  }
  parts.add(set.isComplete ? 'complete' : 'incomplete');
  if (set.notes != null && set.notes!.isNotEmpty) {
    parts.add(set.notes!);
  }

  return parts.join(' • ');
}

String _formatDateTime(DateTime dateTime) {
  final local = dateTime.toLocal();
  return '${_weekdayName(local.weekday)}, '
      '${_monthName(local.month)} ${local.day}, ${local.year} '
      '${_twoDigits(local.hour)}:${_twoDigits(local.minute)}';
}

String _formatDuration(int? durationSeconds) {
  if (durationSeconds == null || durationSeconds <= 0) {
    return 'duration pending';
  }

  final minutes = (durationSeconds / 60).round();
  if (minutes < 60) {
    return '$minutes min';
  }

  final hours = minutes ~/ 60;
  final remainingMinutes = minutes % 60;
  if (remainingMinutes == 0) {
    return '$hours hr';
  }

  return '$hours hr $remainingMinutes min';
}

String _formatNumber(double value) {
  return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
}

String _twoDigits(int value) => value.toString().padLeft(2, '0');

String _weekdayName(int weekday) {
  return const [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ][weekday - 1];
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
