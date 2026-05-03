import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/data_providers.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../application/session_history_controller.dart';

class LogScreen extends ConsumerWidget {
  const LogScreen({super.key});

  static const routeName = 'log';
  static const routePath = '/log';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(sessionHistoryProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: historyAsync.when(
          data: (history) => _LogBody(
            history: history,
            onDelete: (entry) => _deleteSession(context, ref, entry),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.forest),
          ),
          error: (e, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text('Log could not be loaded: $e',
                  style: const TextStyle(color: AppColors.inkMute)),
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

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Session deleted')),
    );
  }
}

class _LogBody extends StatelessWidget {
  const _LogBody({required this.history, required this.onDelete});

  final List<SessionHistoryEntry> history;
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

        // Quick action grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _QuickActionGrid(),
        ),

        QfSectionHeader(
          title: 'Recent Entries',
          moreLabel: 'Filter',
        ),

        if (history.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
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

class _QuickActionGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickAction(
        icon: Icons.fitness_center,
        title: 'Start Workout',
        subtitle: 'From a plan',
        tone: _ActionTone.forest,
        wide: true,
      ),
      _QuickAction(
        icon: Icons.add,
        title: 'Empty Session',
        subtitle: 'Build as you go',
        tone: _ActionTone.ink,
        wide: false,
      ),
      _QuickAction(
        icon: Icons.directions_run,
        title: 'Log Run',
        subtitle: 'Distance · pace',
        tone: _ActionTone.sky,
        wide: false,
      ),
      _QuickAction(
        icon: Icons.monitor_weight_outlined,
        title: 'Bodyweight',
        subtitle: 'Quick check-in',
        tone: _ActionTone.ember,
        wide: false,
      ),
      _QuickAction(
        icon: Icons.spa_outlined,
        title: 'Recovery Day',
        subtitle: 'Rest at camp',
        tone: _ActionTone.rune,
        wide: false,
      ),
    ];

    // Lay out: first item spans full width, rest in 2-column grid
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
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final _ActionTone tone;
  final bool wide;
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.action});

  final _QuickAction action;

  @override
  Widget build(BuildContext context) {
    final iconColor = _toneColor(action.tone);
    final iconBoxSize = action.wide ? 48.0 : 38.0;

    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(14),
      child: action.wide
          ? Row(
              children: [
                _IconBox(size: iconBoxSize, icon: action.icon, color: iconColor),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      action.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.ink),
                    ),
                    Text(
                      action.subtitle,
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.inkDim),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _IconBox(size: iconBoxSize, icon: action.icon, color: iconColor),
                const SizedBox(height: 10),
                Text(
                  action.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.ink),
                ),
                Text(
                  action.subtitle,
                  style: const TextStyle(fontSize: 11, color: AppColors.inkDim),
                ),
              ],
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

class _IconBox extends StatelessWidget {
  const _IconBox({
    required this.size,
    required this.icon,
    required this.color,
  });

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
    final day = _shortWeekday(date.weekday).toUpperCase();
    final dayNum = date.day;
    final icon = _iconForWorkout(entry.workoutName);
    final tone = _toneForWorkout(entry.workoutName);
    final xp = '+${_calcXp(entry.setCount)} XP';

    return QfCard(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          SizedBox(
            width: 42,
            child: Column(
              children: [
                Text(
                  day,
                  style: AppTheme.monoStyle(
                      fontSize: 9, color: AppColors.inkDim),
                ),
                Text(
                  '$dayNum',
                  style: AppTheme.fantasyStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.inkMute),
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.outlineSoft),
            ),
            child: Icon(icon, size: 16, color: tone),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.workoutName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  '${entry.exercises.length} ex · ${entry.setCount} sets',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.inkDim,
                  ),
                ),
              ],
            ),
          ),
          Text(
            xp,
            style: AppTheme.monoStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.ember,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onDelete,
            child: const Icon(
              Icons.chevron_right,
              size: 16,
              color: AppColors.inkFaint,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForWorkout(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('run') || lower.contains('cardio')) {
      return Icons.directions_run;
    }
    if (lower.contains('recovery') || lower.contains('mobility')) {
      return Icons.spa_outlined;
    }
    if (lower.contains('weight') || lower.contains('body')) {
      return Icons.monitor_weight_outlined;
    }
    return Icons.fitness_center;
  }

  Color _toneForWorkout(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('run') || lower.contains('cardio')) return AppColors.sky;
    if (lower.contains('recovery')) return AppColors.rune;
    if (lower.contains('weight')) return AppColors.ember;
    return AppColors.forest;
  }

  int _calcXp(int sets) => (sets * 6).clamp(10, 200);

  String _shortWeekday(int weekday) {
    return const ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'][weekday - 1];
  }
}

class _EmptyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Icon(Icons.history_toggle_off,
              size: 48, color: AppColors.inkDim),
          const SizedBox(height: 16),
          Text(
            'No sessions yet',
            style: AppTheme.fantasyStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Completed workouts will appear here.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.inkMute),
          ),
        ],
      ),
    );
  }
}
