import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/data_providers.dart';
import '../../../data/repositories/repositories.dart';
import '../../quest/application/achievement_controller.dart';
import '../../quest/application/adventurer_profile_controller.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../application/workout_execution_controller.dart';

class WorkoutExecutionScreen extends ConsumerStatefulWidget {
  const WorkoutExecutionScreen({required this.scheduledWorkoutId, super.key});

  static const routeName = 'workoutExecution';
  static const routePath = 'workout/:scheduledWorkoutId';

  final String scheduledWorkoutId;

  @override
  ConsumerState<WorkoutExecutionScreen> createState() =>
      _WorkoutExecutionScreenState();
}

class _WorkoutExecutionScreenState
    extends ConsumerState<WorkoutExecutionScreen> {
  final _sessionNotesController = TextEditingController();
  final _startedAt = DateTime.now();
  List<_ExerciseLogState>? _exerciseStates;
  bool _isSaving = false;
  final int _currentExerciseIndex = 0;

  @override
  void dispose() {
    _sessionNotesController.dispose();
    for (final exercise in _exerciseStates ?? <_ExerciseLogState>[]) {
      exercise.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final planAsync = ref.watch(
      workoutExecutionProvider(widget.scheduledWorkoutId),
    );

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: planAsync.when(
        data: (plan) {
          _exerciseStates ??= [
            for (final target in plan.targets)
              _ExerciseLogState.fromTarget(target),
          ];

          return SafeArea(
            child: Column(
              children: [
                // Session header bar
                _SessionBar(
                  workoutName: plan.workoutTemplate.name,
                  startedAt: _startedAt,
                  onBack: () => context.go('/today'),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 100),
                    children: [
                      // Current exercise focus card
                      if (_exerciseStates!.isNotEmpty)
                        _ExerciseFocusCard(
                          exerciseState:
                              _exerciseStates![_currentExerciseIndex.clamp(
                                0,
                                _exerciseStates!.length - 1,
                              )],
                          current: _currentExerciseIndex + 1,
                          total: _exerciseStates!.length,
                        ),
                      const SizedBox(height: 14),
                      // All exercises
                      for (final exerciseState in _exerciseStates!) ...[
                        _ExerciseLogCard(
                          exerciseState: exerciseState,
                          onChanged: () => setState(() {}),
                        ),
                        const SizedBox(height: 14),
                      ],
                      // Session notes
                      TextField(
                        controller: _sessionNotesController,
                        minLines: 2,
                        maxLines: 4,
                        style: const TextStyle(color: AppColors.ink),
                        decoration: const InputDecoration(
                          labelText: 'Session notes',
                          hintText: 'Optional notes',
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text(
              'Workout could not be loaded: $error',
              style: const TextStyle(color: AppColors.inkMute),
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.forest),
        ),
      ),
      bottomNavigationBar: planAsync.maybeWhen(
        data: (plan) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
            child: GestureDetector(
              key: const Key('complete-session-button'),
              onTap: _isSaving ? null : () => _completeSession(plan),
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  gradient: _isSaving
                      ? null
                      : const LinearGradient(
                          colors: [Color(0xFF7CDFA0), Color(0xFF4FB87B)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                  color: _isSaving ? AppColors.surface3 : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isSaving)
                      const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.forest,
                        ),
                      )
                    else ...[
                      const Icon(
                        Icons.check,
                        color: AppColors.bgDeep,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Complete Session',
                        style: AppTheme.fantasyStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.bgDeep,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        orElse: () => null,
      ),
    );
  }

  Future<void> _completeSession(WorkoutExecutionPlan plan) async {
    setState(() => _isSaving = true);
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final router = GoRouter.of(context);

    final result = await repositories.sessions.completePlannedWorkout(
      scheduledWorkout: plan.scheduledWorkout,
      workoutTemplate: plan.workoutTemplate,
      exercises: [
        for (final exercise in _exerciseStates!)
          CompletedExerciseInput(
            exerciseId: exercise.exerciseId,
            sortOrder: exercise.sortOrder,
            notes: exercise.notesController.text.trim().isEmpty
                ? null
                : exercise.notesController.text.trim(),
            sets: [
              for (final set in exercise.sets)
                CompletedSetInput(
                  setNumber: set.setNumber,
                  isComplete: set.isComplete,
                  reps: int.tryParse(set.repsController.text.trim()),
                  weight: double.tryParse(set.weightController.text.trim()),
                  rpe: double.tryParse(set.rpeController.text.trim()),
                  notes: set.notesController.text.trim().isEmpty
                      ? null
                      : set.notesController.text.trim(),
                ),
            ],
          ),
      ],
      startedAt: _startedAt,
      completedAt: DateTime.now(),
      notes: _sessionNotesController.text.trim().isEmpty
          ? null
          : _sessionNotesController.text.trim(),
    );
    ref.invalidate(adventurerProfileProvider);
    ref.invalidate(achievementGalleryProvider);

    if (!mounted) return;
    final levelText = result.workoutReward.leveledUp
        ? ' Level ${result.workoutReward.levelAfter} reached.'
        : '';
    final prText = result.prCount > 0 ? ' ${result.prCount} PR reward(s).' : '';
    final achievementText = result.workoutReward.unlockedAchievements.isNotEmpty
        ? ' ${result.workoutReward.unlockedAchievements.length} achievement unlocked.'
        : '';
    QfNotification.show(
      context,
      'Session saved. +${result.workoutReward.xpAmount} XP.$levelText$prText$achievementText',
    );
    router.go('/today');
  }
}

// ─── Session bar ──────────────────────────────────────────────────────────────

class _SessionBar extends StatefulWidget {
  const _SessionBar({
    required this.workoutName,
    required this.startedAt,
    required this.onBack,
  });

  final String workoutName;
  final DateTime startedAt;
  final VoidCallback onBack;

  @override
  State<_SessionBar> createState() => _SessionBarState();
}

class _SessionBarState extends State<_SessionBar> {
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onBack,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.surface2,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.outline),
              ),
              child: const Icon(
                Icons.chevron_left,
                color: AppColors.inkMute,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'IN SESSION',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.inkDim,
                    letterSpacing: 0.06 * 11,
                  ),
                ),
                Text(
                  widget.workoutName,
                  style: AppTheme.fantasyStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                ),
              ],
            ),
          ),
          QfPill(
            tone: QfPillTone.ember,
            icon: const Icon(Icons.timer_outlined, size: 11),
            child: Text(_elapsedLabel, style: AppTheme.monoStyle(fontSize: 11)),
          ),
        ],
      ),
    );
  }

  String get _elapsedLabel {
    final elapsed = DateTime.now().difference(widget.startedAt);
    final m = elapsed.inMinutes.toString().padLeft(2, '0');
    final s = (elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}

// ─── Exercise focus card ──────────────────────────────────────────────────────

class _ExerciseFocusCard extends StatelessWidget {
  const _ExerciseFocusCard({
    required this.exerciseState,
    required this.current,
    required this.total,
  });

  final _ExerciseLogState exerciseState;
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return QfCard(
      variant: QfCardVariant.embossed,
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXERCISE $current OF $total',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.rune,
                    letterSpacing: 0.16 * 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  exerciseState.exerciseName,
                  style: AppTheme.fantasyStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.15,
                    color: AppColors.ink,
                  ),
                ),
                Text(
                  exerciseState.targetSummary,
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
    );
  }
}

// ─── Exercise log card ────────────────────────────────────────────────────────

class _ExerciseLogCard extends StatefulWidget {
  const _ExerciseLogCard({
    required this.exerciseState,
    required this.onChanged,
  });

  final _ExerciseLogState exerciseState;
  final VoidCallback onChanged;

  @override
  State<_ExerciseLogCard> createState() => _ExerciseLogCardState();
}

class _ExerciseLogCardState extends State<_ExerciseLogCard> {
  @override
  Widget build(BuildContext context) {
    final exerciseState = widget.exerciseState;

    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exerciseState.exerciseName,
            style: AppTheme.fantasyStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            exerciseState.targetSummary,
            style: const TextStyle(fontSize: 12, color: AppColors.inkMute),
          ),
          const SizedBox(height: 12),
          // Column headers
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: const [
                SizedBox(
                  width: 32,
                  child: Text(
                    'SET',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.inkDim,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'WEIGHT',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.inkDim,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'REPS',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.inkDim,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'RPE',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.inkDim,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                SizedBox(width: 36),
              ],
            ),
          ),
          for (final set in exerciseState.sets) ...[
            _SetRow(setState: set, onChanged: () => setState(widget.onChanged)),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 8),
          TextField(
            controller: exerciseState.notesController,
            style: const TextStyle(fontSize: 13, color: AppColors.ink),
            decoration: const InputDecoration(
              labelText: 'Exercise note',
              hintText: 'Optional',
            ),
          ),
        ],
      ),
    );
  }
}

class _SetRow extends StatelessWidget {
  const _SetRow({required this.setState, required this.onChanged});

  final _SetLogState setState;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Set number indicator
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: setState.isComplete
                ? const Color(0x2668D391)
                : AppColors.surface3,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: setState.isComplete
                  ? const Color(0x4D68D391)
                  : AppColors.outlineSoft,
            ),
          ),
          child: Center(
            child: setState.isComplete
                ? const Icon(Icons.check, size: 14, color: AppColors.forest)
                : Text(
                    '${setState.setNumber}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: setState.isComplete
                          ? AppColors.forest
                          : AppColors.inkMute,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: setState.weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: AppTheme.monoStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
            decoration: const InputDecoration(
              hintText: '—',
              suffixText: 'kg',
              suffixStyle: TextStyle(fontSize: 10, color: AppColors.inkDim),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: setState.repsController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: AppTheme.monoStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
            decoration: const InputDecoration(
              hintText: '—',
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: setState.rpeController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: AppTheme.monoStyle(fontSize: 15, color: AppColors.inkMute),
            decoration: const InputDecoration(
              hintText: '—',
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 36,
          child: Checkbox(
            value: setState.isComplete,
            onChanged: (value) {
              setState.isComplete = value ?? false;
              onChanged();
            },
          ),
        ),
      ],
    );
  }
}

// ─── State classes ────────────────────────────────────────────────────────────

class _ExerciseLogState {
  _ExerciseLogState({
    required this.exerciseId,
    required this.exerciseName,
    required this.sortOrder,
    required this.targetSummary,
    required this.notesController,
    required this.sets,
  });

  factory _ExerciseLogState.fromTarget(WorkoutExerciseTarget target) {
    final template = target.templateExercise;
    final targetSets = template.targetSets ?? 1;
    final repsText = _defaultReps(template.targetReps);
    final weightText = template.targetWeight?.toStringAsFixed(0) ?? '';
    final rpeText = template.targetRpe == null
        ? ''
        : template.targetRpe!.toStringAsFixed(1).replaceAll('.0', '');

    return _ExerciseLogState(
      exerciseId: target.exercise.id,
      exerciseName: target.exercise.name,
      sortOrder: template.sortOrder,
      targetSummary:
          '$targetSets × ${template.targetReps ?? '-'}'
          '${template.targetWeight == null ? '' : ' @ ${template.targetWeight!.toStringAsFixed(0)} kg'}'
          '${template.targetRpe == null ? '' : ' RPE $rpeText'}',
      notesController: TextEditingController(text: template.notes ?? ''),
      sets: [
        for (var index = 1; index <= targetSets; index++)
          _SetLogState(
            setNumber: index,
            repsController: TextEditingController(text: repsText),
            weightController: TextEditingController(text: weightText),
            rpeController: TextEditingController(text: rpeText),
            notesController: TextEditingController(),
          ),
      ],
    );
  }

  final String exerciseId;
  final String exerciseName;
  final int sortOrder;
  final String targetSummary;
  final TextEditingController notesController;
  final List<_SetLogState> sets;

  void dispose() {
    notesController.dispose();
    for (final set in sets) {
      set.dispose();
    }
  }
}

class _SetLogState {
  _SetLogState({
    required this.setNumber,
    required this.repsController,
    required this.weightController,
    required this.rpeController,
    required this.notesController,
  }) : isComplete = true;

  final int setNumber;
  final TextEditingController repsController;
  final TextEditingController weightController;
  final TextEditingController rpeController;
  final TextEditingController notesController;
  bool isComplete;

  void dispose() {
    repsController.dispose();
    weightController.dispose();
    rpeController.dispose();
    notesController.dispose();
  }
}

String _defaultReps(String? targetReps) {
  if (targetReps == null || targetReps.isEmpty) return '';
  final match = RegExp(r'\d+').firstMatch(targetReps);
  return match?.group(0) ?? '';
}
