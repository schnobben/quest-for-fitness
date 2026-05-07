import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';
import 'xp_event_service.dart';

class GoalRepository {
  const GoalRepository(this._database, this._xpEvents);

  final AppDatabase _database;
  final XpEventService _xpEvents;

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
  }) async {
    final now = DateTime.now();
    await _database.transaction(() async {
      final existing = await (_database.select(
        _database.goals,
      )..where((table) => table.id.equals(goalId))).getSingleOrNull();

      await (_database.update(
        _database.goals,
      )..where((table) => table.id.equals(goalId))).write(
        GoalsCompanion(
          currentValue: Value(currentValue),
          updatedAt: Value(now),
        ),
      );

      if (existing == null) return;
      await _xpEvents.onGoalUpdated(
        goalId: goalId,
        occurredAt: now,
        completed:
            !_isGoalComplete(existing) &&
            _isGoalValueComplete(existing, currentValue),
      );
    });
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
