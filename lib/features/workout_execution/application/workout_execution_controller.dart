import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';

final workoutExecutionProvider =
    FutureProvider.family<WorkoutExecutionPlan, String>((
      ref,
      scheduledWorkoutId,
    ) async {
      final database = ref.watch(appDatabaseProvider);
      final repositories = AppRepositories(database);
      final scheduledWorkout =
          await (database.select(database.scheduledWorkouts)
                ..where((table) => table.id.equals(scheduledWorkoutId))
                ..limit(1))
              .getSingle();
      final workoutTemplate = await repositories.workouts.getTemplate(
        scheduledWorkout.workoutTemplateId,
      );
      if (workoutTemplate == null) {
        throw StateError(
          'Workout template not found: ${scheduledWorkout.workoutTemplateId}',
        );
      }
      final targets = await repositories.workouts.getExerciseTargets(
        workoutTemplate.id,
      );

      return WorkoutExecutionPlan(
        scheduledWorkout: scheduledWorkout,
        workoutTemplate: workoutTemplate,
        targets: targets,
      );
    });

class WorkoutExecutionPlan {
  const WorkoutExecutionPlan({
    required this.scheduledWorkout,
    required this.workoutTemplate,
    required this.targets,
  });

  final ScheduledWorkout scheduledWorkout;
  final WorkoutTemplate workoutTemplate;
  final List<WorkoutExerciseTarget> targets;
}
