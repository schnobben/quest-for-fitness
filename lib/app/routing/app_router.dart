import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/library/presentation/library_screen.dart';
import '../../features/log/presentation/log_screen.dart';
import '../../features/progress/presentation/progress_screen.dart';
import '../../features/quest/presentation/quest_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/today/presentation/today_screen.dart';
import '../../features/workout_execution/presentation/workout_execution_screen.dart';
import '../shell/app_shell.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: TodayScreen.routePath,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          _shellBranch(
            path: TodayScreen.routePath,
            name: TodayScreen.routeName,
            child: const TodayScreen(),
            routes: [
              GoRoute(
                path: WorkoutExecutionScreen.routePath,
                name: WorkoutExecutionScreen.routeName,
                builder: (context, state) => WorkoutExecutionScreen(
                  scheduledWorkoutId:
                      state.pathParameters['scheduledWorkoutId']!,
                ),
              ),
            ],
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
