import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class WorkoutRepository {
  const WorkoutRepository(this._database);

  final AppDatabase _database;

  Future<List<WorkoutTemplate>> getTemplates() {
    return (_database.select(
      _database.workoutTemplates,
    )..orderBy([(table) => OrderingTerm.asc(table.name)])).get();
  }

  Future<WorkoutTemplate?> getTemplate(String id) {
    return (_database.select(_database.workoutTemplates)
          ..where((table) => table.id.equals(id))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<WorkoutExerciseTarget>> getExerciseTargets(
    String workoutTemplateId,
  ) async {
    final templateExercises =
        await (_database.select(_database.workoutTemplateExercises)..where(
              (table) => table.workoutTemplateId.equals(workoutTemplateId),
            ))
            .get();
    templateExercises.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    final targets = <WorkoutExerciseTarget>[];
    for (final templateExercise in templateExercises) {
      final exercise =
          await (_database.select(_database.exercises)
                ..where((table) => table.id.equals(templateExercise.exerciseId))
                ..limit(1))
              .getSingle();
      targets.add(
        WorkoutExerciseTarget(
          templateExercise: templateExercise,
          exercise: exercise,
        ),
      );
    }

    return targets;
  }

  Future<void> upsertTemplate(WorkoutTemplatesCompanion template) {
    return _database
        .into(_database.workoutTemplates)
        .insertOnConflictUpdate(template);
  }
}

class WorkoutExerciseTarget {
  const WorkoutExerciseTarget({
    required this.templateExercise,
    required this.exercise,
  });

  final WorkoutTemplateExercise templateExercise;
  final Exercise exercise;
}
