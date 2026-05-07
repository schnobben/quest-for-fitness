import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';
import 'xp_event_service.dart';

class CardioRepository {
  const CardioRepository(this._database, this._xpEvents);

  final AppDatabase _database;
  final XpEventService _xpEvents;

  Future<List<CardioLog>> getRecentRuns({int limit = 20}) {
    return (_database.select(_database.cardioLogs)
          ..where((table) => table.activityType.equals('run'))
          ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])
          ..limit(limit))
        .get();
  }

  Future<CardioLog> logRun({
    required DateTime loggedAt,
    required double distanceKm,
    required int durationMinutes,
    String? notes,
  }) async {
    final distanceMeters = distanceKm * 1000;
    final durationSeconds = durationMinutes * 60;
    final paceSecondsPerKm = durationSeconds / distanceKm;
    final now = DateTime.now();
    final id = 'run-${now.microsecondsSinceEpoch}';

    final companion = CardioLogsCompanion.insert(
      id: id,
      loggedAt: loggedAt,
      activityType: const Value('run'),
      distanceMeters: distanceMeters,
      durationSeconds: durationSeconds,
      paceSecondsPerKm: paceSecondsPerKm,
      notes: Value(notes),
      createdAt: now,
    );

    await _database.transaction(() async {
      await _database.into(_database.cardioLogs).insert(companion);
      final goalCompleted = await _updateFiveKmGoalIfRelevant(
        distanceMeters: distanceMeters,
        durationSeconds: durationSeconds,
        loggedAt: loggedAt,
      );
      await _xpEvents.onRunLogged(
        cardioLogId: id,
        distanceKm: distanceKm,
        occurredAt: loggedAt,
      );
      if (goalCompleted != null) {
        await _xpEvents.onGoalCompleted(
          goalId: goalCompleted.id,
          occurredAt: loggedAt,
        );
      }
    });

    return (_database.select(
      _database.cardioLogs,
    )..where((table) => table.id.equals(id))).getSingle();
  }

  Future<Goal?> _updateFiveKmGoalIfRelevant({
    required double distanceMeters,
    required int durationSeconds,
    required DateTime loggedAt,
  }) async {
    if (distanceMeters < 5000) return null;

    final fiveKmMinutes = (durationSeconds / distanceMeters) * 5000 / 60;
    final goal =
        await (_database.select(_database.goals)
              ..where((table) => table.linkedMetric.equals('cardio:5k_time')))
            .getSingleOrNull();
    if (goal == null) return null;
    if (goal.currentValue != null && fiveKmMinutes >= goal.currentValue!) {
      return null;
    }
    final wasComplete = _isGoalComplete(goal);

    await (_database.update(
      _database.goals,
    )..where((table) => table.id.equals(goal.id))).write(
      GoalsCompanion(
        currentValue: Value(fiveKmMinutes),
        updatedAt: Value(loggedAt),
      ),
    );
    final isComplete = _isGoalValueComplete(goal, fiveKmMinutes);
    return !wasComplete && isComplete ? goal : null;
  }

  bool _isGoalComplete(Goal goal) {
    final value = goal.currentValue;
    if (value == null) return false;
    return _isGoalValueComplete(goal, value);
  }

  bool _isGoalValueComplete(Goal goal, double value) {
    if (goal.direction == 'lower') return value <= goal.targetValue;
    return value >= goal.targetValue;
  }
}
