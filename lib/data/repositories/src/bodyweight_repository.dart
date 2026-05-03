import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class BodyweightRepository {
  const BodyweightRepository(this._database);

  final AppDatabase _database;

  Future<List<BodyweightLog>> getHistory() {
    return (_database.select(
      _database.bodyweightLogs,
    )..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])).get();
  }

  Future<BodyweightLog?> getLatest() {
    return (_database.select(_database.bodyweightLogs)
          ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> upsert(BodyweightLogsCompanion log) {
    return _database.into(_database.bodyweightLogs).insertOnConflictUpdate(log);
  }

  Future<String> logBodyweight({
    required double weightKg,
    required DateTime loggedAt,
    String? notes,
  }) async {
    final latest = await getLatest();
    final effectiveLoggedAt =
        latest != null && !loggedAt.isAfter(latest.loggedAt)
        ? latest.loggedAt.add(const Duration(seconds: 1))
        : loggedAt;
    final id = 'bodyweight-${effectiveLoggedAt.toUtc().microsecondsSinceEpoch}';

    await _database.transaction(() async {
      await _database
          .into(_database.bodyweightLogs)
          .insertOnConflictUpdate(
            BodyweightLogsCompanion.insert(
              id: id,
              loggedAt: effectiveLoggedAt,
              weightKg: weightKg,
              notes: Value(notes),
              isSeedExample: const Value(false),
              createdAt: DateTime.now(),
            ),
          );

      await (_database.update(
        _database.goals,
      )..where((table) => table.linkedMetric.equals('bodyweight'))).write(
        GoalsCompanion(
          currentValue: Value(weightKg),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });

    return id;
  }
}
