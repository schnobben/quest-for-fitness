import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ids/ids.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import 'exercise_list_controller.dart';

const exerciseCategories = [
  'Strength',
  'Cardio',
  'Flexibility',
  'Plyometrics',
  'Sports',
  'Other',
];

const exerciseUnits = ['kg', 'lbs', 'reps', 'seconds', 'meters'];

const exerciseEquipmentOptions = [
  'Barbell',
  'Dumbbell',
  'Kettlebell',
  'Cable',
  'Machine',
  'Bodyweight',
  'Resistance Band',
  'Other',
];

const exerciseMovementPatterns = [
  'Push',
  'Pull',
  'Hinge',
  'Squat',
  'Carry',
  'Core',
  'Other',
];

final exerciseFormProvider =
    NotifierProvider.autoDispose<ExerciseFormController, ExerciseFormState>(
      ExerciseFormController.new,
    );

class ExerciseFormController extends Notifier<ExerciseFormState> {
  @override
  ExerciseFormState build() => const ExerciseFormState();

  void loadExercise(Exercise exercise) {
    state = ExerciseFormState(
      name: exercise.name,
      category: exercise.category,
      equipment: exercise.equipment,
      primaryMuscles: exercise.primaryMuscles,
      movementPattern: exercise.movementPattern,
      defaultUnit: exercise.defaultUnit,
      isBodyweight: exercise.isBodyweight,
      isUnilateral: exercise.isUnilateral,
      notes: exercise.notes,
    );
  }

  void setName(String value) => state = state.copyWith(name: value);

  void setCategory(String value) => state = state.copyWith(category: value);

  void setEquipment(String? value) => state = state.copyWith(equipment: value);

  void setPrimaryMuscles(String value) {
    state = state.copyWith(primaryMuscles: _blankToNull(value));
  }

  void setMovementPattern(String? value) {
    state = state.copyWith(movementPattern: value);
  }

  void setDefaultUnit(String value) {
    state = state.copyWith(defaultUnit: value);
  }

  void setBodyweight(bool value) {
    state = state.copyWith(isBodyweight: value);
  }

  void setUnilateral(bool value) {
    state = state.copyWith(isUnilateral: value);
  }

  void setNotes(String value) {
    state = state.copyWith(notes: _blankToNull(value));
  }

  Future<String> createExercise() async {
    final form = state.validated();
    final id = UuidV4Generator().nextId();
    await _repositories.exercises.createCustom(
      id: id,
      name: form.name.trim(),
      category: form.category,
      equipment: form.equipment,
      primaryMuscles: form.primaryMuscles,
      movementPattern: form.movementPattern,
      defaultUnit: form.defaultUnit,
      isBodyweight: form.isBodyweight,
      isUnilateral: form.isUnilateral,
      notes: form.notes,
    );
    _invalidateLists();
    return id;
  }

  Future<void> updateExercise(String id) async {
    final form = state.validated();
    await _repositories.exercises.updateCustom(
      id: id,
      name: form.name.trim(),
      category: form.category,
      equipment: form.equipment,
      primaryMuscles: form.primaryMuscles,
      movementPattern: form.movementPattern,
      defaultUnit: form.defaultUnit,
      isBodyweight: form.isBodyweight,
      isUnilateral: form.isUnilateral,
      notes: form.notes,
    );
    _invalidateLists();
  }

  Future<void> archiveExercise(String id) async {
    await _repositories.exercises.archiveExercise(id);
    _invalidateLists();
  }

  Future<void> deleteExercise(String id) async {
    await _repositories.exercises.deleteExercise(id);
    _invalidateLists();
  }

  AppRepositories get _repositories {
    return AppRepositories(ref.read(appDatabaseProvider));
  }

  void _invalidateLists() {
    ref.invalidate(exerciseListProvider);
    ref.invalidate(customExerciseListProvider);
  }
}

class ExerciseFormState {
  const ExerciseFormState({
    this.name = '',
    this.category = 'Strength',
    this.equipment,
    this.primaryMuscles,
    this.movementPattern,
    this.defaultUnit = 'kg',
    this.isBodyweight = false,
    this.isUnilateral = false,
    this.notes,
  });

  final String name;
  final String category;
  final String? equipment;
  final String? primaryMuscles;
  final String? movementPattern;
  final String defaultUnit;
  final bool isBodyweight;
  final bool isUnilateral;
  final String? notes;

  ExerciseFormState copyWith({
    String? name,
    String? category,
    Object? equipment = _unset,
    Object? primaryMuscles = _unset,
    Object? movementPattern = _unset,
    String? defaultUnit,
    bool? isBodyweight,
    bool? isUnilateral,
    Object? notes = _unset,
  }) {
    return ExerciseFormState(
      name: name ?? this.name,
      category: category ?? this.category,
      equipment: equipment == _unset ? this.equipment : equipment as String?,
      primaryMuscles: primaryMuscles == _unset
          ? this.primaryMuscles
          : primaryMuscles as String?,
      movementPattern: movementPattern == _unset
          ? this.movementPattern
          : movementPattern as String?,
      defaultUnit: defaultUnit ?? this.defaultUnit,
      isBodyweight: isBodyweight ?? this.isBodyweight,
      isUnilateral: isUnilateral ?? this.isUnilateral,
      notes: notes == _unset ? this.notes : notes as String?,
    );
  }

  ExerciseFormState validated() {
    if (name.trim().isEmpty) {
      throw StateError('Exercise name is required.');
    }
    if (category.trim().isEmpty) {
      throw StateError('Category is required.');
    }
    return copyWith(
      name: name.trim(),
      equipment: _blankToNull(equipment),
      primaryMuscles: _blankToNull(primaryMuscles),
      movementPattern: _blankToNull(movementPattern),
      notes: _blankToNull(notes),
    );
  }
}

const Object _unset = Object();

String? _blankToNull(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  return trimmed;
}
