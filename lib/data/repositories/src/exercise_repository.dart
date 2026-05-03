import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class ExerciseRepository {
  const ExerciseRepository(this._database);

  final AppDatabase _database;

  Future<List<Exercise>> watchableSnapshot() {
    return (_database.select(
      _database.exercises,
    )..orderBy([(table) => OrderingTerm.asc(table.name)])).get();
  }

  Future<void> upsert(ExercisesCompanion exercise) {
    return _database.into(_database.exercises).insertOnConflictUpdate(exercise);
  }
}
