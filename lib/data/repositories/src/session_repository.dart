import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class SessionRepository {
  const SessionRepository(this._database);

  final AppDatabase _database;

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

  Future<String> completePlannedWorkout({
    required ScheduledWorkout scheduledWorkout,
    required WorkoutTemplate workoutTemplate,
    required List<CompletedExerciseInput> exercises,
    required DateTime startedAt,
    required DateTime completedAt,
    String? notes,
  }) async {
    final sessionId = 'session-${scheduledWorkout.id}';
    final durationSeconds = completedAt.difference(startedAt).inSeconds;

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
      }

      await (_database.update(
        _database.scheduledWorkouts,
      )..where((table) => table.id.equals(scheduledWorkout.id))).write(
        ScheduledWorkoutsCompanion(
          status: const Value('completed'),
          updatedAt: Value(completedAt),
        ),
      );
    });

    return sessionId;
  }
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
