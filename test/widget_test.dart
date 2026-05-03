import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:quest_for_fitness/app/app.dart';
import 'package:quest_for_fitness/data/data_providers.dart';
import 'package:quest_for_fitness/data/local_database/local_database.dart';
import 'package:quest_for_fitness/data/seed_data/seed_data.dart';
import 'package:quest_for_fitness/features/today/application/today_dashboard_controller.dart';

void main() {
  testWidgets('Today screen shows training day recommendation', (tester) async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          todayDateProvider.overrideWithValue(DateTime.utc(2026, 5, 5)),
        ],
        child: const QuestForFitnessApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Today'), findsWidgets);
    expect(find.text('May-September 2026 Campaign'), findsOneWidget);
    expect(find.text('The Foundation'), findsOneWidget);
    expect(find.text('Today\'s Quest'), findsOneWidget);
    expect(find.textContaining('Day B - Lower Strength'), findsOneWidget);
    expect(find.text('Start Today\'s Quest'), findsOneWidget);
    expect(find.text('Goal Snapshot'), findsOneWidget);

    for (final destination in _destinations) {
      await tester.tap(find.text(destination.label).last);
      await tester.pumpAndSettle();

      expect(find.text(destination.label), findsWidgets);
      expect(find.text(destination.placeholderText), findsOneWidget);
    }
  });

  testWidgets('can complete a planned workout from Today', (tester) async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          todayDateProvider.overrideWithValue(DateTime.utc(2026, 5, 5)),
        ],
        child: const QuestForFitnessApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Today').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Start Today\'s Quest'));
    await tester.pumpAndSettle();

    expect(find.text('Day B - Lower Strength'), findsOneWidget);
    expect(find.text('Conventional Deadlift'), findsOneWidget);
    expect(find.text('Complete Session'), findsOneWidget);

    await tester.tap(find.text('Complete Session'));
    await tester.pumpAndSettle();

    final sessions = await database.select(database.sessionLogs).get();
    final exerciseLogs = await database.select(database.exerciseLogs).get();
    final setLogs = await database.select(database.setLogs).get();

    expect(sessions, hasLength(1));
    expect(exerciseLogs, hasLength(5));
    expect(setLogs, isNotEmpty);
    expect(find.text('Session saved'), findsOneWidget);

    await tester.tap(find.text('Log').last);
    await tester.pumpAndSettle();

    expect(find.text('Day B - Lower Strength'), findsOneWidget);
    expect(find.textContaining('5 exercises'), findsOneWidget);
    expect(find.textContaining('sets'), findsOneWidget);

    await tester.tap(find.text('Day B - Lower Strength'));
    await tester.pumpAndSettle();

    expect(find.text('Conventional Deadlift'), findsOneWidget);
    expect(find.textContaining('Set 1:'), findsWidgets);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pumpAndSettle();
    expect(find.text('Delete session?'), findsOneWidget);

    await tester.tap(find.text('Delete').last);
    await tester.pumpAndSettle();

    expect(await database.select(database.sessionLogs).get(), isEmpty);
    expect(find.text('No sessions yet'), findsOneWidget);
  });

  testWidgets('Today screen handles rest days gracefully', (tester) async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          todayDateProvider.overrideWithValue(DateTime.utc(2026, 5, 6)),
        ],
        child: const QuestForFitnessApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Today').last);
    await tester.pumpAndSettle();

    expect(find.text('Rest Day'), findsOneWidget);
    expect(
      find.textContaining('Next up: Day C - Upper Volume'),
      findsOneWidget,
    );
    expect(find.text('Start Today\'s Quest'), findsNothing);
  });

  testWidgets('can log bodyweight from Progress', (tester) async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          todayDateProvider.overrideWithValue(DateTime.utc(2026, 5, 5)),
        ],
        child: const QuestForFitnessApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Progress').last);
    await tester.pumpAndSettle();

    expect(find.text('Quick Bodyweight'), findsOneWidget);
    expect(find.text('92.5 kg'), findsWidgets);
    expect(find.text('Bodyweight Trend'), findsOneWidget);
    expect(find.text('Body Weight'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '91.8');
    await tester.tap(find.widgetWithText(FilledButton, 'Log'));
    await tester.pumpAndSettle();

    expect(find.text('Bodyweight logged'), findsOneWidget);
    expect(find.text('91.8 kg'), findsWidgets);

    final latestBodyweight = await database
        .select(database.bodyweightLogs)
        .get()
        .then(
          (logs) =>
              logs.reduce((a, b) => a.loggedAt.isAfter(b.loggedAt) ? a : b),
        );
    final bodyweightGoal = await (database.select(
      database.goals,
    )..where((table) => table.linkedMetric.equals('bodyweight'))).getSingle();

    expect(latestBodyweight.weightKg, 91.8);
    expect(bodyweightGoal.currentValue, 91.8);
  });
}

const _destinations = [
  _DestinationCopy(label: 'Log', placeholderText: 'No sessions yet'),
  _DestinationCopy(label: 'Progress', placeholderText: 'Quick Bodyweight'),
  _DestinationCopy(
    label: 'Quest',
    placeholderText:
        'Adventurer, XP, achievements, pet, and expedition systems appear here.',
  ),
  _DestinationCopy(
    label: 'Library',
    placeholderText:
        'Exercises, workouts, programs, campaigns, and templates are managed here.',
  ),
  _DestinationCopy(
    label: 'Settings',
    placeholderText:
        'Profile, environment, export, and developer settings will be configured here.',
  ),
];

class _DestinationCopy {
  const _DestinationCopy({required this.label, required this.placeholderText});

  final String label;
  final String placeholderText;
}
