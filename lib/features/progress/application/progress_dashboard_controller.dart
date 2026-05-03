import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';

final progressDashboardProvider =
    FutureProvider.autoDispose<ProgressDashboardData>((ref) async {
      final repositories = AppRepositories(ref.watch(appDatabaseProvider));
      final history = await repositories.bodyweight.getHistory();
      final goals = await repositories.goals.getActiveGoals();

      return ProgressDashboardData(
        bodyweightHistory: history,
        bodyweightGoal: goals
            .where((goal) => goal.linkedMetric == 'bodyweight')
            .firstOrNull,
      );
    });

class ProgressDashboardData {
  const ProgressDashboardData({
    required this.bodyweightHistory,
    required this.bodyweightGoal,
  });

  final List<BodyweightLog> bodyweightHistory;
  final Goal? bodyweightGoal;

  BodyweightLog? get latestBodyweight =>
      bodyweightHistory.isEmpty ? null : bodyweightHistory.first;

  List<BodyweightLog> get chronologicalBodyweightHistory =>
      bodyweightHistory.reversed.toList();
}
