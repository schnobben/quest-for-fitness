import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ids/ids.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import 'workout_list_controller.dart';

final workoutFormProvider =
    StateNotifierProvider.autoDispose<WorkoutFormNotifier, WorkoutFormState>(
      WorkoutFormNotifier.new,
    );

class WorkoutFormNotifier extends StateNotifier<WorkoutFormState> {
  WorkoutFormNotifier(this.ref) : super(const WorkoutFormState());

  final Ref ref;

  void setName(String value) => state = state.copyWith(name: value);

  void setDescription(String value) {
    state = state.copyWith(description: value);
  }

  void loadTemplate(
    WorkoutTemplate template,
    List<WorkoutExerciseTarget> exercises,
  ) {
    state = WorkoutFormState(
      name: template.name,
      description: template.description ?? '',
      exercises: exercises,
    );
  }

  void addExercise(Exercise exercise) {
    final templateExercise = WorkoutTemplateExercise(
      id: UuidV4Generator().nextId(),
      workoutTemplateId: '',
      exerciseId: exercise.id,
      sortOrder: state.exercises.length,
      targetSets: 3,
      targetReps: '8-12',
    );
    state = state.copyWith(
      exercises: [
        ...state.exercises,
        WorkoutExerciseTarget(
          templateExercise: templateExercise,
          exercise: exercise,
        ),
      ],
    );
  }

  void removeExercise(int index) {
    final updated = [...state.exercises]..removeAt(index);
    state = state.copyWith(exercises: _withSortOrders(updated));
  }

  void reorder(int oldIndex, int newIndex) {
    final updated = [...state.exercises];
    if (newIndex > oldIndex) newIndex--;
    final item = updated.removeAt(oldIndex);
    updated.insert(newIndex, item);
    state = state.copyWith(exercises: _withSortOrders(updated));
  }

  void updateTarget(
    int index, {
    Object? sets = _unset,
    Object? reps = _unset,
    Object? weight = _unset,
    Object? rpe = _unset,
    Object? rest = _unset,
    Object? notes = _unset,
  }) {
    final updated = [...state.exercises];
    final current = updated[index];
    updated[index] = WorkoutExerciseTarget(
      templateExercise: current.templateExercise.copyWith(
        targetSets: sets == _unset
            ? const Value.absent()
            : Value(sets as int?),
        targetReps: reps == _unset
            ? const Value.absent()
            : Value(_blankToNull(reps as String?)),
        targetWeight: weight == _unset
            ? const Value.absent()
            : Value(weight as double?),
        targetRpe: rpe == _unset ? const Value.absent() : Value(rpe as double?),
        restGuidance: rest == _unset
            ? const Value.absent()
            : Value(_blankToNull(rest as String?)),
        notes: notes == _unset
            ? const Value.absent()
            : Value(_blankToNull(notes as String?)),
      ),
      exercise: current.exercise,
    );
    state = state.copyWith(exercises: updated);
  }

  Future<String> createWorkout() async {
    final form = state.validated();
    final id = UuidV4Generator().nextId();
    final now = DateTime.now();
    state = state.copyWith(isSaving: true);
    try {
      await _repositories.workouts.upsertTemplate(
        WorkoutTemplatesCompanion.insert(
          id: id,
          name: form.name.trim(),
          description: Value(_blankToNull(form.description)),
          isSeedContent: const Value(false),
          isArchived: const Value(false),
          createdAt: now,
          updatedAt: now,
        ),
      );
      await _saveExerciseTargets(id, form.exercises);
      ref.invalidate(workoutListProvider);
      return id;
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<void> updateWorkout(String id) async {
    final form = state.validated();
    final existing = await _repositories.workouts.getTemplate(id);
    if (existing == null) {
      throw StateError('Workout template not found.');
    }

    state = state.copyWith(isSaving: true);
    try {
      await _repositories.workouts.upsertTemplate(
        WorkoutTemplatesCompanion.insert(
          id: id,
          name: form.name.trim(),
          description: Value(_blankToNull(form.description)),
          sourceCampaignId: Value(existing.sourceCampaignId),
          isSeedContent: Value(existing.isSeedContent),
          isArchived: Value(existing.isArchived),
          createdAt: existing.createdAt,
          updatedAt: DateTime.now(),
        ),
      );

      await _saveExerciseTargets(id, form.exercises);
      final currentIds = form.exercises
          .map((target) => target.templateExercise.id)
          .toSet();
      final saved = await _repositories.workouts.getExerciseTargets(id);
      for (final target in saved) {
        if (!currentIds.contains(target.templateExercise.id)) {
          await _repositories.workouts.deleteExerciseTarget(
            target.templateExercise.id,
          );
        }
      }
      ref.invalidate(workoutListProvider);
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  Future<void> _saveExerciseTargets(
    String workoutTemplateId,
    List<WorkoutExerciseTarget> exercises,
  ) async {
    for (var index = 0; index < exercises.length; index++) {
      final target = exercises[index].templateExercise;
      await _repositories.workouts.upsertExerciseTarget(
        WorkoutTemplateExercisesCompanion.insert(
          id: target.id,
          workoutTemplateId: workoutTemplateId,
          exerciseId: target.exerciseId,
          sortOrder: index,
          targetSets: Value(target.targetSets),
          targetReps: Value(target.targetReps),
          targetWeight: Value(target.targetWeight),
          targetRpe: Value(target.targetRpe),
          restGuidance: Value(target.restGuidance),
          notes: Value(target.notes),
        ),
      );
    }
  }

  List<WorkoutExerciseTarget> _withSortOrders(
    List<WorkoutExerciseTarget> exercises,
  ) {
    return [
      for (var index = 0; index < exercises.length; index++)
        WorkoutExerciseTarget(
          templateExercise: exercises[index].templateExercise.copyWith(
            sortOrder: index,
          ),
          exercise: exercises[index].exercise,
        ),
    ];
  }

  AppRepositories get _repositories {
    return AppRepositories(ref.read(appDatabaseProvider));
  }
}

class WorkoutFormState {
  const WorkoutFormState({
    this.name = '',
    this.description = '',
    this.exercises = const [],
    this.isSaving = false,
  });

  final String name;
  final String description;
  final List<WorkoutExerciseTarget> exercises;
  final bool isSaving;

  WorkoutFormState copyWith({
    String? name,
    String? description,
    List<WorkoutExerciseTarget>? exercises,
    bool? isSaving,
  }) {
    return WorkoutFormState(
      name: name ?? this.name,
      description: description ?? this.description,
      exercises: exercises ?? this.exercises,
      isSaving: isSaving ?? this.isSaving,
    );
  }

  WorkoutFormState validated() {
    if (name.trim().isEmpty) {
      throw StateError('Workout name is required.');
    }
    return copyWith(name: name.trim(), description: description.trim());
  }
}

const Object _unset = Object();

String? _blankToNull(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  return trimmed;
}
