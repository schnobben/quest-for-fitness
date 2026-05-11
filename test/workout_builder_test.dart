import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quest_for_fitness/data/data_providers.dart';
import 'package:quest_for_fitness/data/local_database/local_database.dart';
import 'package:quest_for_fitness/data/repositories/repositories.dart';
import 'package:quest_for_fitness/features/workout_builder/application/workout_form_controller.dart';

void main() {
  group('WorkoutRepository custom builder', () {
    test('duplicateTemplate deep copies template exercises', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = WorkoutRepository(database);
      await _insertExercise(database, id: 'bench', name: 'Bench Press');
      await _insertExercise(database, id: 'row', name: 'Row');
      await _insertTemplate(database, id: 'upper', name: 'Upper');
      await _insertTemplateExercise(
        database,
        id: 'upper-bench',
        workoutTemplateId: 'upper',
        exerciseId: 'bench',
        sortOrder: 0,
      );
      await _insertTemplateExercise(
        database,
        id: 'upper-row',
        workoutTemplateId: 'upper',
        exerciseId: 'row',
        sortOrder: 1,
      );

      final duplicateId = await repository.duplicateTemplate('upper');
      final duplicate = await repository.getTemplate(duplicateId);
      final targets = await repository.getExerciseTargets(duplicateId);

      expect(duplicateId, isNot('upper'));
      expect(duplicate!.name, 'Upper (Copy)');
      expect(duplicate.isSeedContent, isFalse);
      expect(targets, hasLength(2));
      expect(
        targets.map((target) => target.templateExercise.id),
        isNot(contains('upper-bench')),
      );
      expect(
        targets.map((target) => target.templateExercise.id),
        isNot(contains('upper-row')),
      );
    });

    test('reorderExercises updates sort orders', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = WorkoutRepository(database);
      await _insertExercise(database, id: 'a', name: 'A');
      await _insertExercise(database, id: 'b', name: 'B');
      await _insertExercise(database, id: 'c', name: 'C');
      await _insertTemplate(database, id: 'template', name: 'Template');
      await _insertTemplateExercise(
        database,
        id: 'target-a',
        workoutTemplateId: 'template',
        exerciseId: 'a',
        sortOrder: 0,
      );
      await _insertTemplateExercise(
        database,
        id: 'target-b',
        workoutTemplateId: 'template',
        exerciseId: 'b',
        sortOrder: 1,
      );
      await _insertTemplateExercise(
        database,
        id: 'target-c',
        workoutTemplateId: 'template',
        exerciseId: 'c',
        sortOrder: 2,
      );

      await repository.reorderExercises('template', [
        'target-c',
        'target-b',
        'target-a',
      ]);

      final targets = await repository.getExerciseTargets('template');
      expect(targets.map((target) => target.templateExercise.id), [
        'target-c',
        'target-b',
        'target-a',
      ]);
      expect(targets.map((target) => target.templateExercise.sortOrder), [
        0,
        1,
        2,
      ]);
    });

    test('hasSessionLogs reflects matching session logs', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = WorkoutRepository(database);
      await _insertTemplate(database, id: 'logged', name: 'Logged');

      expect(await repository.hasSessionLogs('logged'), isFalse);

      final now = DateTime.utc(2026, 5, 10, 8);
      await database.into(database.sessionLogs).insert(
        SessionLogsCompanion.insert(
          id: 'session',
          workoutTemplateId: const Value('logged'),
          startedAt: now,
          createdAt: now,
          updatedAt: now,
        ),
      );

      expect(await repository.hasSessionLogs('logged'), isTrue);
    });
  });

  group('WorkoutFormController', () {
    test('addExercise adds default target', () {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final container = _container(database);
      addTearDown(container.dispose);

      expect(container.read(workoutFormProvider).exercises, isEmpty);

      container
          .read(workoutFormProvider.notifier)
          .addExercise(_exercise(id: 'press', name: 'Press'));

      final exercises = container.read(workoutFormProvider).exercises;
      expect(exercises, hasLength(1));
      expect(exercises.single.templateExercise.targetSets, 3);
      expect(exercises.single.templateExercise.targetReps, '8-12');
    });

    test('reorder moves first exercise to last', () {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final container = _container(database);
      addTearDown(container.dispose);
      final notifier = container.read(workoutFormProvider.notifier);
      notifier.addExercise(_exercise(id: 'a', name: 'A'));
      notifier.addExercise(_exercise(id: 'b', name: 'B'));

      notifier.reorder(0, 2);

      final exercises = container.read(workoutFormProvider).exercises;
      expect(exercises.map((target) => target.exercise.id), ['b', 'a']);
    });

    test('removeExercise removes target at index', () {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final container = _container(database);
      addTearDown(container.dispose);
      final notifier = container.read(workoutFormProvider.notifier);
      notifier.addExercise(_exercise(id: 'a', name: 'A'));
      notifier.addExercise(_exercise(id: 'b', name: 'B'));

      notifier.removeExercise(0);

      final exercises = container.read(workoutFormProvider).exercises;
      expect(exercises, hasLength(1));
      expect(exercises.single.exercise.id, 'b');
    });
  });
}

ProviderContainer _container(AppDatabase database) {
  return ProviderContainer(
    overrides: [appDatabaseProvider.overrideWithValue(database)],
  );
}

Exercise _exercise({required String id, required String name}) {
  final now = DateTime.utc(2026, 5, 10);
  return Exercise(
    id: id,
    name: name,
    category: 'Strength',
    defaultUnit: 'kg',
    isBodyweight: false,
    isUnilateral: false,
    isCustom: true,
    isArchived: false,
    createdAt: now,
    updatedAt: now,
  );
}

Future<void> _insertExercise(
  AppDatabase database, {
  required String id,
  required String name,
}) {
  final now = DateTime.utc(2026, 5, 10);
  return database.into(database.exercises).insert(
    ExercisesCompanion.insert(
      id: id,
      name: name,
      category: 'Strength',
      defaultUnit: const Value('kg'),
      createdAt: now,
      updatedAt: now,
    ),
  );
}

Future<void> _insertTemplate(
  AppDatabase database, {
  required String id,
  required String name,
}) {
  final now = DateTime.utc(2026, 5, 10);
  return database.into(database.workoutTemplates).insert(
    WorkoutTemplatesCompanion.insert(
      id: id,
      name: name,
      createdAt: now,
      updatedAt: now,
    ),
  );
}

Future<void> _insertTemplateExercise(
  AppDatabase database, {
  required String id,
  required String workoutTemplateId,
  required String exerciseId,
  required int sortOrder,
}) {
  return database.into(database.workoutTemplateExercises).insert(
    WorkoutTemplateExercisesCompanion.insert(
      id: id,
      workoutTemplateId: workoutTemplateId,
      exerciseId: exerciseId,
      sortOrder: sortOrder,
      targetSets: const Value(3),
      targetReps: const Value('8-12'),
    ),
  );
}
