import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class ExerciseRepository {
  const ExerciseRepository(this._database);

  final AppDatabase _database;

  Future<List<Exercise>> watchableSnapshot() {
    return (_database.select(
      _database.exercises,
    )..orderBy([(table) => OrderingTerm.asc(table.name)])).get();
  }

  Future<Exercise?> getById(String exerciseId) {
    return (_database.select(
      _database.exercises,
    )..where((table) => table.id.equals(exerciseId))).getSingleOrNull();
  }

  Future<List<WorkingWeightSummary>> getWorkingWeightSummaries() async {
    final exercises =
        await (_database.select(_database.exercises)
              ..where((table) => table.isArchived.equals(false))
              ..orderBy([(table) => OrderingTerm.asc(table.name)]))
            .get();

    final rows = <WorkingWeightSummary>[];
    for (final exercise in exercises) {
      final workingWeight =
          await (_database.select(_database.workingWeights)
                ..where((table) => table.exerciseId.equals(exercise.id)))
              .getSingleOrNull();
      final latest = await _latestPerformanceFor(exercise.id);
      final best = await _bestPerformanceFor(exercise.id);
      final targetWeight = await _latestTemplateTargetFor(exercise.id);

      if (workingWeight == null && latest == null && targetWeight == null) {
        continue;
      }

      rows.add(
        WorkingWeightSummary(
          exercise: exercise,
          workingWeight: workingWeight,
          latestPerformance: latest,
          bestPerformance: best,
          templateTargetWeight: targetWeight,
        ),
      );
    }

    return rows;
  }

  Future<ExerciseProgressDetail?> getProgressDetail(String exerciseId) async {
    final exercise = await getById(exerciseId);
    if (exercise == null) return null;

    final workingWeight = await (_database.select(
      _database.workingWeights,
    )..where((table) => table.exerciseId.equals(exerciseId))).getSingleOrNull();
    final performances = await _performancesFor(exerciseId, limit: 40);

    return ExerciseProgressDetail(
      exercise: exercise,
      workingWeight: workingWeight,
      performances: performances,
      bestPerformance: _bestOf(performances),
    );
  }

  Future<void> setManualWorkingWeight({
    required String exerciseId,
    required double weight,
    String unit = 'kg',
  }) {
    return _database
        .into(_database.workingWeights)
        .insertOnConflictUpdate(
          WorkingWeightsCompanion.insert(
            exerciseId: exerciseId,
            weight: weight,
            unit: Value(unit),
            estimatedOneRepMax: const Value(null),
            sourceSetLogId: const Value(null),
            isManualOverride: const Value(true),
            updatedAt: DateTime.now(),
          ),
        );
  }

  Future<void> upsert(ExercisesCompanion exercise) {
    return _database.into(_database.exercises).insertOnConflictUpdate(exercise);
  }

  Future<double?> _latestTemplateTargetFor(String exerciseId) async {
    final targets =
        await (_database.select(_database.workoutTemplateExercises)
              ..where((table) => table.exerciseId.equals(exerciseId))
              ..where((table) => table.targetWeight.isNotNull()))
            .get();
    if (targets.isEmpty) return null;
    targets.sort((a, b) => b.sortOrder.compareTo(a.sortOrder));
    return targets.first.targetWeight;
  }

  Future<SetPerformance?> _latestPerformanceFor(String exerciseId) async {
    final performances = await _performancesFor(exerciseId, limit: 1);
    return performances.firstOrNull;
  }

  Future<SetPerformance?> _bestPerformanceFor(String exerciseId) async {
    return _bestOf(await _performancesFor(exerciseId, limit: 100));
  }

  SetPerformance? _bestOf(List<SetPerformance> performances) {
    if (performances.isEmpty) return null;
    return performances.reduce((best, current) {
      final bestScore = best.estimatedOneRepMax ?? best.weight ?? 0;
      final currentScore = current.estimatedOneRepMax ?? current.weight ?? 0;
      return currentScore > bestScore ? current : best;
    });
  }

  Future<List<SetPerformance>> _performancesFor(
    String exerciseId, {
    required int limit,
  }) async {
    final exerciseLogs = await (_database.select(
      _database.exerciseLogs,
    )..where((table) => table.exerciseId.equals(exerciseId))).get();
    final rows = <SetPerformance>[];

    for (final exerciseLog in exerciseLogs) {
      final session =
          await (_database.select(_database.sessionLogs)
                ..where((table) => table.id.equals(exerciseLog.sessionLogId)))
              .getSingleOrNull();
      if (session == null) continue;

      WorkoutTemplate? workout;
      if (session.workoutTemplateId != null) {
        workout =
            await (_database.select(_database.workoutTemplates)..where(
                  (table) => table.id.equals(session.workoutTemplateId!),
                ))
                .getSingleOrNull();
      }

      final sets =
          await (_database.select(_database.setLogs)
                ..where((table) => table.exerciseLogId.equals(exerciseLog.id))
                ..where((table) => table.isComplete.equals(true))
                ..orderBy([(table) => OrderingTerm.asc(table.setNumber)]))
              .get();

      for (final set in sets) {
        rows.add(
          SetPerformance(
            setLog: set,
            sessionStartedAt: session.startedAt,
            workoutName: workout?.name ?? 'Workout',
            estimatedOneRepMax: _estimatedOneRepMax(set.weight, set.reps),
          ),
        );
      }
    }

    rows.sort((a, b) => b.sessionStartedAt.compareTo(a.sessionStartedAt));
    return rows.take(limit).toList();
  }

  double? _estimatedOneRepMax(double? weight, int? reps) {
    if (weight == null || reps == null || weight <= 0 || reps <= 0) {
      return null;
    }
    return weight * (1 + reps / 30);
  }
}

class WorkingWeightSummary {
  const WorkingWeightSummary({
    required this.exercise,
    required this.workingWeight,
    required this.latestPerformance,
    required this.bestPerformance,
    required this.templateTargetWeight,
  });

  final Exercise exercise;
  final WorkingWeight? workingWeight;
  final SetPerformance? latestPerformance;
  final SetPerformance? bestPerformance;
  final double? templateTargetWeight;

  double? get displayWeight =>
      workingWeight?.weight ??
      latestPerformance?.weight ??
      templateTargetWeight;
}

class ExerciseProgressDetail {
  const ExerciseProgressDetail({
    required this.exercise,
    required this.workingWeight,
    required this.performances,
    required this.bestPerformance,
  });

  final Exercise exercise;
  final WorkingWeight? workingWeight;
  final List<SetPerformance> performances;
  final SetPerformance? bestPerformance;
}

class SetPerformance {
  const SetPerformance({
    required this.setLog,
    required this.sessionStartedAt,
    required this.workoutName,
    required this.estimatedOneRepMax,
  });

  final SetLog setLog;
  final DateTime sessionStartedAt;
  final String workoutName;
  final double? estimatedOneRepMax;

  double? get weight => setLog.weight;
  int? get reps => setLog.reps;
  double? get rpe => setLog.rpe;
}
