import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../../workout_execution/presentation/workout_execution_screen.dart';
import '../application/session_history_controller.dart';

class LogScreen extends ConsumerWidget {
  const LogScreen({super.key});

  static const routeName = 'log';
  static const routePath = '/log';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(sessionHistoryProvider);
    final nextWorkoutAsync = ref.watch(nextPlannedWorkoutProvider);
    final recentRunsAsync = ref.watch(recentRunsProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: historyAsync.when(
          data: (history) => _LogBody(
            history: history,
            nextWorkout: nextWorkoutAsync.hasValue
                ? nextWorkoutAsync.requireValue
                : null,
            recentRuns: recentRunsAsync.hasValue
                ? recentRunsAsync.requireValue
                : const [],
            onLogRun: () => _logRun(context, ref),
            onDelete: (entry) => _deleteSession(context, ref, entry),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.forest),
          ),
          error: (e, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                'Log could not be loaded: $e',
                style: const TextStyle(color: AppColors.inkMute),
              ),
            ),
          ),
        ),
      ),
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
        backgroundColor: AppColors.surface2,
        title: const Text('Delete session?'),
        content: Text(
          '${entry.workoutName} will be removed.',
          style: const TextStyle(color: AppColors.inkMute),
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

    if (confirmed != true || !context.mounted) return;

    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.sessions.deleteSession(entry.session.id);
    ref.invalidate(sessionHistoryProvider);
    ref.invalidate(nextPlannedWorkoutProvider);

    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Session deleted')));
  }

  Future<void> _logRun(BuildContext context, WidgetRef ref) async {
    final result = await showDialog<_RunInput>(
      context: context,
      builder: (context) => const _RunLogDialog(),
    );
    if (result == null || !context.mounted) return;

    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.cardio.logRun(
      loggedAt: result.loggedAt,
      distanceKm: result.distanceKm,
      durationMinutes: result.durationMinutes,
      notes: result.notes,
    );

    ref.invalidate(recentRunsProvider);
    ref.invalidate(sessionHistoryProvider);

    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Run logged')));
  }
}

class _LogBody extends StatelessWidget {
  const _LogBody({
    required this.history,
    required this.nextWorkout,
    required this.recentRuns,
    required this.onLogRun,
    required this.onDelete,
  });

  final List<SessionHistoryEntry> history;
  final ScheduledWorkout? nextWorkout;
  final List<CardioLog> recentRuns;
  final VoidCallback onLogRun;
  final void Function(SessionHistoryEntry) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const QfScreenHeader(
          salutation: 'Log Entry',
          title: 'Record the journey.',
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 12),
          child: _SampleNotice(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _QuickActionGrid(nextWorkout: nextWorkout, onLogRun: onLogRun),
        ),
        if (recentRuns.isNotEmpty) ...[
          const QfSectionHeader(title: 'Recent Runs'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: _RecentRunsCard(runs: recentRuns),
          ),
        ],
        const QfSectionHeader(title: 'Recent Entries'),
        if (history.isEmpty)
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 0, 18, 24),
            child: _EmptyHistory(),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                for (var i = 0; i < history.length; i++) ...[
                  _SessionCard(
                    entry: history[i],
                    onDelete: () => onDelete(history[i]),
                  ),
                  if (i < history.length - 1) const SizedBox(height: 10),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),
      ],
    );
  }
}

class _SampleNotice extends StatelessWidget {
  const _SampleNotice();

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
              'Milestone 1 logging is live. Some quick actions are marked with their future sprint until those logs exist.',
              style: TextStyle(fontSize: 12, color: AppColors.inkMute),
            ),
          ),
        ],
      ),
    );
  }
}

class _RunLogDialog extends StatefulWidget {
  const _RunLogDialog();

  @override
  State<_RunLogDialog> createState() => _RunLogDialogState();
}

class _RunLogDialogState extends State<_RunLogDialog> {
  final _distanceController = TextEditingController();
  final _durationController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _distanceController.dispose();
    _durationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: const Text('Log Run', style: TextStyle(color: AppColors.ink)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            key: const Key('run-distance-field'),
            controller: _distanceController,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            style: const TextStyle(color: AppColors.ink),
            decoration: const InputDecoration(
              labelText: 'Distance',
              suffixText: 'km',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            key: const Key('run-duration-field'),
            controller: _durationController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: const TextStyle(color: AppColors.ink),
            decoration: const InputDecoration(
              labelText: 'Duration',
              suffixText: 'min',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            key: const Key('run-notes-field'),
            controller: _notesController,
            style: const TextStyle(color: AppColors.ink),
            decoration: const InputDecoration(labelText: 'Notes'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          key: const Key('run-save-button'),
          onPressed: () {
            final distance = double.tryParse(_distanceController.text.trim());
            final duration = int.tryParse(_durationController.text.trim());
            if (distance == null ||
                distance <= 0 ||
                duration == null ||
                duration <= 0) {
              return;
            }
            Navigator.of(context).pop(
              _RunInput(
                loggedAt: DateTime.now(),
                distanceKm: distance,
                durationMinutes: duration,
                notes: _notesController.text.trim().isEmpty
                    ? null
                    : _notesController.text.trim(),
              ),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _RunInput {
  const _RunInput({
    required this.loggedAt,
    required this.distanceKm,
    required this.durationMinutes,
    this.notes,
  });

  final DateTime loggedAt;
  final double distanceKm;
  final int durationMinutes;
  final String? notes;
}

class _RecentRunsCard extends StatelessWidget {
  const _RecentRunsCard({required this.runs});

  final List<CardioLog> runs;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var i = 0; i < runs.take(5).length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.directions_run,
                    color: AppColors.sky,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_fmt(runs[i].distanceMeters / 1000)} km · ${_formatDuration(runs[i].durationSeconds)}',
                          style: const TextStyle(
                            color: AppColors.ink,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          _formatDate(runs[i].loggedAt),
                          style: const TextStyle(
                            color: AppColors.inkDim,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${_formatPace(runs[i].paceSecondsPerKm)}/km',
                    style: const TextStyle(
                      color: AppColors.sky,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            if (i < runs.take(5).length - 1)
              const Divider(height: 1, color: AppColors.outlineSoft),
          ],
        ],
      ),
    );
  }
}

class _QuickActionGrid extends StatelessWidget {
  const _QuickActionGrid({required this.nextWorkout, required this.onLogRun});

  final ScheduledWorkout? nextWorkout;
  final VoidCallback onLogRun;

  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickAction(
        icon: Icons.fitness_center,
        title: nextWorkout == null ? 'No Plan Ready' : 'Start Next Plan',
        subtitle: nextWorkout == null
            ? 'Seed schedule empty'
            : 'Test logging now',
        tone: _ActionTone.forest,
        wide: true,
        onTap: nextWorkout == null
            ? () => _showMessage(
                context,
                'No planned workout is available to start.',
              )
            : () => context.goNamed(
                WorkoutExecutionScreen.routeName,
                pathParameters: {'scheduledWorkoutId': nextWorkout!.id},
              ),
      ),
      _QuickAction(
        icon: Icons.add,
        title: 'Empty Session',
        subtitle: 'Builder later',
        tone: _ActionTone.ink,
        wide: false,
        onTap: () => _showMessage(
          context,
          'Empty sessions arrive with the custom workout builder.',
        ),
      ),
      _QuickAction(
        icon: Icons.directions_run,
        title: 'Log Run',
        subtitle: 'Live now',
        tone: _ActionTone.sky,
        wide: false,
        onTap: onLogRun,
      ),
      _QuickAction(
        icon: Icons.monitor_weight_outlined,
        title: 'Bodyweight',
        subtitle: 'Live now',
        tone: _ActionTone.ember,
        wide: false,
        onTap: () => context.go('/progress'),
      ),
      _QuickAction(
        icon: Icons.spa_outlined,
        title: 'Recovery Day',
        subtitle: 'Coming later',
        tone: _ActionTone.rune,
        wide: false,
        onTap: () => _showMessage(
          context,
          'Recovery logging is planned for a later fitness logging sprint.',
        ),
      ),
    ];

    return Column(
      children: [
        _ActionCard(action: actions[0]),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _ActionCard(action: actions[1])),
            const SizedBox(width: 10),
            Expanded(child: _ActionCard(action: actions[2])),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _ActionCard(action: actions[3])),
            const SizedBox(width: 10),
            Expanded(child: _ActionCard(action: actions[4])),
          ],
        ),
      ],
    );
  }
}

enum _ActionTone { forest, sky, ember, rune, ink }

class _QuickAction {
  const _QuickAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tone,
    required this.wide,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final _ActionTone tone;
  final bool wide;
  final VoidCallback onTap;
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.action});

  final _QuickAction action;

  @override
  Widget build(BuildContext context) {
    final iconColor = _toneColor(action.tone);
    final iconBoxSize = action.wide ? 48.0 : 38.0;

    return GestureDetector(
      onTap: action.onTap,
      child: QfCard(
        variant: QfCardVariant.raised,
        padding: const EdgeInsets.all(14),
        child: action.wide
            ? Row(
                children: [
                  _IconBox(
                    size: iconBoxSize,
                    icon: action.icon,
                    color: iconColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: _ActionCopy(action: action, large: true)),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _IconBox(
                    size: iconBoxSize,
                    icon: action.icon,
                    color: iconColor,
                  ),
                  const SizedBox(height: 10),
                  _ActionCopy(action: action),
                ],
              ),
      ),
    );
  }

  Color _toneColor(_ActionTone tone) {
    return switch (tone) {
      _ActionTone.forest => AppColors.forest,
      _ActionTone.sky => AppColors.sky,
      _ActionTone.ember => AppColors.ember,
      _ActionTone.rune => AppColors.rune,
      _ActionTone.ink => AppColors.ink,
    };
  }
}

class _ActionCopy extends StatelessWidget {
  const _ActionCopy({required this.action, this.large = false});

  final _QuickAction action;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          action.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: large ? 16 : 14,
            color: AppColors.ink,
          ),
        ),
        Text(
          action.subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, color: AppColors.inkDim),
        ),
      ],
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox({required this.size, required this.icon, required this.color});

  final double size;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.surface3,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outline),
      ),
      child: Icon(icon, size: size * 0.45, color: color),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.entry, required this.onDelete});

  final SessionHistoryEntry entry;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final date = entry.session.startedAt.toLocal();

    return QfCard(
      padding: EdgeInsets.zero,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        title: Text(
          entry.workoutName,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: AppColors.ink,
          ),
        ),
        subtitle: Text(
          '${_formatDate(date)} - ${entry.exercises.length} exercises - ${entry.setCount} sets',
          style: const TextStyle(fontSize: 11, color: AppColors.inkDim),
        ),
        trailing: IconButton(
          tooltip: 'Delete session',
          icon: const Icon(Icons.delete_outline, color: AppColors.inkFaint),
          onPressed: onDelete,
        ),
        children: [
          for (final exercise in entry.exercises) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                exercise.exerciseName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ),
            const SizedBox(height: 4),
            for (final set in exercise.sets)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Set ${set.setNumber}: ${_formatSet(set)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.inkMute,
                  ),
                ),
              ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  const _EmptyHistory();

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: const [
          Icon(Icons.history_toggle_off, size: 48, color: AppColors.inkDim),
          SizedBox(height: 16),
          Text(
            'No sessions yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Start the next planned seed workout above to test the full logging flow.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.inkMute),
          ),
        ],
      ),
    );
  }
}

String _formatDate(DateTime date) {
  return '${date.month}/${date.day}/${date.year}';
}

String _formatSet(SetLog set) {
  final parts = <String>[];
  if (set.reps != null) parts.add('${set.reps} reps');
  if (set.weight != null) parts.add('${_formatNumber(set.weight!)} kg');
  if (set.rpe != null) parts.add('RPE ${_formatNumber(set.rpe!)}');
  parts.add(set.isComplete ? 'complete' : 'incomplete');

  return parts.join(' - ');
}

String _formatDuration(int seconds) {
  final minutes = (seconds / 60).round();
  return '$minutes min';
}

String _formatPace(double secondsPerKm) {
  final minutes = secondsPerKm ~/ 60;
  final seconds = (secondsPerKm % 60).round().toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

String _fmt(double value) => _formatNumber(value);

String _formatNumber(double value) {
  return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
}

void _showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
