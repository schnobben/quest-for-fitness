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
        'achievement_states',
        'achievements',
        'adventurers',
        'campaign_phases',
        'campaigns',
        'cardio_logs',
        'adventurer_titles',
        'equipment_definitions',
        'equipment_inventory',
        'equipped_equipment',
        'exercise_logs',
        'exercises',
        'goals',
        'program_templates',
        'progression_suggestions',
        'fitness_events',
        'reward_events',
        'scheduled_workouts',
        'seed_runs',
        'session_logs',
        'set_logs',
        'title_definitions',
        'working_weights',
        'workout_template_exercises',
        'workout_templates',
        'xp_history',
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

      final result = await repositories.sessions.completePlannedWorkout(
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
      final analytics = await repositories.sessions.getAnalyticsSnapshot(
        DateTime.utc(2026, 5, 6),
      );
      expect(analytics.weeklyWorkoutCount, 1);
      expect(analytics.plannedWorkoutCount, greaterThanOrEqualTo(1));
      expect(analytics.completedScheduledWorkoutCount, 1);
      expect(analytics.weeklyVolumeKg, greaterThan(0));
      expect(analytics.currentTrainingStreakDays, 1);
      expect(updatedScheduledWorkout.status, 'completed');
      expect(
        result.workoutReward.xpAmount,
        xpWorkoutBase + setLogs.length * xpWorkoutPerSet,
      );
      expect(await database.select(database.fitnessEvents).get(), isNotEmpty);
      expect(await database.select(database.rewardEvents).get(), isNotEmpty);
      expect(await database.select(database.xpHistory).get(), isNotEmpty);
      final achievements = await repositories.achievements
          .getAchievementStates();
      final firstWorkout = achievements.singleWhere(
        (item) => item.achievement.id == AchievementId.firstWorkout,
      );
      expect(firstWorkout.state.isUnlocked, isTrue);
      final inventory = await repositories.equipment.getInventoryView();
      final trainingBlade = inventory.equipment.singleWhere(
        (item) => item.definition.id == EquipmentId.trainingBlade,
      );
      expect(trainingBlade.isUnlocked, isTrue);
      expect(trainingBlade.isEquipped, isTrue);
    },
  );

  test('equipment and title unlocks can be equipped and selected', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    final repositories = AppRepositories(database);

    await repositories.xpEvents.onDebugXpGranted(xpAmount: 125);
    final afterLevel = await repositories.equipment.getInventoryView();
    final trailInitiate = afterLevel.titles.singleWhere(
      (item) => item.definition.id == TitleId.trailInitiate,
    );
    expect(trailInitiate.isUnlocked, isTrue);
    expect(trailInitiate.isSelected, isTrue);

    await repositories.xpEvents.onWorkoutCompleted(
      sessionId: 'manual-session',
      setCount: 1,
      occurredAt: DateTime.utc(2026, 5, 5, 7),
    );
    await repositories.equipment.equip(EquipmentId.trainingBlade);
    await repositories.equipment.selectTitle(TitleId.noviceAdventurer);

    final inventory = await repositories.equipment.getInventoryView();
    final blade = inventory.equipment.singleWhere(
      (item) => item.definition.id == EquipmentId.trainingBlade,
    );
    final novice = inventory.titles.singleWhere(
      (item) => item.definition.id == TitleId.noviceAdventurer,
    );
    final rewards = await database.select(database.rewardEvents).get();

    expect(blade.isUnlocked, isTrue);
    expect(blade.isEquipped, isTrue);
    expect(novice.isSelected, isTrue);
    expect(
      rewards.any((reward) => reward.type == RewardEventType.equipmentUnlocked),
      isTrue,
    );
    expect(
      rewards.any((reward) => reward.type == RewardEventType.titleUnlocked),
      isTrue,
    );
  });

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

      final result = await repositories.sessions.completePlannedWorkout(
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

      await repositories.sessions.deleteSession(result.sessionId);

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

  test('run logging stores pace and updates 5k goal when faster', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
    final repositories = AppRepositories(database);

    final run = await repositories.cardio.logRun(
      loggedAt: DateTime.utc(2026, 5, 12, 7),
      distanceKm: 5,
      durationMinutes: 29,
      notes: 'Comfortable benchmark',
    );

    final runs = await repositories.cardio.getRecentRuns();
    final goals = await repositories.goals.getActiveGoals();
    final fiveKmGoal = goals.singleWhere(
      (goal) => goal.linkedMetric == 'cardio:5k_time',
    );

    expect(runs, hasLength(1));
    expect(run.distanceMeters, 5000);
    expect(run.durationSeconds, 1740);
    expect(run.paceSecondsPerKm, 348);
    expect(run.notes, 'Comfortable benchmark');
    expect(fiveKmGoal.currentValue, closeTo(29, 0.001));
    final achievements = await repositories.achievements.getAchievementStates();
    final firstRun = achievements.singleWhere(
      (item) => item.achievement.id == AchievementId.firstRun,
    );
    expect(firstRun.state.isUnlocked, isTrue);
  });

  test(
    'achievement progress tracks bodyweight, PR, total workouts, and goals',
    () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      await AppSeedDataService(
        database,
      ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
      final repositories = AppRepositories(database);

      await repositories.bodyweight.logBodyweight(
        weightKg: 83,
        loggedAt: DateTime.utc(2026, 5, 10, 7),
      );
      await repositories.goals.updateCurrentValue(
        goalId: 'goal-weighted-pullup-60kg',
        currentValue: 60,
      );

      final firstWorkout =
          (await repositories.campaigns.getUpcomingScheduledWorkouts(
            from: DateTime.utc(2026, 5, 5),
            limit: 30,
          )).first;
      final template = (await repositories.workouts.getTemplate(
        firstWorkout.workoutTemplateId,
      ))!;
      final targets = await repositories.workouts.getExerciseTargets(
        template.id,
      );
      for (var index = 0; index < 10; index++) {
        final workout = firstWorkout.copyWith(
          id: 'achievement-workout-$index',
          scheduledFor: DateTime.utc(2026, 5, 5 + index, 7),
          status: 'planned',
        );
        await database
            .into(database.scheduledWorkouts)
            .insert(
              ScheduledWorkoutsCompanion.insert(
                id: workout.id,
                campaignId: Value(workout.campaignId),
                programTemplateId: Value(workout.programTemplateId),
                workoutTemplateId: workout.workoutTemplateId,
                scheduledFor: workout.scheduledFor,
                status: Value(workout.status),
                createdAt: workout.createdAt,
                updatedAt: workout.updatedAt,
              ),
            );
        await repositories.sessions.completePlannedWorkout(
          scheduledWorkout: workout,
          workoutTemplate: template,
          exercises: [
            for (final target in targets)
              CompletedExerciseInput(
                exerciseId: target.exercise.id,
                sortOrder: target.templateExercise.sortOrder,
                sets: [
                  CompletedSetInput(
                    setNumber: 1,
                    isComplete: true,
                    reps: 6,
                    weight:
                        (target.templateExercise.targetWeight ?? 10) + index,
                    rpe: target.templateExercise.targetRpe,
                  ),
                ],
              ),
          ],
          startedAt: workout.scheduledFor,
          completedAt: workout.scheduledFor.add(const Duration(hours: 1)),
        );
      }

      final achievements = await repositories.achievements
          .getAchievementStates();
      bool unlocked(String id) => achievements
          .singleWhere((item) => item.achievement.id == id)
          .state
          .isUnlocked;

      expect(unlocked(AchievementId.firstBodyweightLog), isTrue);
      expect(unlocked(AchievementId.firstGoalMilestone), isTrue);
      expect(unlocked(AchievementId.firstPr), isTrue);
      expect(unlocked(AchievementId.fourWorkoutsWeek), isTrue);
      expect(unlocked(AchievementId.tenTotalWorkouts), isTrue);
    },
  );

  test('progression suggestions can be accepted or ignored', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));
    final repositories = AppRepositories(database);

    final firstWorkout =
        (await repositories.campaigns.getUpcomingScheduledWorkouts(
          from: DateTime.utc(2026, 5, 5),
          limit: 30,
        )).first;
    final secondWorkout = ScheduledWorkout(
      id: 'progression-day-b-repeat',
      campaignId: firstWorkout.campaignId,
      programTemplateId: firstWorkout.programTemplateId,
      workoutTemplateId: firstWorkout.workoutTemplateId,
      scheduledFor: firstWorkout.scheduledFor.add(const Duration(days: 7)),
      status: 'planned',
      notes: null,
      createdAt: firstWorkout.createdAt,
      updatedAt: firstWorkout.updatedAt,
    );
    await database
        .into(database.scheduledWorkouts)
        .insert(
          ScheduledWorkoutsCompanion.insert(
            id: secondWorkout.id,
            campaignId: Value(secondWorkout.campaignId),
            programTemplateId: Value(secondWorkout.programTemplateId),
            workoutTemplateId: secondWorkout.workoutTemplateId,
            scheduledFor: secondWorkout.scheduledFor,
            status: Value(secondWorkout.status),
            createdAt: secondWorkout.createdAt,
            updatedAt: secondWorkout.updatedAt,
          ),
        );
    final scheduled = [firstWorkout, secondWorkout];

    for (final workout in scheduled) {
      final template = (await repositories.workouts.getTemplate(
        workout.workoutTemplateId,
      ))!;
      final targets = await repositories.workouts.getExerciseTargets(
        template.id,
      );
      await repositories.sessions.completePlannedWorkout(
        scheduledWorkout: workout,
        workoutTemplate: template,
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
                    reps: _upperRepTarget(target.templateExercise.targetReps),
                    weight: target.templateExercise.targetWeight,
                    rpe: target.templateExercise.targetRpe,
                  ),
              ],
            ),
        ],
        startedAt: workout.scheduledFor.add(const Duration(hours: 6)),
        completedAt: workout.scheduledFor.add(const Duration(hours: 7)),
      );
    }

    final suggestions = await repositories.exercises
        .getProgressionSuggestions();
    final deadlift = suggestions.singleWhere(
      (suggestion) => suggestion.exercise.id == 'conventional-deadlift',
    );
    expect(deadlift.suggestion.currentWeight, 160);
    expect(deadlift.suggestion.suggestedWeight, 162.5);

    await repositories.exercises.acceptProgressionSuggestion(
      deadlift.suggestion.id,
    );
    final deadliftWeight =
        await (database.select(database.workingWeights)..where(
              (table) => table.exerciseId.equals('conventional-deadlift'),
            ))
            .getSingle();
    expect(deadliftWeight.weight, 162.5);

    final remaining = await repositories.exercises.getProgressionSuggestions();
    final rdl = remaining.singleWhere(
      (suggestion) => suggestion.exercise.id == 'romanian-deadlift',
    );
    await repositories.exercises.ignoreProgressionSuggestion(rdl.suggestion.id);
    final ignored = await (database.select(
      database.progressionSuggestions,
    )..where((table) => table.id.equals(rdl.suggestion.id))).getSingle();
    expect(ignored.status, 'ignored');
  });

  test('adventurer profile persists xp and level progression', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    final repositories = AppRepositories(database);

    final initial = await repositories.adventurer.getOrCreatePrimary();
    expect(initial.name, 'Iron Ranger');
    expect(initial.level, 1);
    expect(initial.xp, 0);
    expect(initial.selectedClass, 'Warrior');
    expect(initial.currentTitle, 'Novice Adventurer');
    expect(initial.might, greaterThan(0));

    final leveled = await repositories.adventurer.grantXp(125);
    expect(leveled.level, 2);
    expect(leveled.xp, 25);
    expect(leveled.currentTitle, 'Trail Initiate');

    final reloaded = await repositories.adventurer.getOrCreatePrimary();
    expect(reloaded.level, 2);
    expect(reloaded.xp, 25);
  });
}

int? _upperRepTarget(String? targetReps) {
  if (targetReps == null) return null;
  return int.tryParse(targetReps.split('-').last.trim());
}
