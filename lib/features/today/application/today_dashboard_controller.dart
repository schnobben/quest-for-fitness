import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';

final todayDateProvider = Provider<DateTime>((ref) => DateTime.now());

final todayDashboardProvider = FutureProvider<TodayDashboard>((ref) async {
  final today = ref.watch(todayDateProvider);
  final repositories = AppRepositories(ref.watch(appDatabaseProvider));

  final activeCampaign = await repositories.campaigns.getActiveCampaign();
  final currentPhase = activeCampaign == null
      ? null
      : await repositories.campaigns.getPhaseForDate(
          campaignId: activeCampaign.id,
          date: today,
        );
  final todayWorkout = await repositories.campaigns.getScheduledWorkoutForDate(
    today,
  );
  final nextWorkout =
      todayWorkout ??
      (await repositories.campaigns.getUpcomingScheduledWorkouts(
        from: _startOfDay(today),
        limit: 1,
      )).firstOrNull;
  final workoutTemplate = nextWorkout == null
      ? null
      : await repositories.workouts.getTemplate(nextWorkout.workoutTemplateId);
  final weeklyWorkouts = await repositories.campaigns
      .getScheduledWorkoutsBetween(
        start: _startOfWeek(today),
        end: _startOfWeek(today).add(const Duration(days: 7)),
      );
  final goals = await repositories.goals.getActiveGoals();

  return TodayDashboard(
    today: today,
    activeCampaign: activeCampaign,
    currentPhase: currentPhase,
    todayWorkout: todayWorkout,
    nextWorkout: nextWorkout,
    nextWorkoutTemplate: workoutTemplate,
    weeklyWorkouts: weeklyWorkouts,
    goals: goals,
  );
});

DateTime _startOfDay(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

DateTime _startOfWeek(DateTime date) {
  final day = _startOfDay(date);
  return day.subtract(Duration(days: day.weekday - DateTime.monday));
}

class TodayDashboard {
  const TodayDashboard({
    required this.today,
    required this.activeCampaign,
    required this.currentPhase,
    required this.todayWorkout,
    required this.nextWorkout,
    required this.nextWorkoutTemplate,
    required this.weeklyWorkouts,
    required this.goals,
  });

  final DateTime today;
  final Campaign? activeCampaign;
  final CampaignPhase? currentPhase;
  final ScheduledWorkout? todayWorkout;
  final ScheduledWorkout? nextWorkout;
  final WorkoutTemplate? nextWorkoutTemplate;
  final List<ScheduledWorkout> weeklyWorkouts;
  final List<Goal> goals;

  bool get isTrainingDay => todayWorkout != null;

  String get primaryTitle {
    if (nextWorkoutTemplate == null) {
      return 'No Active Quest';
    }

    return isTrainingDay ? 'Today\'s Quest' : 'Rest Day';
  }

  String get primaryDescription {
    final workoutName = nextWorkoutTemplate?.name;
    if (workoutName == null) {
      return 'No planned workout is currently scheduled.';
    }

    if (isTrainingDay) {
      return '$workoutName is planned for today.';
    }

    return 'No gym session today. Next up: $workoutName on ${_formatDate(nextWorkout!.scheduledFor)}.';
  }

  double get weeklyProgress {
    if (weeklyWorkouts.isEmpty) {
      return 0;
    }

    final completedOrDue = weeklyWorkouts.where((workout) {
      return !workout.scheduledFor.isAfter(today);
    }).length;

    return completedOrDue / weeklyWorkouts.length;
  }

  String get weeklySummary {
    if (weeklyWorkouts.isEmpty) {
      return 'No workouts scheduled this week.';
    }

    return '${weeklyWorkouts.length} workouts scheduled this week.';
  }

  List<Goal> get goalSnapshot => goals.take(3).toList();
}

String _formatDate(DateTime date) {
  const weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  return '${weekdays[date.weekday - 1]}, ${date.month}/${date.day}';
}
