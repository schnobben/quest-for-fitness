import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';
import 'may_september_2026_seed.dart';

class AppSeedDataService {
  const AppSeedDataService(this._database);

  final AppDatabase _database;

  Future<bool> hasSeedRun(String seedName) async {
    final row = await (_database.select(
      _database.seedRuns,
    )..where((table) => table.seedName.equals(seedName))).getSingleOrNull();

    return row != null;
  }

  Future<void> markSeedRun({
    required String seedName,
    required int seedVersion,
    required DateTime appliedAt,
  }) {
    return _database
        .into(_database.seedRuns)
        .insertOnConflictUpdate(
          SeedRunsCompanion(
            id: Value('$seedName-v$seedVersion'),
            seedName: Value(seedName),
            seedVersion: Value(seedVersion),
            appliedAt: Value(appliedAt),
          ),
        );
  }

  Future<void> loadMaySeptember2026SeedCampaign({DateTime? appliedAt}) async {
    if (await hasSeedRun(MaySeptember2026Seed.seedName)) {
      return;
    }

    final now = appliedAt ?? DateTime.now();

    await _database.transaction(() async {
      await _insertCampaign(now);
      await _insertCampaignPhases();
      await _insertProgramTemplate(now);
      await _insertExercises(now);
      await _insertWorkoutTemplates(now);
      await _insertWorkoutTemplateExercises();
      await _insertScheduledWorkouts(now);
      await _insertGoals(now);
      await _insertInitialBodyweight(now);
      await markSeedRun(
        seedName: MaySeptember2026Seed.seedName,
        seedVersion: MaySeptember2026Seed.seedVersion,
        appliedAt: now,
      );
    });
  }

  Future<void> _insertCampaign(DateTime now) {
    final campaign = MaySeptember2026Seed.campaign;

    return _database
        .into(_database.campaigns)
        .insertOnConflictUpdate(
          CampaignsCompanion.insert(
            id: campaign.id,
            name: campaign.name,
            description: Value(campaign.description),
            startDate: campaign.startDate,
            endDate: campaign.endDate,
            isActive: const Value(true),
            isSeedContent: const Value(true),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<void> _insertCampaignPhases() async {
    for (final phase in MaySeptember2026Seed.phases) {
      await _database
          .into(_database.campaignPhases)
          .insertOnConflictUpdate(
            CampaignPhasesCompanion.insert(
              id: phase.id,
              campaignId: phase.campaignId,
              name: phase.name,
              phaseOrder: phase.phaseOrder,
              startDate: phase.startDate,
              endDate: phase.endDate,
              notes: Value(phase.notes),
            ),
          );
    }
  }

  Future<void> _insertProgramTemplate(DateTime now) {
    return _database
        .into(_database.programTemplates)
        .insertOnConflictUpdate(
          ProgramTemplatesCompanion.insert(
            id: MaySeptember2026Seed.programTemplateId,
            name: 'May–September 2026 Strength & Conditioning',
            description: const Value(
              'Seed program for the May–September 2026 campaign. Phase 1 uses four weekly strength templates.',
            ),
            sourceCampaignId: const Value(MaySeptember2026Seed.campaignId),
            isSeedContent: const Value(true),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<void> _insertExercises(DateTime now) async {
    for (final exercise in MaySeptember2026Seed.exercises) {
      await _database
          .into(_database.exercises)
          .insertOnConflictUpdate(
            ExercisesCompanion.insert(
              id: exercise.id,
              name: exercise.name,
              category: exercise.category,
              equipment: Value(exercise.equipment),
              primaryMuscles: Value(exercise.primaryMuscles),
              movementPattern: Value(exercise.movementPattern),
              defaultUnit: Value(exercise.defaultUnit),
              isBodyweight: Value(exercise.isBodyweight),
              notes: Value(exercise.notes),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }
  }

  Future<void> _insertWorkoutTemplates(DateTime now) async {
    for (final workout in MaySeptember2026Seed.phaseOneWorkouts) {
      await _database
          .into(_database.workoutTemplates)
          .insertOnConflictUpdate(
            WorkoutTemplatesCompanion.insert(
              id: workout.id,
              name: workout.name,
              description: Value(workout.description),
              sourceCampaignId: const Value(MaySeptember2026Seed.campaignId),
              isSeedContent: const Value(true),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }
  }

  Future<void> _insertWorkoutTemplateExercises() async {
    for (final workout in MaySeptember2026Seed.phaseOneWorkouts) {
      for (final exercise in workout.exercises) {
        await _database
            .into(_database.workoutTemplateExercises)
            .insertOnConflictUpdate(
              WorkoutTemplateExercisesCompanion.insert(
                id: '${workout.id}-${exercise.sortOrder}',
                workoutTemplateId: workout.id,
                exerciseId: exercise.exerciseId,
                sortOrder: exercise.sortOrder,
                targetSets: Value(exercise.targetSets),
                targetReps: Value(exercise.targetReps),
                targetWeight: Value(exercise.targetWeight),
                targetRpe: Value(exercise.targetRpeValue),
                restGuidance: Value(exercise.restGuidance),
                notes: Value(exercise.notesWithRpe),
              ),
            );
      }
    }
  }

  Future<void> _insertScheduledWorkouts(DateTime now) async {
    for (final scheduledWorkout in MaySeptember2026Seed.phaseOneSchedule) {
      await _database
          .into(_database.scheduledWorkouts)
          .insertOnConflictUpdate(
            ScheduledWorkoutsCompanion.insert(
              id: scheduledWorkout.id,
              campaignId: const Value(MaySeptember2026Seed.campaignId),
              programTemplateId: const Value(
                MaySeptember2026Seed.programTemplateId,
              ),
              workoutTemplateId: scheduledWorkout.workoutTemplateId,
              scheduledFor: scheduledWorkout.scheduledFor,
              notes: const Value(
                'Phase 1 seed schedule; editable by the user later.',
              ),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }
  }

  Future<void> _insertGoals(DateTime now) async {
    for (final goal in MaySeptember2026Seed.goals) {
      await _database
          .into(_database.goals)
          .insertOnConflictUpdate(
            GoalsCompanion.insert(
              id: goal.id,
              campaignId: const Value(MaySeptember2026Seed.campaignId),
              name: goal.name,
              category: goal.category,
              currentValue: Value(goal.currentValue),
              targetValue: goal.targetValue,
              unit: goal.unit,
              direction: goal.direction,
              linkedMetric: Value(goal.linkedMetric),
              targetDate: Value(goal.targetDate),
              isSeedContent: const Value(true),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }
  }

  Future<void> _insertInitialBodyweight(DateTime now) {
    final entry = MaySeptember2026Seed.initialBodyweight;

    return _database
        .into(_database.bodyweightLogs)
        .insertOnConflictUpdate(
          BodyweightLogsCompanion.insert(
            id: entry.id,
            loggedAt: entry.loggedAt,
            weightKg: entry.weightKg,
            notes: Value(entry.notes),
            isSeedExample: const Value(true),
            createdAt: now,
          ),
        );
  }
}
