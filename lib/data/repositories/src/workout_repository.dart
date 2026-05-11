import 'package:drift/drift.dart';

import '../../../core/ids/ids.dart';
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

  Future<void> upsertExerciseTarget(
    WorkoutTemplateExercisesCompanion target,
  ) {
    return _database
        .into(_database.workoutTemplateExercises)
        .insertOnConflictUpdate(target);
  }

  Future<void> deleteExerciseTarget(String id) {
    return (_database.delete(
      _database.workoutTemplateExercises,
    )..where((table) => table.id.equals(id))).go();
  }

  Future<void> deleteTemplate(String id) {
    return _database.transaction(() async {
      await (_database.delete(_database.workoutTemplateExercises)..where(
            (table) => table.workoutTemplateId.equals(id),
          ))
          .go();
      await (_database.delete(
        _database.workoutTemplates,
      )..where((table) => table.id.equals(id))).go();
    });
  }

  Future<void> archiveTemplate(String id) {
    return (_database.update(
      _database.workoutTemplates,
    )..where((table) => table.id.equals(id))).write(
      WorkoutTemplatesCompanion(
        isArchived: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<String> duplicateTemplate(String id) async {
    final template = await getTemplate(id);
    if (template == null) {
      throw StateError('Workout template not found.');
    }

    final idGenerator = UuidV4Generator();
    final now = DateTime.now();
    final newTemplateId = idGenerator.nextId();
    final targets = await getExerciseTargets(id);

    await _database.transaction(() async {
      await upsertTemplate(
        WorkoutTemplatesCompanion.insert(
          id: newTemplateId,
          name: '${template.name} (Copy)',
          description: Value(template.description),
          sourceCampaignId: Value(template.sourceCampaignId),
          isSeedContent: const Value(false),
          isArchived: const Value(false),
          createdAt: now,
          updatedAt: now,
        ),
      );

      for (final target in targets) {
        final templateExercise = target.templateExercise;
        await upsertExerciseTarget(
          WorkoutTemplateExercisesCompanion.insert(
            id: idGenerator.nextId(),
            workoutTemplateId: newTemplateId,
            exerciseId: templateExercise.exerciseId,
            sortOrder: templateExercise.sortOrder,
            targetSets: Value(templateExercise.targetSets),
            targetReps: Value(templateExercise.targetReps),
            targetWeight: Value(templateExercise.targetWeight),
            targetRpe: Value(templateExercise.targetRpe),
            restGuidance: Value(templateExercise.restGuidance),
            notes: Value(templateExercise.notes),
          ),
        );
      }
    });

    return newTemplateId;
  }

  Future<void> reorderExercises(
    String workoutTemplateId,
    List<String> orderedIds,
  ) {
    return _database.transaction(() async {
      for (var index = 0; index < orderedIds.length; index++) {
        await (_database.update(_database.workoutTemplateExercises)..where(
              (table) =>
                  table.workoutTemplateId.equals(workoutTemplateId) &
                  table.id.equals(orderedIds[index]),
            ))
            .write(WorkoutTemplateExercisesCompanion(sortOrder: Value(index)));
      }
    });
  }

  Future<bool> hasSessionLogs(String workoutTemplateId) async {
    final log =
        await (_database.select(_database.sessionLogs)
              ..where(
                (table) => table.workoutTemplateId.equals(workoutTemplateId),
              )
              ..limit(1))
            .getSingleOrNull();
    return log != null;
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
