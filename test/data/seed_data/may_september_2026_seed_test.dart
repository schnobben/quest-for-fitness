import 'package:flutter_test/flutter_test.dart';
import 'package:quest_for_fitness/data/local_database/local_database.dart';
import 'package:quest_for_fitness/data/repositories/repositories.dart';
import 'package:quest_for_fitness/data/seed_data/seed_data.dart';

void main() {
  test(
    'fresh install loads handover-backed May-September 2026 sample campaign',
    () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);

      final seedService = AppSeedDataService(database);
      final repositories = AppRepositories(database);

      await seedService.loadMaySeptember2026SeedCampaign(
        appliedAt: DateTime.utc(2026, 5, 3),
      );

      final activeCampaign = await repositories.campaigns.getActiveCampaign();
      expect(activeCampaign?.name, 'May-September 2026 Campaign');
      expect(activeCampaign?.isSeedContent, isTrue);
      expect(activeCampaign?.startDate, sameCalendarDate(2026, 5, 5));
      expect(activeCampaign?.endDate, sameCalendarDate(2026, 9, 30));

      final phases = await repositories.campaigns.getPhases(activeCampaign!.id);
      expect(phases.map((phase) => phase.name), [
        'The Foundation',
        'The Quest',
        'The Peak',
      ]);
      expect(phases.first.startDate, sameCalendarDate(2026, 5, 5));
      expect(phases.first.endDate, sameCalendarDate(2026, 6, 29));
      expect(phases[1].startDate, sameCalendarDate(2026, 7));
      expect(phases[1].endDate, sameCalendarDate(2026, 8, 31));
      expect(phases[2].startDate, sameCalendarDate(2026, 9));
      expect(phases[2].endDate, sameCalendarDate(2026, 9, 30));

      final templates = await repositories.workouts.getTemplates();
      expect(templates.map((template) => template.name), [
        'Day A - Upper Strength',
        'Day B - Lower Strength',
        'Day C - Upper Volume',
        'Day D - Lower Volume',
      ]);
      expect(templates.every((template) => template.isSeedContent), isTrue);

      final exercises = await repositories.exercises.watchableSnapshot();
      expect(exercises.length, greaterThanOrEqualTo(20));
      expect(
        exercises.map((exercise) => exercise.name),
        contains('Barbell Bench Press'),
      );
      expect(
        exercises.map((exercise) => exercise.name),
        contains('Barbell Back Squat'),
      );
      expect(
        exercises.map((exercise) => exercise.name),
        contains('Weighted Pull-up'),
      );
      expect(
        exercises.map((exercise) => exercise.name),
        contains('Nordic Curl'),
      );

      final goals = await repositories.goals.getActiveGoals();
      expect(goals, hasLength(5));
      expect(goals.map((goal) => goal.name), contains('Weighted Pull-up'));
      expect(goals.map((goal) => goal.name), contains('Body Weight'));
      expect(goals.every((goal) => goal.isSeedContent), isTrue);

      final bodyweight = await repositories.bodyweight.getLatest();
      expect(bodyweight?.weightKg, 92.5);
      expect(bodyweight?.isSeedExample, isTrue);
    },
  );

  test('seed import is idempotent', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);

    final seedService = AppSeedDataService(database);

    await seedService.loadMaySeptember2026SeedCampaign(
      appliedAt: DateTime.utc(2026, 5, 3),
    );
    await seedService.loadMaySeptember2026SeedCampaign(
      appliedAt: DateTime.utc(2026, 5, 4),
    );

    final campaignCount = await database.select(database.campaigns).get();
    final templateCount = await database
        .select(database.workoutTemplates)
        .get();
    final goalCount = await database.select(database.goals).get();
    final seedRuns = await database.select(database.seedRuns).get();

    expect(campaignCount, hasLength(1));
    expect(templateCount, hasLength(4));
    expect(goalCount, hasLength(5));
    expect(seedRuns, hasLength(1));
  });

  test('Today screen data can read active campaign and next workout', () async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);

    final seedService = AppSeedDataService(database);
    final repositories = AppRepositories(database);

    await seedService.loadMaySeptember2026SeedCampaign(
      appliedAt: DateTime.utc(2026, 5, 3),
    );

    final activeCampaign = await repositories.campaigns.getActiveCampaign();
    final upcoming = await repositories.campaigns.getUpcomingScheduledWorkouts(
      from: DateTime.utc(2026, 5, 5),
      limit: 1,
    );

    expect(activeCampaign?.name, 'May-September 2026 Campaign');
    expect(upcoming.single.workoutTemplateId, 'day-b');
    expect(upcoming.single.scheduledFor, sameCalendarDate(2026, 5, 5));
  });
}

Matcher sameCalendarDate(int year, int month, [int day = 1]) {
  return predicate<DateTime>(
    (value) => value.year == year && value.month == month && value.day == day,
    'same calendar date as $year-$month-$day',
  );
}
