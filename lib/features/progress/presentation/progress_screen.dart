import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../application/progress_dashboard_controller.dart';

class ProgressScreen extends ConsumerStatefulWidget {
  const ProgressScreen({super.key});

  static const routeName = 'progress';
  static const routePath = '/progress';

  @override
  ConsumerState<ProgressScreen> createState() => _ProgressScreenState();
}

final _exerciseProgressProvider = FutureProvider.autoDispose
    .family<ExerciseProgressDetail?, String>((ref, exerciseId) async {
      final repositories = AppRepositories(ref.watch(appDatabaseProvider));
      return repositories.exercises.getProgressDetail(exerciseId);
    });

class ExerciseDetailScreen extends ConsumerWidget {
  const ExerciseDetailScreen({required this.exerciseId, super.key});

  static const routeName = 'exerciseDetail';
  static const routePath = 'exercise/:exerciseId';

  final String exerciseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(_exerciseProgressProvider(exerciseId));

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: detailAsync.when(
          data: (detail) {
            if (detail == null) {
              return const Center(
                child: Text(
                  'Exercise not found',
                  style: TextStyle(color: AppColors.inkMute),
                ),
              );
            }

            return _ExerciseDetailBody(detail: detail);
          },
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.forest),
          ),
          error: (error, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                'Exercise progress could not be loaded: $error',
                style: const TextStyle(color: AppColors.inkMute),
              ),
            ),
          ),
        ),
      ),
    );
  }
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

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: dashboardAsync.when(
          data: (data) => _ProgressBody(
            data: data,
            weightController: _weightController,
            isSaving: _isSaving,
            onSaveWeight: _saveBodyweight,
            onEditGoal: _editGoal,
            onOpenExercise: _openExercise,
            onEditWorkingWeight: _editWorkingWeight,
            onAcceptSuggestion: _acceptProgressionSuggestion,
            onIgnoreSuggestion: _ignoreProgressionSuggestion,
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.forest),
          ),
          error: (e, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(
                'Progress could not be loaded: $e',
                style: const TextStyle(color: AppColors.inkMute),
              ),
            ),
          ),
        ),
      ),
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

    if (!mounted) return;
    _weightController.clear();
    ref.invalidate(progressDashboardProvider);
    setState(() => _isSaving = false);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Bodyweight logged')));
  }

  Future<void> _editGoal(Goal goal) async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) => _GoalValueDialog(goal: goal),
    );
    if (value == null) return;

    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.goals.updateCurrentValue(
      goalId: goal.id,
      currentValue: value,
    );

    ref.invalidate(progressDashboardProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('${goal.name} updated')));
  }

  void _openExercise(String exerciseId) {
    context.goNamed(
      ExerciseDetailScreen.routeName,
      pathParameters: {'exerciseId': exerciseId},
    );
  }

  Future<void> _editWorkingWeight(WorkingWeightSummary summary) async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) => _WorkingWeightDialog(summary: summary),
    );
    if (value == null) return;

    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.exercises.setManualWorkingWeight(
      exerciseId: summary.exercise.id,
      weight: value,
      unit: summary.workingWeight?.unit ?? summary.exercise.defaultUnit,
    );

    ref.invalidate(progressDashboardProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${summary.exercise.name} working weight updated'),
      ),
    );
  }

  Future<void> _acceptProgressionSuggestion(
    ProgressionSuggestionView suggestion,
  ) async {
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.exercises.acceptProgressionSuggestion(
      suggestion.suggestion.id,
    );
    ref.invalidate(progressDashboardProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${suggestion.exercise.name} progression accepted'),
      ),
    );
  }

  Future<void> _ignoreProgressionSuggestion(
    ProgressionSuggestionView suggestion,
  ) async {
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.exercises.ignoreProgressionSuggestion(
      suggestion.suggestion.id,
    );
    ref.invalidate(progressDashboardProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${suggestion.exercise.name} suggestion ignored')),
    );
  }
}

String _formatGoalValue(double? value) {
  if (value == null) return '--';
  return value == value.roundToDouble()
      ? value.toInt().toString()
      : value.toStringAsFixed(1);
}

String _formatSet(SetPerformance performance) {
  final weight = _formatGoalValue(performance.weight);
  final reps = performance.reps?.toString() ?? '--';
  return '$weight x $reps';
}

String _formatPace(double secondsPerKm) {
  final minutes = secondsPerKm ~/ 60;
  final seconds = (secondsPerKm % 60).round().toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

String _formatDate(DateTime dt) {
  final local = dt.toLocal();
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return '${months[local.month - 1]} ${local.day}, ${local.year}';
}

class _GoalValueDialog extends StatefulWidget {
  const _GoalValueDialog({required this.goal});

  final Goal goal;

  @override
  State<_GoalValueDialog> createState() => _GoalValueDialogState();
}

class _GoalValueDialogState extends State<_GoalValueDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.goal.currentValue == null
          ? ''
          : _formatGoalValue(widget.goal.currentValue),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text(
        'Update ${widget.goal.name}',
        style: const TextStyle(color: AppColors.ink),
      ),
      content: TextField(
        key: const Key('goal-current-value-field'),
        controller: _controller,
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        style: AppTheme.monoStyle(color: AppColors.ink),
        decoration: InputDecoration(
          labelText: 'Current value',
          suffixText: widget.goal.unit,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          key: const Key('goal-current-value-save-button'),
          onPressed: () {
            final parsed = double.tryParse(_controller.text.trim());
            if (parsed == null || parsed < 0) return;
            Navigator.of(context).pop(parsed);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _WorkingWeightDialog extends StatefulWidget {
  const _WorkingWeightDialog({required this.summary});

  final WorkingWeightSummary summary;

  @override
  State<_WorkingWeightDialog> createState() => _WorkingWeightDialogState();
}

class _WorkingWeightDialogState extends State<_WorkingWeightDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: _formatGoalValue(widget.summary.displayWeight),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unit =
        widget.summary.workingWeight?.unit ??
        widget.summary.exercise.defaultUnit;

    return AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text(
        'Correct ${widget.summary.exercise.name}',
        style: const TextStyle(color: AppColors.ink),
      ),
      content: TextField(
        key: const Key('working-weight-field'),
        controller: _controller,
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
        style: AppTheme.monoStyle(color: AppColors.ink),
        decoration: InputDecoration(
          labelText: 'Working weight',
          suffixText: unit,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          key: const Key('working-weight-save-button'),
          onPressed: () {
            final parsed = double.tryParse(_controller.text.trim());
            if (parsed == null || parsed < 0) return;
            Navigator.of(context).pop(parsed);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}

class _ExerciseDetailBody extends StatelessWidget {
  const _ExerciseDetailBody({required this.detail});

  final ExerciseProgressDetail detail;

  @override
  Widget build(BuildContext context) {
    final workingWeight = detail.workingWeight;
    final best = detail.bestPerformance;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        QfScreenHeader(
          salutation: 'Exercise',
          title: detail.exercise.name,
          trailing: QfPill(
            tone: QfPillTone.muted,
            child: Text(detail.exercise.defaultUnit),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: QfCard(
            variant: QfCardVariant.embossed,
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Expanded(
                  child: _DetailMetric(
                    label: 'Working',
                    value: workingWeight == null
                        ? '--'
                        : '${_formatGoalValue(workingWeight.weight)} ${workingWeight.unit}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _DetailMetric(
                    label: 'Best Set',
                    value: best == null ? '--' : _formatSet(best),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _DetailMetric(
                    label: 'Est. 1RM',
                    value: best?.estimatedOneRepMax == null
                        ? '--'
                        : _formatGoalValue(best!.estimatedOneRepMax),
                  ),
                ),
              ],
            ),
          ),
        ),
        const QfSectionHeader(title: 'Set History'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _SetHistoryCard(performances: detail.performances),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _DetailMetric extends StatelessWidget {
  const _DetailMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 10, color: AppColors.inkDim),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTheme.monoStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
      ],
    );
  }
}

class _SetHistoryCard extends StatelessWidget {
  const _SetHistoryCard({required this.performances});

  final List<SetPerformance> performances;

  @override
  Widget build(BuildContext context) {
    if (performances.isEmpty) {
      return const QfCard(
        padding: EdgeInsets.all(14),
        child: Text(
          'No logged sets yet.',
          style: TextStyle(color: AppColors.inkMute),
        ),
      );
    }

    return QfCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var i = 0; i < performances.take(20).length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          performances[i].workoutName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.ink,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _formatDate(performances[i].sessionStartedAt),
                          style: const TextStyle(
                            color: AppColors.inkDim,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _formatSet(performances[i]),
                    style: AppTheme.monoStyle(
                      color: AppColors.forest,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    performances[i].estimatedOneRepMax == null
                        ? 'e1RM --'
                        : 'e1RM ${_formatGoalValue(performances[i].estimatedOneRepMax)}',
                    style: AppTheme.monoStyle(
                      color: AppColors.inkDim,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            if (i < performances.take(20).length - 1)
              const Divider(height: 1, color: AppColors.outlineSoft),
          ],
        ],
      ),
    );
  }
}

class _ProgressBody extends StatelessWidget {
  const _ProgressBody({
    required this.data,
    required this.weightController,
    required this.isSaving,
    required this.onSaveWeight,
    required this.onEditGoal,
    required this.onOpenExercise,
    required this.onEditWorkingWeight,
    required this.onAcceptSuggestion,
    required this.onIgnoreSuggestion,
  });

  final ProgressDashboardData data;
  final TextEditingController weightController;
  final bool isSaving;
  final VoidCallback onSaveWeight;
  final ValueChanged<Goal> onEditGoal;
  final ValueChanged<String> onOpenExercise;
  final ValueChanged<WorkingWeightSummary> onEditWorkingWeight;
  final ValueChanged<ProgressionSuggestionView> onAcceptSuggestion;
  final ValueChanged<ProgressionSuggestionView> onIgnoreSuggestion;

  @override
  Widget build(BuildContext context) {
    final bwHistory = data.chronologicalBodyweightHistory;
    final latest = data.latestBodyweight;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        QfScreenHeader(
          salutation: 'The Chronicle',
          title: 'Progress',
          trailing: const QfPill(
            tone: QfPillTone.muted,
            child: Text('8 weeks'),
          ),
        ),

        // Bodyweight hero card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _BodyweightHeroCard(
            history: bwHistory,
            latest: latest,
            goal: data.bodyweightGoal,
          ),
        ),

        const QfSectionHeader(title: 'Analytics Snapshot'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _AnalyticsSnapshotCard(data: data),
        ),

        if (data.recentRuns.isNotEmpty) ...[
          const QfSectionHeader(title: 'Pace Trend'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: _PaceTrendCard(runs: data.chronologicalRuns),
          ),
        ],

        // Quick log entry
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _QuickLogCard(
            controller: weightController,
            isSaving: isSaving,
            onSave: onSaveWeight,
          ),
        ),

        if (data.workingWeights.isNotEmpty) ...[
          const QfSectionHeader(
            title: 'Working Weights',
            moreLabel: 'Tap exercise',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: _WorkingWeightsCard(
              summaries: data.workingWeights.take(8).toList(),
              onOpenExercise: onOpenExercise,
              onEditWorkingWeight: onEditWorkingWeight,
            ),
          ),
        ],

        if (data.progressionSuggestions.isNotEmpty) ...[
          const QfSectionHeader(title: 'Progression Flags'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: _ProgressionSuggestionsCard(
              suggestions: data.progressionSuggestions,
              onAccept: onAcceptSuggestion,
              onIgnore: onIgnoreSuggestion,
            ),
          ),
        ],

        // Goal dashboard
        if (data.goals.isNotEmpty) ...[
          const QfSectionHeader(
            title: 'Goals Dashboard',
            moreLabel: '5 active',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: _GoalsDashboardCard(
              goals: data.goals,
              onEditGoal: onEditGoal,
            ),
          ),
        ],

        const QfSectionHeader(title: 'Recent PR Highlights'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _PrHighlightsCard(highlights: data.prHighlights),
        ),

        // Bodyweight history
        if (bwHistory.isNotEmpty) ...[
          const QfSectionHeader(title: 'History'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: _BwHistoryCard(entries: bwHistory),
          ),
        ],

        const SizedBox(height: 24),
      ],
    );
  }
}

class _BodyweightHeroCard extends StatelessWidget {
  const _BodyweightHeroCard({
    required this.history,
    required this.latest,
    required this.goal,
  });

  final List<BodyweightLog> history;
  final BodyweightLog? latest;
  final Goal? goal;

  @override
  Widget build(BuildContext context) {
    final values = history.map((e) => e.weightKg).toList();
    final delta = history.length >= 2
        ? history.last.weightKg - history.first.weightKg
        : 0.0;
    final deltaStr = delta == 0
        ? '—'
        : '${delta < 0 ? '' : '+'}${delta.toStringAsFixed(1)} kg';

    return QfCard(
      variant: QfCardVariant.embossed,
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BODYWEIGHT',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.rune,
                        letterSpacing: 0.16 * 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          latest == null ? '—' : _fmt(latest!.weightKg),
                          style: AppTheme.fantasyStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            'kg',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.inkDim,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$deltaStr in ${history.length} entries',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.ember,
                      ),
                    ),
                  ],
                ),
              ),
              if (goal != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'GOAL',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.inkDim,
                        letterSpacing: 0.08 * 10,
                      ),
                    ),
                    Text(
                      _fmt(goal!.targetValue),
                      style: AppTheme.monoStyle(
                        fontSize: 18,
                        color: AppColors.ink,
                      ),
                    ),
                    const Text(
                      'Sep 30',
                      style: TextStyle(fontSize: 10, color: AppColors.ember),
                    ),
                  ],
                ),
            ],
          ),
          if (values.length >= 2) ...[
            const SizedBox(height: 10),
            SizedBox(
              height: 60,
              child: CustomPaint(
                painter: _SparklinePainter(
                  values: values,
                  lineColor: AppColors.ember,
                  fillColor: AppColors.ember.withValues(alpha: 0.15),
                ),
                size: const Size(double.infinity, 60),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : v.toStringAsFixed(1);
}

class _SparklinePainter extends CustomPainter {
  const _SparklinePainter({
    required this.values,
    required this.lineColor,
    required this.fillColor,
  });

  final List<double> values;
  final Color lineColor;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;

    final min = values.reduce((a, b) => a < b ? a : b);
    final max = values.reduce((a, b) => a > b ? a : b);
    final range = (max - min).abs();

    List<Offset> points = [];
    for (var i = 0; i < values.length; i++) {
      final x = (i / (values.length - 1)) * size.width;
      final y = range == 0
          ? size.height * 0.5
          : size.height - ((values[i] - min) / range) * (size.height - 8) - 4;
      points.add(Offset(x, y));
    }

    final fillPath = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      fillPath.lineTo(p.dx, p.dy);
    }
    fillPath
      ..lineTo(points.last.dx, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(fillPath, Paint()..color = fillColor);

    final linePath = Path()..moveTo(points.first.dx, points.first.dy);
    for (final p in points.skip(1)) {
      linePath.lineTo(p.dx, p.dy);
    }

    canvas.drawPath(
      linePath,
      Paint()
        ..color = lineColor
        ..strokeWidth = 1.8
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    for (final p in points) {
      canvas.drawCircle(p, 2, Paint()..color = lineColor);
    }
  }

  @override
  bool shouldRepaint(_SparklinePainter old) =>
      old.values != values || old.lineColor != lineColor;
}

class _QuickLogCard extends StatelessWidget {
  const _QuickLogCard({
    required this.controller,
    required this.isSaving,
    required this.onSave,
  });

  final TextEditingController controller;
  final bool isSaving;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'LOG BODYWEIGHT',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.rune,
              letterSpacing: 0.16 * 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
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
                  style: AppTheme.monoStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                  decoration: const InputDecoration(
                    hintText: '91.2',
                    suffixText: 'kg',
                    suffixStyle: TextStyle(color: AppColors.inkDim),
                  ),
                  onSubmitted: (_) => onSave(),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                key: const Key('bodyweight-log-button'),
                onTap: isSaving ? null : onSave,
                child: Container(
                  width: 80,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: isSaving
                        ? null
                        : const LinearGradient(
                            colors: [Color(0xFF7CDFA0), Color(0xFF4FB87B)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                    color: isSaving ? AppColors.surface3 : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.forest,
                            ),
                          )
                        : const Text(
                            'Log',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.bgDeep,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WorkingWeightsCard extends StatelessWidget {
  const _WorkingWeightsCard({
    required this.summaries,
    required this.onOpenExercise,
    required this.onEditWorkingWeight,
  });

  final List<WorkingWeightSummary> summaries;
  final ValueChanged<String> onOpenExercise;
  final ValueChanged<WorkingWeightSummary> onEditWorkingWeight;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var i = 0; i < summaries.length; i++) ...[
            _WorkingWeightRow(
              summary: summaries[i],
              onOpen: () => onOpenExercise(summaries[i].exercise.id),
              onEdit: () => onEditWorkingWeight(summaries[i]),
            ),
            if (i < summaries.length - 1)
              const Divider(height: 1, color: AppColors.outlineSoft),
          ],
        ],
      ),
    );
  }
}

class _PrHighlightsCard extends StatelessWidget {
  const _PrHighlightsCard({required this.highlights});

  final List<WorkingWeightSummary> highlights;

  @override
  Widget build(BuildContext context) {
    if (highlights.isEmpty) {
      return const QfCard(
        padding: EdgeInsets.all(14),
        child: Text(
          'Complete weighted sets to unlock PR highlights.',
          style: TextStyle(color: AppColors.inkMute),
        ),
      );
    }

    return QfCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var i = 0; i < highlights.length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          highlights[i].exercise.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.ink,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          highlights[i].bestPerformance == null
                              ? 'No set logged'
                              : 'Best ${_formatSet(highlights[i].bestPerformance!)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.inkDim,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    highlights[i].bestPerformance?.estimatedOneRepMax == null
                        ? 'e1RM --'
                        : 'e1RM ${_formatGoalValue(highlights[i].bestPerformance!.estimatedOneRepMax)}',
                    style: AppTheme.monoStyle(
                      color: AppColors.gold,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            if (i < highlights.length - 1)
              const Divider(height: 1, color: AppColors.outlineSoft),
          ],
        ],
      ),
    );
  }
}

class _ProgressionSuggestionsCard extends StatelessWidget {
  const _ProgressionSuggestionsCard({
    required this.suggestions,
    required this.onAccept,
    required this.onIgnore,
  });

  final List<ProgressionSuggestionView> suggestions;
  final ValueChanged<ProgressionSuggestionView> onAccept;
  final ValueChanged<ProgressionSuggestionView> onIgnore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < suggestions.length; i++) ...[
          _ProgressionSuggestionCard(
            suggestion: suggestions[i],
            onAccept: () => onAccept(suggestions[i]),
            onIgnore: () => onIgnore(suggestions[i]),
          ),
          if (i < suggestions.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _ProgressionSuggestionCard extends StatelessWidget {
  const _ProgressionSuggestionCard({
    required this.suggestion,
    required this.onAccept,
    required this.onIgnore,
  });

  final ProgressionSuggestionView suggestion;
  final VoidCallback onAccept;
  final VoidCallback onIgnore;

  @override
  Widget build(BuildContext context) {
    final data = suggestion.suggestion;
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.trending_up, color: AppColors.forest, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  suggestion.exercise.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '${_formatGoalValue(data.currentWeight)} -> ${_formatGoalValue(data.suggestedWeight)} ${data.unit}',
                style: AppTheme.monoStyle(
                  color: AppColors.forest,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            data.reason,
            style: const TextStyle(color: AppColors.inkMute, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  key: ValueKey('ignore-progression-${data.id}'),
                  onPressed: onIgnore,
                  child: const Text('Ignore'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  key: ValueKey('accept-progression-${data.id}'),
                  onPressed: onAccept,
                  child: const Text('Accept'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WorkingWeightRow extends StatelessWidget {
  const _WorkingWeightRow({
    required this.summary,
    required this.onOpen,
    required this.onEdit,
  });

  final WorkingWeightSummary summary;
  final VoidCallback onOpen;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final weight = summary.displayWeight;
    final unit = summary.workingWeight?.unit ?? summary.exercise.defaultUnit;
    final best = summary.bestPerformance;
    final e1rm = best?.estimatedOneRepMax;

    return InkWell(
      onTap: onOpen,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    summary.exercise.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    summary.workingWeight?.isManualOverride ?? false
                        ? 'Manual override'
                        : best == null
                        ? 'Seed target'
                        : 'Best ${_formatSet(best)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.inkDim,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${_formatGoalValue(weight)} $unit',
                  style: AppTheme.monoStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.forest,
                  ),
                ),
                Text(
                  e1rm == null ? 'e1RM --' : 'e1RM ${_formatGoalValue(e1rm)}',
                  style: AppTheme.monoStyle(
                    fontSize: 10,
                    color: AppColors.inkDim,
                  ),
                ),
              ],
            ),
            IconButton(
              key: ValueKey('edit-working-weight-${summary.exercise.id}'),
              tooltip: 'Correct working weight',
              onPressed: onEdit,
              icon: const Icon(Icons.tune, size: 17),
              color: AppColors.inkMute,
              constraints: const BoxConstraints.tightFor(width: 36, height: 36),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalsDashboardCard extends StatelessWidget {
  const _GoalsDashboardCard({required this.goals, required this.onEditGoal});

  final List<Goal> goals;
  final ValueChanged<Goal> onEditGoal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < goals.length; i++) ...[
          _GoalDashboardRow(goal: goals[i], onEdit: () => onEditGoal(goals[i])),
          if (i < goals.length - 1) const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _GoalDashboardRow extends StatelessWidget {
  const _GoalDashboardRow({required this.goal, required this.onEdit});

  final Goal goal;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final current = goal.currentValue;
    final progress = _goalProgress(goal);
    final tone = _toneForGoal(goal);
    final directionLabel = goal.direction == 'lower'
        ? 'Lower is better'
        : 'Higher is better';
    final metricLabel = goal.linkedMetric == null
        ? 'Manual'
        : 'Linked: ${_metricLabel(goal.linkedMetric!)}';

    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: _toneColor(tone).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _toneColor(tone).withValues(alpha: 0.35),
                  ),
                ),
                child: Icon(
                  _iconForGoal(goal),
                  size: 17,
                  color: _toneColor(tone),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goal.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${goal.category.toUpperCase()} · $directionLabel',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.inkDim,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                key: ValueKey('edit-goal-${goal.id}'),
                tooltip: 'Edit current value',
                onPressed: onEdit,
                icon: const Icon(Icons.edit, size: 18),
                color: AppColors.inkMute,
                constraints: const BoxConstraints.tightFor(
                  width: 36,
                  height: 36,
                ),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _GoalValueBlock(
                  label: 'Current',
                  value: _formatGoalValue(current),
                  unit: goal.unit,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _GoalValueBlock(
                  label: 'Target',
                  value: _formatGoalValue(goal.targetValue),
                  unit: goal.unit,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _ThemedProgressBar(value: progress, tone: tone),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${(progress * 100).round()}% complete',
                  style: AppTheme.monoStyle(
                    fontSize: 11,
                    color: _toneColor(tone),
                  ),
                ),
              ),
              Text(
                _formatTargetDate(goal.targetDate),
                style: const TextStyle(fontSize: 11, color: AppColors.inkDim),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            metricLabel,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, color: AppColors.inkMute),
          ),
        ],
      ),
    );
  }

  double _goalProgress(Goal goal) {
    final current = goal.currentValue;
    if (current == null || current <= 0 || goal.targetValue <= 0) return 0;
    if (goal.direction == 'lower') {
      return (goal.targetValue / current).clamp(0.0, 1.0);
    }
    return (current / goal.targetValue).clamp(0.0, 1.0);
  }

  _BarTone _toneForGoal(Goal goal) {
    if (goal.category == 'cardio') return _BarTone.sky;
    if (goal.category == 'body composition') return _BarTone.ember;
    if (goal.name.toLowerCase().contains('pull')) return _BarTone.gold;
    return _BarTone.forest;
  }

  Color _toneColor(_BarTone tone) => switch (tone) {
    _BarTone.forest => AppColors.forest,
    _BarTone.ember => AppColors.ember,
    _BarTone.sky => AppColors.sky,
    _BarTone.gold => AppColors.gold,
  };

  IconData _iconForGoal(Goal goal) {
    if (goal.category == 'cardio') return Icons.directions_run;
    if (goal.category == 'body composition') return Icons.monitor_weight;
    if (goal.name.toLowerCase().contains('pull')) return Icons.fitness_center;
    return Icons.sports_gymnastics;
  }

  String _metricLabel(String metric) {
    if (metric == 'bodyweight') return 'Bodyweight log';
    if (metric == 'cardio:5k_time') return '5 km run time';
    if (metric.startsWith('exercise:')) {
      return metric.substring('exercise:'.length).replaceAll('-', ' ');
    }
    return metric;
  }

  String _formatTargetDate(DateTime? date) {
    if (date == null) return 'No target date';
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final local = date.toLocal();
    return '${months[local.month - 1]} ${local.day}, ${local.year}';
  }
}

class _GoalValueBlock extends StatelessWidget {
  const _GoalValueBlock({
    required this.label,
    required this.value,
    required this.unit,
  });

  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: AppColors.inkDim),
          ),
          const SizedBox(height: 3),
          Text(
            '$value${unit.isEmpty ? '' : ' $unit'}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.monoStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _GoalCampaignCard extends StatelessWidget {
  const _GoalCampaignCard({required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    final current = goal.currentValue;
    final progress = current == null
        ? 0.0
        : goal.direction == 'lower'
        ? (goal.targetValue / current).clamp(0.0, 1.0)
        : (current / goal.targetValue).clamp(0.0, 1.0);

    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                goal.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: AppColors.ink,
                ),
              ),
              Text(
                '${_fmt(current)} / ${_fmt(goal.targetValue)} ${goal.unit}',
                style: AppTheme.monoStyle(fontSize: 12, color: AppColors.ink),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _ThemedProgressBar(value: progress, tone: _BarTone.ember),
        ],
      ),
    );
  }

  String _fmt(double? v) {
    if (v == null) return '—';
    return v == v.roundToDouble() ? v.toInt().toString() : v.toStringAsFixed(1);
  }
}

class _AnalyticsSnapshotCard extends StatelessWidget {
  const _AnalyticsSnapshotCard({required this.data});

  final ProgressDashboardData data;

  @override
  Widget build(BuildContext context) {
    final analytics = data.analytics;
    final volumeFraction = (analytics.weeklyVolumeKg / 25000).clamp(0.04, 1.0);

    return QfCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _AnalyticsMetric(
                  label: 'Workouts',
                  value:
                      '${analytics.weeklyWorkoutCount}/${analytics.plannedWorkoutCount}',
                  detail: 'this week',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _AnalyticsMetric(
                  label: 'Adherence',
                  value: '${(analytics.adherence * 100).round()}%',
                  detail: 'scheduled',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _AnalyticsMetric(
                  label: 'Streak',
                  value: '${analytics.currentTrainingStreakDays}',
                  detail: 'days',
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 56,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i = 0; i < 7; i++) ...[
                  Expanded(
                    child: _VolumeBar(
                      fraction: i == 6 ? volumeFraction : 0.08,
                      isCurrent: i == 6,
                    ),
                  ),
                  if (i < 6) const SizedBox(width: 4),
                ],
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Tonnage · this week',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: AppColors.inkDim),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  Text(
                    '${_formatGoalValue(analytics.weeklyVolumeKg)} kg',
                    style: AppTheme.monoStyle(
                      fontSize: 11,
                      color: AppColors.forest,
                    ),
                  ),
                  Text(
                    ' (${analytics.completedScheduledWorkoutCount} done)',
                    style: AppTheme.monoStyle(
                      fontSize: 11,
                      color: AppColors.inkDim,
                    ),
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

class _PaceTrendCard extends StatelessWidget {
  const _PaceTrendCard({required this.runs});

  final List<CardioLog> runs;

  @override
  Widget build(BuildContext context) {
    final latest = runs.isEmpty ? null : runs.last;
    final first = runs.isEmpty ? null : runs.first;
    final delta = latest == null || first == null
        ? 0.0
        : latest.paceSecondsPerKm - first.paceSecondsPerKm;

    return QfCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _AnalyticsMetric(
                  label: 'Latest Pace',
                  value: latest == null
                      ? '--'
                      : '${_formatPace(latest.paceSecondsPerKm)}/km',
                  detail: latest == null
                      ? 'no runs'
                      : '${_formatGoalValue(latest.distanceMeters / 1000)} km',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _AnalyticsMetric(
                  label: 'Trend',
                  value: delta == 0
                      ? '--'
                      : '${delta < 0 ? '' : '+'}${delta.round()}s',
                  detail: delta < 0 ? 'faster/km' : 'change/km',
                ),
              ),
            ],
          ),
          if (runs.length >= 2) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 58,
              child: CustomPaint(
                painter: _SparklinePainter(
                  values: runs.map((run) => run.paceSecondsPerKm).toList(),
                  lineColor: AppColors.sky,
                  fillColor: AppColors.sky.withValues(alpha: 0.14),
                ),
                size: const Size(double.infinity, 58),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AnalyticsMetric extends StatelessWidget {
  const _AnalyticsMetric({
    required this.label,
    required this.value,
    required this.detail,
  });

  final String label;
  final String value;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineSoft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, color: AppColors.inkDim),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.monoStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.ink,
            ),
          ),
          Text(
            detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, color: AppColors.inkDim),
          ),
        ],
      ),
    );
  }
}

class _VolumeBar extends StatelessWidget {
  const _VolumeBar({required this.fraction, required this.isCurrent});

  final double fraction;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: FractionallySizedBox(
            heightFactor: fraction,
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: isCurrent
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.forest, AppColors.forestDeep],
                      )
                    : null,
                color: isCurrent ? null : AppColors.surface3,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                border: Border.all(
                  color: isCurrent
                      ? AppColors.forest.withValues(alpha: 0.4)
                      : AppColors.outlineSoft,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BwHistoryCard extends StatelessWidget {
  const _BwHistoryCard({required this.entries});

  final List<BodyweightLog> entries;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var i = 0; i < entries.take(8).length; i++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDate(entries[i].loggedAt),
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.inkMute,
                    ),
                  ),
                  Text(
                    '${entries[i].weightKg.toStringAsFixed(1)} kg',
                    style: AppTheme.monoStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
            ),
            if (i < entries.take(8).length - 1)
              const Divider(height: 1, color: AppColors.outlineSoft),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final local = dt.toLocal();
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[local.month - 1]} ${local.day}, ${local.year}';
  }
}

// ─── Themed progress bar ──────────────────────────────────────────────────────

enum _BarTone { forest, ember, sky, gold }

class _ThemedProgressBar extends StatelessWidget {
  const _ThemedProgressBar({required this.value, this.tone = _BarTone.forest});

  final double value;
  final _BarTone tone;

  @override
  Widget build(BuildContext context) {
    final (start, end) = switch (tone) {
      _BarTone.forest => (AppColors.forestDeep, AppColors.forest),
      _BarTone.ember => (AppColors.emberDeep, AppColors.ember),
      _BarTone.sky => (const Color(0xFF2C5282), AppColors.sky),
      _BarTone.gold => (const Color(0xFFB7791F), AppColors.gold),
    };

    return Container(
      height: 6,
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
