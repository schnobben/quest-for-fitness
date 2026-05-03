import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'local_database/local_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);

  return database;
});
