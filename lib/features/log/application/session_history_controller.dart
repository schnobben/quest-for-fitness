import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../today/application/today_dashboard_controller.dart';

final sessionHistoryProvider =
    FutureProvider.autoDispose<List<SessionHistoryEntry>>((ref) {
      final repositories = AppRepositories(ref.watch(appDatabaseProvider));
      return repositories.sessions.getSessionHistory();
    });

final recentRunsProvider = FutureProvider.autoDispose<List<CardioLog>>((ref) {
  final repositories = AppRepositories(ref.watch(appDatabaseProvider));
  return repositories.cardio.getRecentRuns();
});

final nextPlannedWorkoutProvider = FutureProvider.autoDispose((ref) {
  final repositories = AppRepositories(ref.watch(appDatabaseProvider));
  return repositories.campaigns.getNextPlannedWorkout(
    ref.watch(todayDateProvider),
  );
});
