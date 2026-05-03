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
    expect(
      find.textContaining('May-September 2026 starter sample campaign loaded'),
      findsOneWidget,
    );
    expect(find.text('The Foundation'), findsOneWidget);
    expect(find.textContaining('Day B - Lower Strength'), findsOneWidget);
    expect(find.text('Start Today\'s Quest'), findsOneWidget);

    for (final destination in _destinations) {
      await tester.tap(find.text(destination.label).last);
      await tester.pumpAndSettle();

      expect(find.text(destination.label), findsWidgets);
      expect(find.textContaining(destination.placeholderText), findsOneWidget);
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
    expect(find.text('Conventional Deadlift'), findsWidgets);
    expect(find.text('Complete Session'), findsOneWidget);

    await tester.tap(find.byKey(const Key('complete-session-button')));
    await tester.pumpAndSettle();

    final sessions = await database.select(database.sessionLogs).get();
    final exerciseLogs = await database.select(database.exerciseLogs).get();
    final setLogs = await database.select(database.setLogs).get();

    expect(sessions, hasLength(1));
    expect(exerciseLogs, hasLength(5));
    expect(setLogs, isNotEmpty);
    expect(find.text('Session saved'), findsOneWidget);

    expect(sessions.single.workoutTemplateId, isNotNull);

    await _unmountApp(tester);
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

    expect(find.textContaining('Day C - Upper Volume'), findsOneWidget);
    expect(find.text('Start Next Planned Quest'), findsOneWidget);
    expect(find.text('Start Today\'s Quest'), findsNothing);
  });

  testWidgets('fresh install can start next seed workout immediately', (
    tester,
  ) async {
    final database = AppDatabase.inMemory();
    addTearDown(database.close);
    await AppSeedDataService(
      database,
    ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          todayDateProvider.overrideWithValue(DateTime.utc(2026, 5, 3)),
        ],
        child: const QuestForFitnessApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Test First Seed Workout'), findsOneWidget);
    await tester.tap(find.text('Test First Seed Workout'));
    await tester.pumpAndSettle();

    expect(find.text('Day B - Lower Strength'), findsOneWidget);
    expect(find.text('Complete Session'), findsOneWidget);

    await tester.tap(find.byKey(const Key('complete-session-button')));
    await tester.pumpAndSettle();

    expect(await database.select(database.sessionLogs).get(), hasLength(1));

    await _unmountApp(tester);
  });

  testWidgets(
    'Log can start next planned workout and explains future actions',
    (tester) async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);
      await AppSeedDataService(
        database,
      ).loadMaySeptember2026SeedCampaign(appliedAt: DateTime.utc(2026, 5, 3));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWithValue(database),
            todayDateProvider.overrideWithValue(DateTime.utc(2026, 5, 3)),
          ],
          child: const QuestForFitnessApp(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Log').last);
      await tester.pumpAndSettle();

      expect(find.text('Start Next Plan'), findsOneWidget);
      expect(find.text('Sprint 2.4'), findsOneWidget);

      await tester.tap(find.text('Log Run'));
      await tester.pumpAndSettle();
      expect(
        find.text('Run logging is planned for Sprint 2.4.'),
        findsOneWidget,
      );

      await tester.tap(find.text('Start Next Plan'));
      await tester.pumpAndSettle();

      expect(find.text('Day B - Lower Strength'), findsOneWidget);
      expect(find.text('Complete Session'), findsOneWidget);

      await tester.tap(find.byKey(const Key('complete-session-button')));
      await tester.pumpAndSettle();

      expect(await database.select(database.sessionLogs).get(), hasLength(1));

      await _unmountApp(tester);
    },
  );

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

    expect(find.text('LOG BODYWEIGHT'), findsOneWidget);
    expect(find.text('92.5'), findsWidgets);
    expect(find.text('BODYWEIGHT'), findsOneWidget);
    expect(find.text('Body Weight'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '91.8');
    await tester.tap(find.byKey(const Key('bodyweight-log-button')));
    await tester.pumpAndSettle();

    expect(find.text('Bodyweight logged'), findsOneWidget);
    expect(find.text('91.8'), findsWidgets);

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
  _DestinationCopy(label: 'Progress', placeholderText: 'LOG BODYWEIGHT'),
  _DestinationCopy(label: 'Quest', placeholderText: 'Preview only.'),
  _DestinationCopy(label: 'Library', placeholderText: 'Sample codex content.'),
  _DestinationCopy(
    label: 'Settings',
    placeholderText: 'Coming later: profile, export, developer tools',
  ),
];

class _DestinationCopy {
  const _DestinationCopy({required this.label, required this.placeholderText});

  final String label;
  final String placeholderText;
}

Future<void> _unmountApp(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(seconds: 1));
}
