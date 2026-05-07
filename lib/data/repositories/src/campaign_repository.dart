import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class CampaignRepository {
  const CampaignRepository(this._database);

  final AppDatabase _database;

  Future<Campaign?> getActiveCampaign() {
    return (_database.select(_database.campaigns)
          ..where((table) => table.isActive.equals(true))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<CampaignPhase>> getPhases(String campaignId) {
    return (_database.select(_database.campaignPhases)
          ..where((table) => table.campaignId.equals(campaignId))
          ..orderBy([(table) => OrderingTerm.asc(table.phaseOrder)]))
        .get();
  }

  Future<CampaignPhase?> getPhaseForDate({
    required String campaignId,
    required DateTime date,
  }) async {
    final phases = await getPhases(campaignId);

    for (final phase in phases) {
      if (!_isBeforeCalendarDate(date, phase.startDate) &&
          !_isAfterCalendarDate(date, phase.endDate)) {
        return phase;
      }
    }

    return null;
  }

  Future<ScheduledWorkout?> getScheduledWorkoutForDate(DateTime date) async {
    final start = DateTime(
      date.year,
      date.month,
      date.day,
    ).subtract(const Duration(days: 1));
    final end = start.add(const Duration(days: 3));
    final candidates =
        await (_database.select(_database.scheduledWorkouts)
              ..where(
                (table) =>
                    table.scheduledFor.isBiggerOrEqualValue(start) &
                    table.scheduledFor.isSmallerThanValue(end),
              )
              ..orderBy([(table) => OrderingTerm.asc(table.scheduledFor)]))
            .get();

    return candidates
        .where((workout) => _isSameCalendarDate(workout.scheduledFor, date))
        .firstOrNull;
  }

  Future<List<ScheduledWorkout>> getUpcomingScheduledWorkouts({
    required DateTime from,
    int limit = 10,
  }) {
    return (_database.select(_database.scheduledWorkouts)
          ..where((table) => table.scheduledFor.isBiggerOrEqualValue(from))
          ..orderBy([(table) => OrderingTerm.asc(table.scheduledFor)])
          ..limit(limit))
        .get();
  }

  Future<ScheduledWorkout?> getNextPlannedWorkout(DateTime from) {
    final start = DateTime(from.year, from.month, from.day);

    return (_database.select(_database.scheduledWorkouts)
          ..where(
            (table) =>
                table.scheduledFor.isBiggerOrEqualValue(start) &
                table.status.equals('planned'),
          )
          ..orderBy([(table) => OrderingTerm.asc(table.scheduledFor)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<ScheduledWorkout>> getScheduledWorkoutsBetween({
    required DateTime start,
    required DateTime end,
  }) {
    return (_database.select(_database.scheduledWorkouts)
          ..where(
            (table) =>
                table.scheduledFor.isBiggerOrEqualValue(start) &
                table.scheduledFor.isSmallerThanValue(end),
          )
          ..orderBy([(table) => OrderingTerm.asc(table.scheduledFor)]))
        .get();
  }
}

bool _isBeforeCalendarDate(DateTime value, DateTime other) {
  return DateTime(
    value.year,
    value.month,
    value.day,
  ).isBefore(DateTime(other.year, other.month, other.day));
}

bool _isAfterCalendarDate(DateTime value, DateTime other) {
  return DateTime(
    value.year,
    value.month,
    value.day,
  ).isAfter(DateTime(other.year, other.month, other.day));
}

bool _isSameCalendarDate(DateTime value, DateTime other) {
  return value.year == other.year &&
      value.month == other.month &&
      value.day == other.day;
}
