import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/local_database/local_database.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../application/workout_list_controller.dart';
import 'workout_form_screen.dart';

class WorkoutListScreen extends ConsumerWidget {
  const WorkoutListScreen({super.key});

  static const routeName = 'workout-list';
  static const routePath = '/library/workouts';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.forest,
        foregroundColor: AppColors.bg,
        onPressed: () => context.goNamed(WorkoutFormScreen.routeName),
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            QfScreenHeader(salutation: 'Workout Codex', title: 'Templates'),
            Expanded(child: WorkoutListContent()),
          ],
        ),
      ),
    );
  }
}

class WorkoutListContent extends ConsumerWidget {
  const WorkoutListContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsAsync = ref.watch(workoutListProvider);

    return workoutsAsync.when(
      data: (templates) {
        if (templates.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: QfCard(
              child: Row(
                children: [
                  Icon(Icons.fitness_center, color: AppColors.inkDim),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'No workouts yet. Tap + to create your first.',
                      style: TextStyle(color: AppColors.inkMute),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 88),
          itemCount: templates.length,
          separatorBuilder: (_, _) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return _WorkoutCard(template: templates[index]);
          },
        );
      },
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: CircularProgressIndicator(color: AppColors.forest),
        ),
      ),
      error: (error, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Text(
            'Workouts could not be loaded: $error',
            style: const TextStyle(color: AppColors.inkMute),
          ),
        ),
      ),
    );
  }
}

class _WorkoutCard extends ConsumerWidget {
  const _WorkoutCard({required this.template});

  final WorkoutTemplate template;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _edit(context),
      child: QfCard(
        variant: QfCardVariant.raised,
        padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    template.name,
                    style: AppTheme.fantasyStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                  if ((template.description ?? '').trim().isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      template.description!,
                      style: const TextStyle(
                        color: AppColors.inkDim,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            PopupMenuButton<_WorkoutAction>(
              color: AppColors.surface2,
              icon: const Icon(Icons.more_horiz, color: AppColors.inkDim),
              onSelected: (action) => _handleAction(context, ref, action),
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: _WorkoutAction.edit,
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: _WorkoutAction.duplicate,
                  child: Text('Duplicate'),
                ),
                PopupMenuItem(
                  value: _WorkoutAction.archive,
                  child: Text('Archive'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleAction(
    BuildContext context,
    WidgetRef ref,
    _WorkoutAction action,
  ) {
    switch (action) {
      case _WorkoutAction.edit:
        _edit(context);
        return;
      case _WorkoutAction.duplicate:
        ref.read(workoutListProvider.notifier).duplicate(template.id);
        return;
      case _WorkoutAction.archive:
        ref.read(workoutListProvider.notifier).archive(template.id);
        return;
    }
  }

  void _edit(BuildContext context) {
    context.goNamed(
      WorkoutFormScreen.routeName,
      queryParameters: {'workoutId': template.id},
    );
  }
}

enum _WorkoutAction { edit, duplicate, archive }
