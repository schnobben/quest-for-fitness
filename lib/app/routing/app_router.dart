import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/exercise_builder/presentation/exercise_form_screen.dart';
import '../../features/exercise_builder/presentation/exercise_list_screen.dart';
import '../../features/library/presentation/library_screen.dart';
import '../../features/log/presentation/log_screen.dart';
import '../../features/progress/presentation/progress_screen.dart';
import '../../features/quest/presentation/quest_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/today/presentation/today_screen.dart';
import '../../features/workout_builder/presentation/workout_form_screen.dart';
import '../../features/workout_builder/presentation/workout_list_screen.dart';
import '../../features/workout_execution/presentation/workout_completion_screen.dart';
import '../../features/workout_execution/presentation/workout_execution_screen.dart';
import '../../data/repositories/repositories.dart';
import '../shell/app_shell.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: TodayScreen.routePath,
    routes: [
      GoRoute(
        path: WorkoutCompletionScreen.routePath,
        name: WorkoutCompletionScreen.routeName,
        builder: (context, state) => WorkoutCompletionScreen(
          result: state.extra is WorkoutCompletionResult
              ? state.extra! as WorkoutCompletionResult
              : null,
        ),
      ),
      GoRoute(
        path: '/${WorkoutExecutionScreen.routePath}',
        name: WorkoutExecutionScreen.routeName,
        builder: (context, state) => WorkoutExecutionScreen(
          scheduledWorkoutId: state.pathParameters['scheduledWorkoutId']!,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          _shellBranch(
            path: TodayScreen.routePath,
            name: TodayScreen.routeName,
            child: const TodayScreen(),
          ),
          _shellBranch(
            path: LogScreen.routePath,
            name: LogScreen.routeName,
            child: const LogScreen(),
          ),
          _shellBranch(
            path: ProgressScreen.routePath,
            name: ProgressScreen.routeName,
            child: const ProgressScreen(),
            routes: [
              GoRoute(
                path: ExerciseDetailScreen.routePath,
                name: ExerciseDetailScreen.routeName,
                builder: (context, state) => ExerciseDetailScreen(
                  exerciseId: state.pathParameters['exerciseId']!,
                ),
              ),
            ],
          ),
          _shellBranch(
            path: QuestScreen.routePath,
            name: QuestScreen.routeName,
            child: const QuestScreen(),
          ),
          _shellBranch(
            path: LibraryScreen.routePath,
            name: LibraryScreen.routeName,
            child: const LibraryScreen(),
            routes: [
              GoRoute(
                path: 'workouts',
                name: WorkoutListScreen.routeName,
                builder: (context, state) => const WorkoutListScreen(),
              ),
              GoRoute(
                path: 'workouts/form',
                name: WorkoutFormScreen.routeName,
                builder: (context, state) => WorkoutFormScreen(
                  workoutId: state.uri.queryParameters['workoutId'],
                ),
              ),
              GoRoute(
                path: 'exercises',
                name: ExerciseListScreen.routeName,
                builder: (context, state) => const ExerciseListScreen(),
              ),
              GoRoute(
                path: 'exercises/form',
                name: ExerciseFormScreen.routeName,
                builder: (context, state) => ExerciseFormScreen(
                  exerciseId: state.uri.queryParameters['exerciseId'],
                ),
              ),
            ],
          ),
          _shellBranch(
            path: SettingsScreen.routePath,
            name: SettingsScreen.routeName,
            child: const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}

final appRouter = createAppRouter();

StatefulShellBranch _shellBranch({
  required String path,
  required String name,
  required Widget child,
  List<RouteBase> routes = const [],
}) {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        path: path,
        name: name,
        builder: (context, state) => child,
        routes: routes,
      ),
    ],
  );
}
