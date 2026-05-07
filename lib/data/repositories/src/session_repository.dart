import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';
import 'xp_event_service.dart';

class SessionRepository {
  const SessionRepository(this._database, this._xpEvents);

  final AppDatabase _database;
  final XpEventService _xpEvents;

  Future<List<SessionLog>> getRecentSessions({int limit = 20}) {
    return (_database.select(_database.sessionLogs)
          ..orderBy([(table) => OrderingTerm.desc(table.startedAt)])
          ..limit(limit))
        .get();
  }

  Future<List<SessionHistoryEntry>> getSessionHistory({int limit = 50}) async {
    final sessions = await getRecentSessions(limit: limit);
    final entries = <SessionHistoryEntry>[];

    for (final session in sessions) {
      WorkoutTemplate? workoutTemplate;
      if (session.workoutTemplateId != null) {
        workoutTemplate =
            await (_database.select(_database.workoutTemplates)..where(
                  (table) => table.id.equals(session.workoutTemplateId!),
                ))
                .getSingleOrNull();
      }

      final exerciseLogs =
          await (_database.select(_database.exerciseLogs)
                ..where((table) => table.sessionLogId.equals(session.id))
                ..orderBy([(table) => OrderingTerm.asc(table.sortOrder)]))
              .get();

      final exercises = <SessionExerciseHistoryEntry>[];
      for (final exerciseLog in exerciseLogs) {
        final exercise =
            await (_database.select(_database.exercises)
                  ..where((table) => table.id.equals(exerciseLog.exerciseId)))
                .getSingleOrNull();
        final sets =
            await (_database.select(_database.setLogs)
                  ..where((table) => table.exerciseLogId.equals(exerciseLog.id))
                  ..orderBy([(table) => OrderingTerm.asc(table.setNumber)]))
                .get();

        exercises.add(
          SessionExerciseHistoryEntry(
            exerciseLog: exerciseLog,
            exerciseName: exercise?.name ?? 'Unknown exercise',
            sets: sets,
          ),
        );
      }

      entries.add(
        SessionHistoryEntry(
          session: session,
          workoutName: workoutTemplate?.name ?? 'Workout',
          exercises: exercises,
        ),
      );
    }

    return entries;
  }

  Future<SessionAnalyticsSnapshot> getAnalyticsSnapshot(DateTime today) async {
    final day = DateTime(today.year, today.month, today.day);
    final weekStart = day.subtract(Duration(days: day.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 7));

    final sessions =
        await (_database.select(_database.sessionLogs)
              ..where(
                (table) => table.startedAt.isBiggerOrEqualValue(weekStart),
              )
              ..where((table) => table.startedAt.isSmallerThanValue(weekEnd)))
            .get();

    final scheduled =
        await (_database.select(_database.scheduledWorkouts)
              ..where(
                (table) => table.scheduledFor.isBiggerOrEqualValue(weekStart),
              )
              ..where(
                (table) => table.scheduledFor.isSmallerThanValue(weekEnd),
              ))
            .get();

    var weeklyVolume = 0.0;
    for (final session in sessions) {
      final exerciseLogs = await (_database.select(
        _database.exerciseLogs,
      )..where((table) => table.sessionLogId.equals(session.id))).get();
      for (final exerciseLog in exerciseLogs) {
        final sets =
            await (_database.select(_database.setLogs)
                  ..where((table) => table.exerciseLogId.equals(exerciseLog.id))
                  ..where((table) => table.isComplete.equals(true)))
                .get();
        for (final set in sets) {
          if (set.weight != null && set.reps != null) {
            weeklyVolume += set.weight! * set.reps!;
          }
        }
      }
    }

    final completedScheduledCount = scheduled
        .where((workout) => workout.status == 'completed')
        .length;
    final adherence = scheduled.isEmpty
        ? 0.0
        : completedScheduledCount / scheduled.length;

    return SessionAnalyticsSnapshot(
      weekStart: weekStart,
      weekEndExclusive: weekEnd,
      weeklyWorkoutCount: sessions.length,
      plannedWorkoutCount: scheduled.length,
      completedScheduledWorkoutCount: completedScheduledCount,
      weeklyVolumeKg: weeklyVolume,
      adherence: adherence,
      currentTrainingStreakDays: await _trainingStreakDays(),
    );
  }

  Future<void> upsertSession(SessionLogsCompanion session) {
    return _database
        .into(_database.sessionLogs)
        .insertOnConflictUpdate(session);
  }

  Future<void> deleteSession(String sessionId) async {
    await _database.transaction(() async {
      final session = await (_database.select(
        _database.sessionLogs,
      )..where((table) => table.id.equals(sessionId))).getSingleOrNull();
      if (session == null) {
        return;
      }

      final exercises = await (_database.select(
        _database.exerciseLogs,
      )..where((table) => table.sessionLogId.equals(sessionId))).get();

      for (final exercise in exercises) {
        await (_database.delete(_database.workingWeights)
              ..where((table) => table.exerciseId.equals(exercise.exerciseId))
              ..where((table) => table.isManualOverride.equals(false)))
            .go();
        await (_database.delete(
          _database.setLogs,
        )..where((table) => table.exerciseLogId.equals(exercise.id))).go();
      }

      await (_database.delete(
        _database.exerciseLogs,
      )..where((table) => table.sessionLogId.equals(sessionId))).go();
      await (_database.delete(
        _database.sessionLogs,
      )..where((table) => table.id.equals(sessionId))).go();

      if (session.scheduledWorkoutId != null) {
        await (_database.update(_database.scheduledWorkouts)
              ..where((table) => table.id.equals(session.scheduledWorkoutId!)))
            .write(
              ScheduledWorkoutsCompanion(
                status: const Value('planned'),
                updatedAt: Value(DateTime.now()),
              ),
            );
      }
    });
  }

  Future<WorkoutCompletionResult> completePlannedWorkout({
    required ScheduledWorkout scheduledWorkout,
    required WorkoutTemplate workoutTemplate,
    required List<CompletedExerciseInput> exercises,
    required DateTime startedAt,
    required DateTime completedAt,
    String? notes,
  }) async {
    final sessionId = 'session-${scheduledWorkout.id}';
    final durationSeconds = completedAt.difference(startedAt).inSeconds;

    final completedSetCount = exercises.fold<int>(
      0,
      (count, exercise) =>
          count + exercise.sets.where((set) => set.isComplete).length,
    );
    final prSetIds = <String>[];

    await _database.transaction(() async {
      await _database
          .into(_database.sessionLogs)
          .insertOnConflictUpdate(
            SessionLogsCompanion.insert(
              id: sessionId,
              scheduledWorkoutId: Value(scheduledWorkout.id),
              workoutTemplateId: Value(workoutTemplate.id),
              startedAt: startedAt,
              completedAt: Value(completedAt),
              durationSeconds: Value(durationSeconds),
              notes: Value(notes),
              createdAt: startedAt,
              updatedAt: completedAt,
            ),
          );

      for (final exercise in exercises) {
        final exerciseLogId = '$sessionId-${exercise.exerciseId}';
        await _database
            .into(_database.exerciseLogs)
            .insertOnConflictUpdate(
              ExerciseLogsCompanion.insert(
                id: exerciseLogId,
                sessionLogId: sessionId,
                exerciseId: exercise.exerciseId,
                sortOrder: exercise.sortOrder,
                notes: Value(exercise.notes),
              ),
            );

        for (final set in exercise.sets) {
          await _database
              .into(_database.setLogs)
              .insertOnConflictUpdate(
                SetLogsCompanion.insert(
                  id: '$exerciseLogId-set-${set.setNumber}',
                  exerciseLogId: exerciseLogId,
                  setNumber: set.setNumber,
                  reps: Value(set.reps),
                  weight: Value(set.weight),
                  rpe: Value(set.rpe),
                  isComplete: Value(set.isComplete),
                  notes: Value(set.notes),
                  completedAt: Value(set.isComplete ? completedAt : null),
                ),
              );
        }

        final prSetId = await _updateWorkingWeightFromExercise(
          exerciseId: exercise.exerciseId,
          exerciseLogId: exerciseLogId,
          sets: exercise.sets,
          completedAt: completedAt,
        );
        if (prSetId != null) {
          prSetIds.add(prSetId);
        }
      }

      await (_database.update(
        _database.scheduledWorkouts,
      )..where((table) => table.id.equals(scheduledWorkout.id))).write(
        ScheduledWorkoutsCompanion(
          status: const Value('completed'),
          updatedAt: Value(completedAt),
        ),
      );

      for (final prSetId in prSetIds) {
        final exerciseLogId = prSetId.substring(
          0,
          prSetId.lastIndexOf('-set-'),
        );
        final exercise = exercises.firstWhere(
          (item) => '$sessionId-${item.exerciseId}' == exerciseLogId,
        );
        await _xpEvents.onPrAchieved(
          exerciseId: exercise.exerciseId,
          setLogId: prSetId,
          occurredAt: completedAt,
        );
      }
    });

    final workoutReward = await _xpEvents.onWorkoutCompleted(
      sessionId: sessionId,
      setCount: completedSetCount,
      occurredAt: completedAt,
    );
    return WorkoutCompletionResult(
      sessionId: sessionId,
      workoutReward: workoutReward,
      prCount: prSetIds.length,
    );
  }

  Future<String?> _updateWorkingWeightFromExercise({
    required String exerciseId,
    required String exerciseLogId,
    required List<CompletedSetInput> sets,
    required DateTime completedAt,
  }) async {
    CompletedSetInput? bestSet;
    for (final set in sets.where((set) => set.isComplete)) {
      if (set.weight == null || set.weight! <= 0) continue;
      if (bestSet == null || _setScore(set) > _setScore(bestSet)) {
        bestSet = set;
      }
    }
    if (bestSet == null) return null;

    final existing = await (_database.select(
      _database.workingWeights,
    )..where((table) => table.exerciseId.equals(exerciseId))).getSingleOrNull();
    if (existing?.isManualOverride ?? false) return null;

    final estimatedOneRepMax = _estimatedOneRepMax(
      bestSet.weight,
      bestSet.reps,
    );
    final existingScore =
        existing?.estimatedOneRepMax ??
        existing?.weight ??
        double.negativeInfinity;
    if (existing != null && _setScore(bestSet) < existingScore) return null;

    final exercise = await (_database.select(
      _database.exercises,
    )..where((table) => table.id.equals(exerciseId))).getSingleOrNull();

    await _database
        .into(_database.workingWeights)
        .insertOnConflictUpdate(
          WorkingWeightsCompanion.insert(
            exerciseId: exerciseId,
            weight: bestSet.weight!,
            unit: Value(exercise?.defaultUnit ?? 'kg'),
            estimatedOneRepMax: Value(estimatedOneRepMax),
            sourceSetLogId: Value('$exerciseLogId-set-${bestSet.setNumber}'),
            isManualOverride: const Value(false),
            updatedAt: completedAt,
          ),
        );
    final bestSetLogId = '$exerciseLogId-set-${bestSet.setNumber}';
    if (existing == null) return null;
    return _setScore(bestSet) > existingScore ? bestSetLogId : null;
  }

  double _setScore(CompletedSetInput set) {
    return _estimatedOneRepMax(set.weight, set.reps) ?? set.weight ?? 0;
  }

  double? _estimatedOneRepMax(double? weight, int? reps) {
    if (weight == null || reps == null || weight <= 0 || reps <= 0) {
      return null;
    }
    return weight * (1 + reps / 30);
  }

  Future<int> _trainingStreakDays() async {
    final sessions = await (_database.select(
      _database.sessionLogs,
    )..orderBy([(table) => OrderingTerm.desc(table.startedAt)])).get();
    if (sessions.isEmpty) return 0;

    final days =
        sessions
            .map((session) {
              final date = session.startedAt;
              return DateTime(date.year, date.month, date.day);
            })
            .toSet()
            .toList()
          ..sort((a, b) => b.compareTo(a));

    var streak = 1;
    var cursor = days.first;
    for (final day in days.skip(1)) {
      final expectedPrevious = cursor.subtract(const Duration(days: 1));
      if (day == expectedPrevious) {
        streak++;
        cursor = day;
      } else {
        break;
      }
    }
    return streak;
  }
}

class SessionAnalyticsSnapshot {
  const SessionAnalyticsSnapshot({
    required this.weekStart,
    required this.weekEndExclusive,
    required this.weeklyWorkoutCount,
    required this.plannedWorkoutCount,
    required this.completedScheduledWorkoutCount,
    required this.weeklyVolumeKg,
    required this.adherence,
    required this.currentTrainingStreakDays,
  });

  final DateTime weekStart;
  final DateTime weekEndExclusive;
  final int weeklyWorkoutCount;
  final int plannedWorkoutCount;
  final int completedScheduledWorkoutCount;
  final double weeklyVolumeKg;
  final double adherence;
  final int currentTrainingStreakDays;
}

class WorkoutCompletionResult {
  const WorkoutCompletionResult({
    required this.sessionId,
    required this.workoutReward,
    required this.prCount,
  });

  final String sessionId;
  final RewardGrant workoutReward;
  final int prCount;
}

class SessionHistoryEntry {
  const SessionHistoryEntry({
    required this.session,
    required this.workoutName,
    required this.exercises,
  });

  final SessionLog session;
  final String workoutName;
  final List<SessionExerciseHistoryEntry> exercises;

  int get setCount =>
      exercises.fold(0, (count, exercise) => count + exercise.sets.length);
}

class SessionExerciseHistoryEntry {
  const SessionExerciseHistoryEntry({
    required this.exerciseLog,
    required this.exerciseName,
    required this.sets,
  });

  final ExerciseLog exerciseLog;
  final String exerciseName;
  final List<SetLog> sets;
}

class CompletedExerciseInput {
  const CompletedExerciseInput({
    required this.exerciseId,
    required this.sortOrder,
    required this.sets,
    this.notes,
  });

  final String exerciseId;
  final int sortOrder;
  final List<CompletedSetInput> sets;
  final String? notes;
}

class CompletedSetInput {
  const CompletedSetInput({
    required this.setNumber,
    required this.isComplete,
    this.reps,
    this.weight,
    this.rpe,
    this.notes,
  });

  final int setNumber;
  final bool isComplete;
  final int? reps;
  final double? weight;
  final double? rpe;
  final String? notes;
}
