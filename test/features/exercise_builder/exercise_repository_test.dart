import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:quest_for_fitness/data/local_database/local_database.dart';
import 'package:quest_for_fitness/data/repositories/repositories.dart';

void main() {
  group('ExerciseRepository custom builder', () {
    test('createCustom creates with isCustom=true', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = ExerciseRepository(database);

      await repository.createCustom(
        id: 'custom-sled-push',
        name: 'Sled Push',
        category: 'Strength',
        equipment: 'Other',
        primaryMuscles: 'Quads, glutes',
        movementPattern: 'Push',
        defaultUnit: 'meters',
        isBodyweight: false,
        isUnilateral: false,
        notes: 'Drive hard.',
      );

      final exercise = await repository.getById('custom-sled-push');

      expect(exercise, isNotNull);
      expect(exercise!.isCustom, isTrue);
      expect(exercise.isArchived, isFalse);
      expect(exercise.defaultUnit, 'meters');
    });

    test('updateCustom updates fields', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = ExerciseRepository(database);
      await _insertCustom(repository, id: 'custom-row', name: 'Row');

      await repository.updateCustom(
        id: 'custom-row',
        name: 'Chest Supported Row',
        category: 'Strength',
        equipment: 'Dumbbell',
        primaryMuscles: 'Back',
        movementPattern: 'Pull',
        defaultUnit: 'lbs',
        isBodyweight: false,
        isUnilateral: true,
        notes: 'Pause at top.',
      );

      final exercise = await repository.getById('custom-row');

      expect(exercise!.name, 'Chest Supported Row');
      expect(exercise.equipment, 'Dumbbell');
      expect(exercise.isUnilateral, isTrue);
      expect(exercise.notes, 'Pause at top.');
    });

    test('archiveExercise sets isArchived=true', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = ExerciseRepository(database);
      await _insertCustom(repository, id: 'custom-carry', name: 'Carry');

      await repository.archiveExercise('custom-carry');

      final exercise = await repository.getById('custom-carry');
      expect(exercise!.isArchived, isTrue);
      expect(await repository.listAll(), isEmpty);
    });

    test('deleteExercise fails when logs exist', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = ExerciseRepository(database);
      await _insertCustom(repository, id: 'custom-squat', name: 'Squat');
      await _insertExerciseLog(database, exerciseId: 'custom-squat');

      await expectLater(
        () => repository.deleteExercise('custom-squat'),
        throwsA(isA<StateError>()),
      );
      expect(await repository.getById('custom-squat'), isNotNull);
    });

    test('deleteExercise succeeds when no logs exist', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      final repository = ExerciseRepository(database);
      await _insertCustom(repository, id: 'custom-curl', name: 'Curl');

      await repository.deleteExercise('custom-curl');

      expect(await repository.getById('custom-curl'), isNull);
    });
  });
}

Future<void> _insertCustom(
  ExerciseRepository repository, {
  required String id,
  required String name,
}) {
  return repository.createCustom(
    id: id,
    name: name,
    category: 'Strength',
    defaultUnit: 'kg',
    isBodyweight: false,
    isUnilateral: false,
  );
}

Future<void> _insertExerciseLog(
  AppDatabase database, {
  required String exerciseId,
}) async {
  final now = DateTime.utc(2026, 5, 10, 8);
  await database.into(database.sessionLogs).insert(
    SessionLogsCompanion.insert(
      id: 'session-for-$exerciseId',
      startedAt: now,
      completedAt: Value(now.add(const Duration(minutes: 20))),
      durationSeconds: const Value(1200),
      createdAt: now,
      updatedAt: now,
    ),
  );
  await database.into(database.exerciseLogs).insert(
    ExerciseLogsCompanion.insert(
      id: 'exercise-log-for-$exerciseId',
      sessionLogId: 'session-for-$exerciseId',
      exerciseId: exerciseId,
      sortOrder: 0,
    ),
  );
}
