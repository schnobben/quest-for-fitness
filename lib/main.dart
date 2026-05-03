import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'data/data_providers.dart';
import 'data/local_database/local_database.dart';
import 'data/seed_data/seed_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  await AppSeedDataService(database).loadMaySeptember2026SeedCampaign();

  runApp(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(database)],
      child: const QuestForFitnessApp(),
    ),
  );
}
