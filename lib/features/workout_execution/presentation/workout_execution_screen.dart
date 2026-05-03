import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../data/data_providers.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/base/app_card.dart';
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
      appBar: AppBar(title: const Text('Workout')),
      bottomNavigationBar: planAsync.maybeWhen(
        data: (plan) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.sm,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            child: FilledButton.icon(
              onPressed: _isSaving ? null : () => _completeSession(plan),
              icon: _isSaving
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
              label: const Text('Complete Session'),
            ),
          ),
        ),
        orElse: () => null,
      ),
      body: planAsync.when(
        data: (plan) {
          _exerciseStates ??= [
            for (final target in plan.targets)
              _ExerciseLogState.fromTarget(target),
          ];

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(
                plan.workoutTemplate.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                plan.workoutTemplate.description ?? 'Planned workout',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              for (final exerciseState in _exerciseStates!) ...[
                _ExerciseLogCard(exerciseState: exerciseState),
                const SizedBox(height: AppSpacing.lg),
              ],
              TextField(
                controller: _sessionNotesController,
                minLines: 2,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Session notes',
                  hintText: 'Optional notes',
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const SizedBox(height: AppSpacing.xl),
            ],
          );
        },
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text('Workout could not be loaded: $error'),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Future<void> _completeSession(WorkoutExecutionPlan plan) async {
    setState(() => _isSaving = true);
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);

    await repositories.sessions.completePlannedWorkout(
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

    if (!mounted) {
      return;
    }
    messenger.showSnackBar(const SnackBar(content: Text('Session saved')));
    router.go('/today');
  }
}

class _ExerciseLogCard extends StatefulWidget {
  const _ExerciseLogCard({required this.exerciseState});

  final _ExerciseLogState exerciseState;

  @override
  State<_ExerciseLogCard> createState() => _ExerciseLogCardState();
}

class _ExerciseLogCardState extends State<_ExerciseLogCard> {
  @override
  Widget build(BuildContext context) {
    final exerciseState = widget.exerciseState;
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(exerciseState.exerciseName, style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.xs),
          Text(
            exerciseState.targetSummary,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          for (final set in exerciseState.sets) ...[
            _SetLogRow(setState: set, onChanged: () => setState(() {})),
            const SizedBox(height: AppSpacing.sm),
          ],
          TextField(
            controller: exerciseState.notesController,
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

class _SetLogRow extends StatelessWidget {
  const _SetLogRow({required this.setState, required this.onChanged});

  final _SetLogState setState;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 52, child: Text('Set ${setState.setNumber}')),
            Expanded(
              child: TextField(
                controller: setState.repsController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Reps'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: TextField(
                controller: setState.weightController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(labelText: 'Kg'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: TextField(
                controller: setState.rpeController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(labelText: 'RPE'),
              ),
            ),
            Checkbox(
              value: setState.isComplete,
              onChanged: (value) {
                setState.isComplete = value ?? false;
                onChanged();
              },
            ),
          ],
        ),
        TextField(
          controller: setState.notesController,
          decoration: const InputDecoration(
            labelText: 'Set note',
            hintText: 'Optional',
          ),
        ),
      ],
    );
  }
}

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
          '$targetSets x ${template.targetReps ?? '-'}'
          '${template.targetWeight == null ? '' : ' @ ${template.targetWeight!.toStringAsFixed(0)} kg'}'
          '${template.targetRpe == null ? '' : ' RPE ${template.targetRpe!.toStringAsFixed(1).replaceAll('.0', '')}'}',
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
  if (targetReps == null || targetReps.isEmpty) {
    return '';
  }
  final match = RegExp(r'\d+').firstMatch(targetReps);
  return match?.group(0) ?? '';
}
