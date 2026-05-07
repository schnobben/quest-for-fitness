import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../today/application/today_dashboard_controller.dart';

final progressDashboardProvider =
    FutureProvider.autoDispose<ProgressDashboardData>((ref) async {
      final repositories = AppRepositories(ref.watch(appDatabaseProvider));
      final today = ref.watch(todayDateProvider);
      final history = await repositories.bodyweight.getHistory();
      final runs = await repositories.cardio.getRecentRuns();
      final goals = await repositories.goals.getActiveGoals();
      final workingWeights = await repositories.exercises
          .getWorkingWeightSummaries();
      final progressionSuggestions = await repositories.exercises
          .getProgressionSuggestions();
      final analytics = await repositories.sessions.getAnalyticsSnapshot(today);

      return ProgressDashboardData(
        bodyweightHistory: history,
        recentRuns: runs,
        goals: goals,
        workingWeights: workingWeights,
        progressionSuggestions: progressionSuggestions,
        analytics: analytics,
        bodyweightGoal: goals
            .where((goal) => goal.linkedMetric == 'bodyweight')
            .firstOrNull,
      );
    });

class ProgressDashboardData {
  const ProgressDashboardData({
    required this.bodyweightHistory,
    required this.recentRuns,
    required this.goals,
    required this.workingWeights,
    required this.progressionSuggestions,
    required this.analytics,
    required this.bodyweightGoal,
  });

  final List<BodyweightLog> bodyweightHistory;
  final List<CardioLog> recentRuns;
  final List<Goal> goals;
  final List<WorkingWeightSummary> workingWeights;
  final List<ProgressionSuggestionView> progressionSuggestions;
  final SessionAnalyticsSnapshot analytics;
  final Goal? bodyweightGoal;

  BodyweightLog? get latestBodyweight =>
      bodyweightHistory.isEmpty ? null : bodyweightHistory.first;

  List<BodyweightLog> get chronologicalBodyweightHistory =>
      bodyweightHistory.reversed.toList();

  List<CardioLog> get chronologicalRuns => recentRuns.reversed.toList();

  CardioLog? get latestRun => recentRuns.isEmpty ? null : recentRuns.first;

  List<WorkingWeightSummary> get prHighlights {
    final highlights = workingWeights
        .where(
          (summary) =>
              summary.bestPerformance?.estimatedOneRepMax != null ||
              summary.bestPerformance?.weight != null,
        )
        .toList();
    highlights.sort((a, b) {
      final bValue =
          b.bestPerformance?.estimatedOneRepMax ??
          b.bestPerformance?.weight ??
          0;
      final aValue =
          a.bestPerformance?.estimatedOneRepMax ??
          a.bestPerformance?.weight ??
          0;
      return bValue.compareTo(aValue);
    });
    return highlights.take(3).toList();
  }
}
