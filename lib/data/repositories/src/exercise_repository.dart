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

  Future<List<Exercise>> listCustom() {
    return (_database.select(_database.exercises)
          ..where((table) => table.isCustom.equals(true))
          ..where((table) => table.isArchived.equals(false))
          ..orderBy([(table) => OrderingTerm.asc(table.name)]))
        .get();
  }

  Future<List<Exercise>> listAll() {
    return (_database.select(_database.exercises)
          ..where((table) => table.isArchived.equals(false))
          ..orderBy([(table) => OrderingTerm.asc(table.name)]))
        .get();
  }

  Future<bool> hasLogs(String exerciseId) async {
    final log =
        await (_database.select(_database.exerciseLogs)
              ..where((table) => table.exerciseId.equals(exerciseId))
              ..limit(1))
            .getSingleOrNull();
    return log != null;
  }

  Future<void> createCustom({
    required String id,
    required String name,
    required String category,
    String? equipment,
    String? primaryMuscles,
    String? movementPattern,
    required String defaultUnit,
    required bool isBodyweight,
    required bool isUnilateral,
    String? notes,
  }) {
    final now = DateTime.now();
    return _database.into(_database.exercises).insert(
      ExercisesCompanion.insert(
        id: id,
        name: name,
        category: category,
        equipment: Value(equipment),
        primaryMuscles: Value(primaryMuscles),
        movementPattern: Value(movementPattern),
        defaultUnit: Value(defaultUnit),
        isBodyweight: Value(isBodyweight),
        isUnilateral: Value(isUnilateral),
        isCustom: const Value(true),
        isArchived: const Value(false),
        notes: Value(notes),
        createdAt: now,
        updatedAt: now,
      ),
    );
  }

  Future<void> updateCustom({
    required String id,
    required String name,
    required String category,
    String? equipment,
    String? primaryMuscles,
    String? movementPattern,
    required String defaultUnit,
    required bool isBodyweight,
    required bool isUnilateral,
    String? notes,
  }) async {
    final exercise = await getById(id);
    if (exercise == null || !exercise.isCustom) {
      throw StateError('Only custom exercises can be updated.');
    }

    await (_database.update(
      _database.exercises,
    )..where((table) => table.id.equals(id))).write(
      ExercisesCompanion(
        name: Value(name),
        category: Value(category),
        equipment: Value(equipment),
        primaryMuscles: Value(primaryMuscles),
        movementPattern: Value(movementPattern),
        defaultUnit: Value(defaultUnit),
        isBodyweight: Value(isBodyweight),
        isUnilateral: Value(isUnilateral),
        notes: Value(notes),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> archiveExercise(String id) async {
    await hasLogs(id);
    await (_database.update(
      _database.exercises,
    )..where((table) => table.id.equals(id))).write(
      ExercisesCompanion(
        isArchived: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteExercise(String id) async {
    if (await hasLogs(id)) {
      throw StateError('Exercises with logs cannot be deleted.');
    }

    final exercise = await getById(id);
    if (exercise == null || !exercise.isCustom) {
      throw StateError('Only custom exercises can be deleted.');
    }

    await (_database.delete(
      _database.exercises,
    )..where((table) => table.id.equals(id))).go();
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

  Future<List<ProgressionSuggestionView>> getProgressionSuggestions() async {
    await evaluateProgressionSuggestions();
    final suggestions =
        await (_database.select(_database.progressionSuggestions)
              ..where((table) => table.status.equals('pending'))
              ..orderBy([(table) => OrderingTerm.desc(table.createdAt)]))
            .get();

    final views = <ProgressionSuggestionView>[];
    for (final suggestion in suggestions) {
      final exercise = await getById(suggestion.exerciseId);
      if (exercise == null) continue;
      views.add(
        ProgressionSuggestionView(suggestion: suggestion, exercise: exercise),
      );
    }
    return views;
  }

  Future<void> acceptProgressionSuggestion(String suggestionId) async {
    final suggestion = await (_database.select(
      _database.progressionSuggestions,
    )..where((table) => table.id.equals(suggestionId))).getSingleOrNull();
    if (suggestion == null) return;

    await _database.transaction(() async {
      await setManualWorkingWeight(
        exerciseId: suggestion.exerciseId,
        weight: suggestion.suggestedWeight,
        unit: suggestion.unit,
      );
      await (_database.update(
        _database.progressionSuggestions,
      )..where((table) => table.id.equals(suggestionId))).write(
        ProgressionSuggestionsCompanion(
          status: const Value('accepted'),
          resolvedAt: Value(DateTime.now()),
        ),
      );
    });
  }

  Future<void> ignoreProgressionSuggestion(String suggestionId) {
    return (_database.update(
      _database.progressionSuggestions,
    )..where((table) => table.id.equals(suggestionId))).write(
      ProgressionSuggestionsCompanion(
        status: const Value('ignored'),
        resolvedAt: Value(DateTime.now()),
      ),
    );
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

  Future<void> evaluateProgressionSuggestions() async {
    final exercises = await (_database.select(
      _database.exercises,
    )..where((table) => table.isArchived.equals(false))).get();

    for (final exercise in exercises) {
      final pending =
          await (_database.select(_database.progressionSuggestions)
                ..where((table) => table.exerciseId.equals(exercise.id))
                ..where((table) => table.status.equals('pending')))
              .getSingleOrNull();
      if (pending != null) continue;

      final workingWeight =
          await (_database.select(_database.workingWeights)
                ..where((table) => table.exerciseId.equals(exercise.id)))
              .getSingleOrNull();
      final currentWeight = workingWeight?.weight;
      if (currentWeight == null || currentWeight <= 0) continue;

      final recentLogs = await _recentExerciseLogs(exercise.id, limit: 2);
      if (recentLogs.length < 2) continue;

      final successes = <_ProgressionSuccess>[];
      for (final exerciseLog in recentLogs) {
        final success = await _progressionSuccessFor(exerciseLog);
        if (success == null) break;
        successes.add(success);
      }
      if (successes.length < 2) continue;

      final increment = _progressionIncrement(exercise, currentWeight);
      final suggestedWeight = currentWeight + increment;
      final now = DateTime.now();
      await _database
          .into(_database.progressionSuggestions)
          .insert(
            ProgressionSuggestionsCompanion.insert(
              id: 'progression-${exercise.id}-${now.microsecondsSinceEpoch}',
              exerciseId: exercise.id,
              currentWeight: currentWeight,
              suggestedWeight: suggestedWeight,
              unit: Value(workingWeight?.unit ?? exercise.defaultUnit),
              reason:
                  'Hit target reps at target RPE for ${successes.length} straight sessions.',
              createdAt: now,
            ),
          );
    }
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

  Future<List<ExerciseLog>> _recentExerciseLogs(
    String exerciseId, {
    required int limit,
  }) async {
    final logs = await (_database.select(
      _database.exerciseLogs,
    )..where((table) => table.exerciseId.equals(exerciseId))).get();
    final rows = <({ExerciseLog log, DateTime startedAt})>[];

    for (final log in logs) {
      final session = await (_database.select(
        _database.sessionLogs,
      )..where((table) => table.id.equals(log.sessionLogId))).getSingleOrNull();
      if (session == null) continue;
      rows.add((log: log, startedAt: session.startedAt));
    }

    rows.sort((a, b) => b.startedAt.compareTo(a.startedAt));
    return rows.take(limit).map((row) => row.log).toList();
  }

  Future<_ProgressionSuccess?> _progressionSuccessFor(
    ExerciseLog exerciseLog,
  ) async {
    final session =
        await (_database.select(_database.sessionLogs)
              ..where((table) => table.id.equals(exerciseLog.sessionLogId)))
            .getSingleOrNull();
    if (session?.workoutTemplateId == null) return null;

    final target =
        await (_database.select(_database.workoutTemplateExercises)
              ..where(
                (table) =>
                    table.workoutTemplateId.equals(session!.workoutTemplateId!),
              )
              ..where(
                (table) => table.exerciseId.equals(exerciseLog.exerciseId),
              ))
            .getSingleOrNull();
    if (target == null ||
        target.targetSets == null ||
        target.targetReps == null ||
        target.targetRpe == null) {
      return null;
    }

    final targetReps = _upperRepTarget(target.targetReps!);
    if (targetReps == null) return null;

    final sets =
        await (_database.select(_database.setLogs)
              ..where((table) => table.exerciseLogId.equals(exerciseLog.id))
              ..where((table) => table.isComplete.equals(true))
              ..orderBy([(table) => OrderingTerm.asc(table.setNumber)]))
            .get();
    if (sets.length < target.targetSets!) return null;

    final scoredSets = sets.take(target.targetSets!);
    for (final set in scoredSets) {
      if (set.reps == null || set.rpe == null) return null;
      if (set.reps! < targetReps || set.rpe! > target.targetRpe!) {
        return null;
      }
    }

    return _ProgressionSuccess(
      exerciseLog: exerciseLog,
      targetReps: targetReps,
      targetRpe: target.targetRpe!,
    );
  }

  int? _upperRepTarget(String targetReps) {
    final parts = targetReps.split('-');
    return int.tryParse(parts.last.trim());
  }

  double _progressionIncrement(Exercise exercise, double currentWeight) {
    final equipment = (exercise.equipment ?? '').toLowerCase();
    if (equipment.contains('dumbbell') || currentWeight < 30) return 1;
    return 2.5;
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

class _ProgressionSuccess {
  const _ProgressionSuccess({
    required this.exerciseLog,
    required this.targetReps,
    required this.targetRpe,
  });

  final ExerciseLog exerciseLog;
  final int targetReps;
  final double targetRpe;
}

class ProgressionSuggestionView {
  const ProgressionSuggestionView({
    required this.suggestion,
    required this.exercise,
  });

  final ProgressionSuggestion suggestion;
  final Exercise exercise;
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
