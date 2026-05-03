import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}

class _ProgressBody extends StatelessWidget {
  const _ProgressBody({
    required this.data,
    required this.weightController,
    required this.isSaving,
    required this.onSaveWeight,
  });

  final ProgressDashboardData data;
  final TextEditingController weightController;
  final bool isSaving;
  final VoidCallback onSaveWeight;

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

        // Goal campaign
        if (data.bodyweightGoal != null) ...[
          const QfSectionHeader(title: 'Goal Campaign · The Quest'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: _GoalCampaignCard(goal: data.bodyweightGoal!),
          ),
        ],

        // Weekly volume bars (static placeholder)
        const QfSectionHeader(title: 'Weekly Volume'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _WeeklyVolumeCard(),
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

class _WeeklyVolumeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bars = [42, 38, 51, 47, 55, 49, 58, 62];

    return QfCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i = 0; i < bars.length; i++) ...[
                  Expanded(
                    child: _VolumeBar(
                      fraction: bars[i] / 100.0,
                      isCurrent: i == bars.length - 1,
                    ),
                  ),
                  if (i < bars.length - 1) const SizedBox(width: 4),
                ],
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tonnage · this week',
                style: TextStyle(fontSize: 11, color: AppColors.inkDim),
              ),
              Row(
                children: [
                  Text(
                    '21,840 kg',
                    style: AppTheme.monoStyle(
                      fontSize: 11,
                      color: AppColors.forest,
                    ),
                  ),
                  Text(
                    ' (+8%)',
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
