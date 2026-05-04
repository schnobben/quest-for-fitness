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

  testWidgets('Progress shows working weights and exercise history', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(430, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

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

    await tester.tap(find.text('Start Today\'s Quest'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('complete-session-button')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Progress').last);
    await tester.pumpAndSettle();

    expect(find.text('WORKING WEIGHTS'), findsOneWidget);
    expect(find.text('Conventional Deadlift'), findsOneWidget);
    expect(find.textContaining('e1RM'), findsWidgets);

    await tester.tap(
      find.byKey(const ValueKey('edit-working-weight-conventional-deadlift')),
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('working-weight-field')),
      '170',
    );
    await tester.tap(find.byKey(const Key('working-weight-save-button')));
    await tester.pumpAndSettle();

    final deadliftWorkingWeight =
        await (database.select(database.workingWeights)..where(
              (table) => table.exerciseId.equals('conventional-deadlift'),
            ))
            .getSingle();
    expect(deadliftWorkingWeight.weight, 170);
    expect(deadliftWorkingWeight.isManualOverride, isTrue);
    expect(find.text('170 kg'), findsOneWidget);

    await tester.tap(find.text('Conventional Deadlift'));
    await tester.pumpAndSettle();

    expect(find.text('SET HISTORY'), findsOneWidget);
    expect(find.text('BEST SET'), findsOneWidget);
    expect(find.textContaining('160 x 4'), findsWidgets);

    await _unmountApp(tester);
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

  testWidgets('can view and manually update seed goals from Progress', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(430, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

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

    expect(find.text('GOALS DASHBOARD'), findsOneWidget);
    expect(find.text('Bench Press 1RM'), findsOneWidget);
    expect(find.text('5 km Run Time'), findsOneWidget);
    expect(find.text('Weighted Pull-up'), findsOneWidget);
    expect(find.text('Bodyweight Pull-ups'), findsOneWidget);
    expect(find.text('Body Weight'), findsWidgets);
    expect(find.textContaining('Higher is better'), findsWidgets);
    expect(find.textContaining('Lower is better'), findsWidgets);
    expect(find.text('Sep 30, 2026'), findsWidgets);

    await tester.drag(find.byType(ListView), const Offset(0, -650));
    await tester.pumpAndSettle();

    await tester.tap(
      find.byKey(const ValueKey('edit-goal-goal-weighted-pullup-60kg')),
    );
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(const Key('goal-current-value-field')),
      '35',
    );
    await tester.tap(find.byKey(const Key('goal-current-value-save-button')));
    await tester.pumpAndSettle();

    expect(find.text('Weighted Pull-up updated'), findsOneWidget);
    expect(find.text('35 kg'), findsWidgets);

    final weightedPullUp =
        await (database.select(database.goals)
              ..where((table) => table.id.equals('goal-weighted-pullup-60kg')))
            .getSingle();

    expect(weightedPullUp.currentValue, 35);
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
