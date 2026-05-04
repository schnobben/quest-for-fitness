import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class GoalRepository {
  const GoalRepository(this._database);

  final AppDatabase _database;

  Future<List<Goal>> getActiveGoals() {
    return (_database.select(_database.goals)
          ..where((table) => table.isArchived.equals(false))
          ..orderBy([(table) => OrderingTerm.asc(table.targetDate)]))
        .get();
  }

  Future<void> upsert(GoalsCompanion goal) {
    return _database.into(_database.goals).insertOnConflictUpdate(goal);
  }

  Future<void> updateCurrentValue({
    required String goalId,
    required double currentValue,
  }) {
    return (_database.update(
      _database.goals,
    )..where((table) => table.id.equals(goalId))).write(
      GoalsCompanion(
        currentValue: Value(currentValue),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
