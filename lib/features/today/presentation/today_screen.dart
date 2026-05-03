import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_theme.dart';
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

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: dashboard.when(
          data: (data) => _TodayBody(dashboard: data),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.forest),
          ),
          error: (e, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text('Could not load today: $e',
                  style: const TextStyle(color: AppColors.inkMute)),
            ),
          ),
        ),
      ),
    );
  }
}

class _TodayBody extends StatelessWidget {
  const _TodayBody({required this.dashboard});

  final TodayDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final today = dashboard.today;
    final dayName = _weekdayName(today.weekday).toUpperCase();
    final monthDay =
        '${_monthName(today.month).toUpperCase()} ${today.day}';
    final phaseName = dashboard.currentPhase?.name ?? 'No Phase';

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        QfScreenHeader(
          salutation: '$dayName · $monthDay',
          title: 'Good morning, Adventurer.',
          trailing: QfPill(
            tone: QfPillTone.rune,
            child: Text(phaseName),
          ),
        ),

        // Hero quest card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _HeroQuestCard(dashboard: dashboard),
        ),

        const SizedBox(height: 12),

        // Adventurer + Pet row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Expanded(child: _AdventurerMiniCard()),
              const SizedBox(width: 10),
              Expanded(child: _PetMiniCard()),
            ],
          ),
        ),

        QfRuneDivider(label: "This Week's Trail"),

        // Week ring
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _WeekRingCard(dashboard: dashboard),
        ),

        QfSectionHeader(title: 'Active Goals', moreLabel: 'View all'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _GoalsList(goals: dashboard.goalSnapshot),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

class _HeroQuestCard extends StatelessWidget {
  const _HeroQuestCard({required this.dashboard});

  final TodayDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final template = dashboard.nextWorkoutTemplate;
    final isTraining = dashboard.isTrainingDay;

    return QfCard(
      variant: QfCardVariant.embossed,
      ornamentCorners: true,
      padding: const EdgeInsets.all(16),
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
                    Text(
                      "TODAY'S QUEST",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.rune,
                        letterSpacing: 0.18 * 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      template?.name ?? 'No Quest Scheduled',
                      style: AppTheme.fantasyStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ink,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surface3,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.outline),
                ),
                child: const Icon(
                  Icons.fitness_center,
                  color: AppColors.ember,
                  size: 22,
                ),
              ),
            ],
          ),
          if (template != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '~52',
                  style: AppTheme.monoStyle(
                    fontSize: 13,
                    color: AppColors.ink,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' min',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.inkMute,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '·',
                  style: const TextStyle(color: AppColors.inkFaint),
                ),
                const SizedBox(width: 8),
                Text(
                  '+120 XP',
                  style: AppTheme.monoStyle(
                    fontSize: 13,
                    color: AppColors.ember,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 14),
          if (isTraining && dashboard.todayWorkout != null)
            _QfPrimaryButton(
              label: "Start Today's Quest",
              icon: Icons.play_arrow,
              onPressed: () => context.goNamed(
                WorkoutExecutionScreen.routeName,
                pathParameters: {
                  'scheduledWorkoutId': dashboard.todayWorkout!.id,
                },
              ),
            )
          else
            Container(
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.outline),
              ),
              child: Center(
                child: Text(
                  template == null ? 'No quest scheduled' : 'Rest Day',
                  style: const TextStyle(
                    color: AppColors.inkMute,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          if (isTraining) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _QfSecondaryButton(label: 'Preview', onPressed: () {}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _QfSecondaryButton(
                    label: 'Swap session',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _AdventurerMiniCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              _AvatarRing(progress: 0.62),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'WARRIOR · LV 7',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.inkDim,
                        letterSpacing: 0.06 * 11,
                      ),
                    ),
                    const Text(
                      'Iron Ranger',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _QfProgressBar(value: 0.62),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1,840 XP',
                  style: AppTheme.monoStyle(
                      fontSize: 11, color: AppColors.inkDim)),
              Text('3,000',
                  style:
                      AppTheme.monoStyle(fontSize: 11, color: AppColors.inkDim)),
            ],
          ),
        ],
      ),
    );
  }
}

class _PetMiniCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0F1F0B), Color(0xFF1A2A1A)],
                  ),
                ),
                child: const Icon(Icons.pets, color: AppColors.ember, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'COMPANION · L4',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.inkDim,
                        letterSpacing: 0.06 * 11,
                      ),
                    ),
                    Text(
                      'Ember',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _QfProgressBar(value: 0.4, tone: _ProgressTone.ember),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Bond',
                style: TextStyle(fontSize: 11, color: AppColors.inkDim),
              ),
              Text(
                '★★★★☆',
                style: TextStyle(fontSize: 12, color: AppColors.ember),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeekRingCard extends StatelessWidget {
  const _WeekRingCard({required this.dashboard});

  final TodayDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final today = dashboard.today;
    final weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    final weekStart = today.subtract(Duration(days: today.weekday - 1));
    final scheduledDays = dashboard.weeklyWorkouts
        .map((w) => w.scheduledFor.weekday)
        .toSet();

    final completedCount = dashboard.weeklyWorkouts
        .where((w) => !w.scheduledFor.isAfter(today))
        .length;
    final totalCount = dashboard.weeklyWorkouts.length;

    return QfCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < 7; i++)
                _WeekDay(
                  label: weekdays[i],
                  dayNumber: weekStart.add(Duration(days: i)).day,
                  isToday: i == today.weekday - 1,
                  isScheduled: scheduledDays.contains(i + 1),
                  isPast: weekStart
                      .add(Duration(days: i))
                      .isBefore(today),
                  isRest: !scheduledDays.contains(i + 1),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Adherence',
                style: TextStyle(fontSize: 12, color: AppColors.inkMute),
              ),
              Row(
                children: [
                  Text(
                    '$completedCount / $totalCount',
                    style: AppTheme.fantasyStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                  const Text(
                    ' this week',
                    style: TextStyle(fontSize: 12, color: AppColors.inkDim),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeekDay extends StatelessWidget {
  const _WeekDay({
    required this.label,
    required this.dayNumber,
    required this.isToday,
    required this.isScheduled,
    required this.isPast,
    required this.isRest,
  });

  final String label;
  final int dayNumber;
  final bool isToday;
  final bool isScheduled;
  final bool isPast;
  final bool isRest;

  @override
  Widget build(BuildContext context) {
    final isDone = isScheduled && isPast;

    Color bg;
    Color border;
    Color iconColor;

    if (isDone) {
      bg = const Color(0x2668D391);
      border = const Color(0x4D68D391);
      iconColor = AppColors.forest;
    } else if (isToday) {
      bg = AppColors.surface2;
      border = AppColors.forest;
      iconColor = AppColors.ink;
    } else if (isRest) {
      bg = AppColors.surface2;
      border = AppColors.outlineSoft;
      iconColor = AppColors.inkFaint;
    } else {
      bg = AppColors.surface2;
      border = AppColors.outlineSoft;
      iconColor = AppColors.inkMute;
    }

    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: AppColors.inkDim),
        ),
        const SizedBox(height: 6),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: border),
          ),
          child: Center(
            child: isDone
                ? Icon(Icons.check, size: 14, color: iconColor)
                : isRest
                    ? Icon(Icons.dark_mode_outlined, size: 13, color: iconColor)
                    : Text(
                        '$dayNumber',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: iconColor,
                          fontFamily: 'monospace',
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}

class _GoalsList extends StatelessWidget {
  const _GoalsList({required this.goals});

  final List<Goal> goals;

  @override
  Widget build(BuildContext context) {
    if (goals.isEmpty) {
      return QfCard(
        child: const Text(
          'No active goals yet.',
          style: TextStyle(color: AppColors.inkMute),
        ),
      );
    }

    return Column(
      children: [
        for (var i = 0; i < goals.length; i++) ...[
          _GoalCard(goal: goals[i]),
          if (i < goals.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    final current = goal.currentValue;
    final progress = current == null
        ? 0.0
        : goal.direction == 'lower'
            ? (goal.targetValue / current).clamp(0.0, 1.0)
            : (current / goal.targetValue).clamp(0.0, 1.0);

    final tone = _toneForGoal(goal);
    final icon = _iconForGoal(goal);

    return QfCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.outline),
                ),
                child: Icon(icon, size: 16, color: AppColors.inkMute),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppColors.ink,
                      ),
                    ),
                    const Text(
                      'by Sep 30, 2026',
                      style: TextStyle(fontSize: 11, color: AppColors.inkDim),
                    ),
                  ],
                ),
              ),
              Text(
                '${_fmt(current)} / ${_fmt(goal.targetValue)}${goal.unit.isNotEmpty ? ' ${goal.unit}' : ''}',
                style: AppTheme.monoStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _QfProgressBar(value: progress, tone: tone),
        ],
      ),
    );
  }

  _ProgressTone _toneForGoal(Goal g) {
    if (g.linkedMetric == 'bodyweight') return _ProgressTone.ember;
    if ((g.linkedMetric ?? '').contains('run') ||
        (g.linkedMetric ?? '').contains('pace')) {
      return _ProgressTone.sky;
    }
    return _ProgressTone.forest;
  }

  IconData _iconForGoal(Goal g) {
    if (g.linkedMetric == 'bodyweight') return Icons.monitor_weight_outlined;
    if ((g.linkedMetric ?? '').contains('run') ||
        (g.linkedMetric ?? '').contains('pace')) {
      return Icons.directions_run;
    }
    return Icons.fitness_center;
  }

  String _fmt(double? v) {
    if (v == null) return '—';
    return v == v.roundToDouble()
        ? v.toInt().toString()
        : v.toStringAsFixed(1);
  }
}

// ─── Shared local widgets ────────────────────────────────────────────────────

class _QfPrimaryButton extends StatelessWidget {
  const _QfPrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7CDFA0), Color(0xFF4FB87B)],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x404FB87B),
              blurRadius: 18,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.bgDeep, size: 16),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: GoogleFonts.interTight(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.bgDeep,
                letterSpacing: 0.16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QfSecondaryButton extends StatelessWidget {
  const _QfSecondaryButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.outline),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarRing extends StatelessWidget {
  const _AvatarRing({required this.progress});

  final double progress;
  static const double size = 42.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _AvatarRingPainter(progress: progress),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface2,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.bg, width: 2),
            ),
            child: const Icon(
              Icons.shield,
              color: AppColors.forest,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarRingPainter extends CustomPainter {
  const _AvatarRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final trackPaint = Paint()
      ..color = AppColors.surface3
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    final fillPaint = Paint()
      ..color = AppColors.forest
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(1.25, 1.25, size.width - 2.5, size.height - 2.5);
    canvas.drawArc(rect, -1.5708, 2 * 3.14159, false, trackPaint);
    canvas.drawArc(rect, -1.5708, 2 * 3.14159 * progress, false, fillPaint);
  }

  @override
  bool shouldRepaint(_AvatarRingPainter old) => old.progress != progress;
}

enum _ProgressTone { forest, ember, sky, gold }

class _QfProgressBar extends StatelessWidget {
  const _QfProgressBar({
    required this.value,
    this.tone = _ProgressTone.forest,
  });

  final double value;
  final _ProgressTone tone;
  static const double height = 6.0;

  @override
  Widget build(BuildContext context) {
    final (trackColor, startColor, endColor) = _colors();

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: trackColor,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.outlineSoft),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [startColor, endColor]),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
    );
  }

  (Color, Color, Color) _colors() {
    return switch (tone) {
      _ProgressTone.forest => (
          AppColors.surface3,
          AppColors.forestDeep,
          AppColors.forest,
        ),
      _ProgressTone.ember => (
          AppColors.surface3,
          AppColors.emberDeep,
          AppColors.ember,
        ),
      _ProgressTone.sky => (
          AppColors.surface3,
          const Color(0xFF2C5282),
          AppColors.sky,
        ),
      _ProgressTone.gold => (
          AppColors.surface3,
          const Color(0xFFB7791F),
          AppColors.gold,
        ),
    };
  }
}

// ─── Date helpers ─────────────────────────────────────────────────────────────

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
