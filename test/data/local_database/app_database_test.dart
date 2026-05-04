import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;
import 'package:quest_for_fitness/data/local_database/local_database.dart';
import 'package:quest_for_fitness/data/migrations/migrations.dart';
import 'package:quest_for_fitness/data/repositories/repositories.dart';
import 'package:quest_for_fitness/data/seed_data/seed_data.dart';

void main() {
  test('schema creates Sprint 1.1 tables', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);

    final tables = await database
        .customSelect(
          "select name from sqlite_master where type = 'table' order by name",
        )
        .get();

    final tableNames = tables
        .map((row) => row.read<String>('name'))
        .where((name) => !name.startsWith('sqlite_'))
        .toSet();

    expect(
      tableNames,
      containsAll({
        'bodyweight_logs',
        'campaign_phases',
        'campaigns',
        'exercise_logs',
        'exercises',
        'goals',
        'program_templates',
        'scheduled_workouts',
        'seed_runs',
        'session_logs',
        'set_logs',
        'working_weights',
        'workout_template_exercises',
        'workout_templates',
      }),
    );
  });

  test('repository data persists after database reload', () async {
    final tempDir = await Directory.systemTemp.createTemp(
      'quest_for_fitness_db_test_',
    );
    addTearDown(() => tempDir.delete(recursive: true));

    final databaseFile = File(path.join(tempDir.path, 'app.sqlite'));
    final now = DateTime.utc(2026, 5, 5, 8);

    final firstDatabase = AppDatabase.forTesting(NativeDatabase(databaseFile));
    final firstRepositories = AppRepositories(firstDatabase);

    await firstRepositories.exercises.upsert(
      ExercisesCompanion.insert(
        id: 'exercise-bench-press',
        name: 'Bench Press',
        category: 'strength',
        equipment: const Value('barbell'),
        primaryMuscles: const Value('chest,triceps'),
        movementPattern: const Value('horizontal push'),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await firstRepositories.workouts.upsertTemplate(
      WorkoutTemplatesCompanion.insert(
        id: 'workout-upper-strength',
        name: 'Day A - Upper Strength',
        description: const Value('Seed campaign upper strength day'),
        isSeedContent: const Value(true),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await firstRepositories.sessions.upsertSession(
      SessionLogsCompanion.insert(
        id: 'session-001',
        workoutTemplateId: const Value('workout-upper-strength'),
        startedAt: now,
        completedAt: Value(now.add(const Duration(minutes: 55))),
        durationSeconds: const Value(3300),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await firstRepositories.bodyweight.upsert(
      BodyweightLogsCompanion.insert(
        id: 'bodyweight-001',
        loggedAt: now,
        weightKg: 86.4,
        isSeedExample: const Value(true),
        createdAt: now,
      ),
    );
    await firstRepositories.goals.upsert(
      GoalsCompanion.insert(
        id: 'goal-bodyweight',
        name: 'Bodyweight 83 kg',
        category: 'body composition',
        currentValue: const Value(86.4),
        targetValue: 83,
        unit: 'kg',
        direction: 'lower',
        linkedMetric: const Value('bodyweight'),
        targetDate: Value(DateTime.utc(2026, 9, 30)),
        isSeedContent: const Value(true),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await firstDatabase.close();

    final secondDatabase = AppDatabase.forTesting(NativeDatabase(databaseFile));
    addTearDown(secondDatabase.close);
    final secondRepositories = AppRepositories(secondDatabase);

    expect(
      await secondRepositories.exercises.watchableSnapshot(),
      hasLength(1),
    );
    expect(await secondRepositories.workouts.getTemplates(), hasLength(1));
    expect(await secondRepositories.sessions.getRecentSessions(), hasLength(1));

    final latestBodyweight = await secondRepositories.bodyweight.getLatest();
    expect(latestBodyweight?.weightKg, 86.4);

    final goals = await secondRepositories.goals.getActiveGoals();
    expect(goals.single.name, 'Bodyweight 83 kg');
  });

  test('seed runs are idempotent and resettable', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);

    final seedService = AppSeedDataService(database);
    final devTools = DatabaseDevTools(database);

    expect(await seedService.hasSeedRun('may_september_2026'), isFalse);

    await seedService.markSeedRun(
      seedName: 'may_september_2026',
      seedVersion: 1,
      appliedAt: DateTime.utc(2026, 5, 3),
    );

    expect(await seedService.hasSeedRun('may_september_2026'), isTrue);

    await devTools.resetAllData();

    expect(await seedService.hasSeedRun('may_september_2026'), isFalse);
  });

  test(
    'completed planned workout persists session, exercises, and sets',
    () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      await AppSeedDataService(
        database,
      ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
      final repositories = AppRepositories(database);
      final scheduledWorkout =
          (await repositories.campaigns.getUpcomingScheduledWorkouts(
            from: DateTime.utc(2026, 5, 5),
          )).first;
      final workoutTemplate = (await repositories.workouts.getTemplate(
        scheduledWorkout.workoutTemplateId,
      ))!;
      final targets = await repositories.workouts.getExerciseTargets(
        workoutTemplate.id,
      );

      await repositories.sessions.completePlannedWorkout(
        scheduledWorkout: scheduledWorkout,
        workoutTemplate: workoutTemplate,
        exercises: [
          for (final target in targets)
            CompletedExerciseInput(
              exerciseId: target.exercise.id,
              sortOrder: target.templateExercise.sortOrder,
              sets: [
                for (
                  var setNumber = 1;
                  setNumber <= (target.templateExercise.targetSets ?? 1);
                  setNumber++
                )
                  CompletedSetInput(
                    setNumber: setNumber,
                    isComplete: true,
                    reps: 4,
                    weight: target.templateExercise.targetWeight,
                    rpe: target.templateExercise.targetRpe,
                  ),
              ],
            ),
        ],
        startedAt: DateTime.utc(2026, 5, 5, 6),
        completedAt: DateTime.utc(2026, 5, 5, 7),
      );

      final sessions = await repositories.sessions.getRecentSessions();
      final exerciseLogs = await database.select(database.exerciseLogs).get();
      final setLogs = await database.select(database.setLogs).get();
      final workingWeights = await database
          .select(database.workingWeights)
          .get();
      final updatedScheduledWorkout = await (database.select(
        database.scheduledWorkouts,
      )..where((table) => table.id.equals(scheduledWorkout.id))).getSingle();

      expect(sessions, hasLength(1));
      expect(sessions.single.workoutTemplateId, workoutTemplate.id);
      expect(exerciseLogs, hasLength(targets.length));
      expect(setLogs, isNotEmpty);
      expect(setLogs.every((set) => set.isComplete), isTrue);
      expect(workingWeights, isNotEmpty);
      expect(
        workingWeights.any(
          (row) =>
              row.exerciseId == 'conventional-deadlift' &&
              row.weight == 160 &&
              row.estimatedOneRepMax != null &&
              !row.isManualOverride,
        ),
        isTrue,
      );
      expect(updatedScheduledWorkout.status, 'completed');
    },
  );

  test(
    'session history returns details and delete removes a test session',
    () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      await AppSeedDataService(
        database,
      ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
      final repositories = AppRepositories(database);
      final scheduledWorkout =
          (await repositories.campaigns.getUpcomingScheduledWorkouts(
            from: DateTime.utc(2026, 5, 5),
          )).first;
      final workoutTemplate = (await repositories.workouts.getTemplate(
        scheduledWorkout.workoutTemplateId,
      ))!;
      final targets = await repositories.workouts.getExerciseTargets(
        workoutTemplate.id,
      );

      final sessionId = await repositories.sessions.completePlannedWorkout(
        scheduledWorkout: scheduledWorkout,
        workoutTemplate: workoutTemplate,
        exercises: [
          for (final target in targets)
            CompletedExerciseInput(
              exerciseId: target.exercise.id,
              sortOrder: target.templateExercise.sortOrder,
              sets: [
                CompletedSetInput(
                  setNumber: 1,
                  isComplete: true,
                  reps: 4,
                  weight: target.templateExercise.targetWeight,
                  rpe: target.templateExercise.targetRpe,
                ),
              ],
            ),
        ],
        startedAt: DateTime.utc(2026, 5, 5, 6),
        completedAt: DateTime.utc(2026, 5, 5, 7),
        notes: 'Solid session',
      );

      final history = await repositories.sessions.getSessionHistory();
      expect(history, hasLength(1));
      expect(history.single.workoutName, 'Day B - Lower Strength');
      expect(history.single.exercises, hasLength(targets.length));
      expect(
        history.single.exercises.first.exerciseName,
        'Conventional Deadlift',
      );
      expect(history.single.setCount, targets.length);
      expect(history.single.session.notes, 'Solid session');

      await repositories.sessions.deleteSession(sessionId);

      expect(await repositories.sessions.getSessionHistory(), isEmpty);
      expect(await database.select(database.exerciseLogs).get(), isEmpty);
      expect(await database.select(database.setLogs).get(), isEmpty);

      final updatedScheduledWorkout = await (database.select(
        database.scheduledWorkouts,
      )..where((table) => table.id.equals(scheduledWorkout.id))).getSingle();
      expect(updatedScheduledWorkout.status, 'planned');
    },
  );

  test('bodyweight logging updates linked bodyweight goal', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
    final repositories = AppRepositories(database);

    await repositories.bodyweight.logBodyweight(
      weightKg: 91.8,
      loggedAt: DateTime.utc(2026, 5, 10, 7),
    );

    final latestBodyweight = await repositories.bodyweight.getLatest();
    final goals = await repositories.goals.getActiveGoals();
    final bodyweightGoal = goals.singleWhere(
      (goal) => goal.linkedMetric == 'bodyweight',
    );

    expect(latestBodyweight?.weightKg, 91.8);
    expect(latestBodyweight?.isSeedExample, isFalse);
    expect(bodyweightGoal.currentValue, 91.8);
  });

  test('goal current value can be updated manually', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
    final repositories = AppRepositories(database);

    await repositories.goals.updateCurrentValue(
      goalId: 'goal-weighted-pullup-60kg',
      currentValue: 35,
    );

    final goals = await repositories.goals.getActiveGoals();
    final weightedPullUp = goals.singleWhere(
      (goal) => goal.id == 'goal-weighted-pullup-60kg',
    );

    expect(weightedPullUp.currentValue, 35);
  });

  test('working weights can be manually corrected', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
    final repositories = AppRepositories(database);

    await repositories.exercises.setManualWorkingWeight(
      exerciseId: 'barbell-bench-press',
      weight: 105,
    );

    final summaries = await repositories.exercises.getWorkingWeightSummaries();
    final bench = summaries.singleWhere(
      (summary) => summary.exercise.id == 'barbell-bench-press',
    );

    expect(bench.workingWeight?.weight, 105);
    expect(bench.workingWeight?.isManualOverride, isTrue);
  });
}
