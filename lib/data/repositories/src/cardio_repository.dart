import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class CardioRepository {
  const CardioRepository(this._database);

  final AppDatabase _database;

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
      await _updateFiveKmGoalIfRelevant(
        distanceMeters: distanceMeters,
        durationSeconds: durationSeconds,
        loggedAt: loggedAt,
      );
    });

    return (_database.select(
      _database.cardioLogs,
    )..where((table) => table.id.equals(id))).getSingle();
  }

  Future<void> _updateFiveKmGoalIfRelevant({
    required double distanceMeters,
    required int durationSeconds,
    required DateTime loggedAt,
  }) async {
    if (distanceMeters < 5000) return;

    final fiveKmMinutes = (durationSeconds / distanceMeters) * 5000 / 60;
    final goal =
        await (_database.select(_database.goals)
              ..where((table) => table.linkedMetric.equals('cardio:5k_time')))
            .getSingleOrNull();
    if (goal == null) return;
    if (goal.currentValue != null && fiveKmMinutes >= goal.currentValue!) {
      return;
    }

    await (_database.update(
      _database.goals,
    )..where((table) => table.id.equals(goal.id))).write(
      GoalsCompanion(
        currentValue: Value(fiveKmMinutes),
        updatedAt: Value(loggedAt),
      ),
    );
  }
}
