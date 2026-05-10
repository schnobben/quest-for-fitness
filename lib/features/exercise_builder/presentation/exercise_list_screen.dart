import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../application/exercise_list_controller.dart';
import 'exercise_form_screen.dart';

enum ExerciseLibraryFilter { all, custom, seed }

class ExerciseListScreen extends ConsumerWidget {
  const ExerciseListScreen({super.key});

  static const routeName = 'exercise-list';
  static const routePath = '/library/exercises';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.forest,
        foregroundColor: AppColors.bg,
        onPressed: () => context.goNamed(ExerciseFormScreen.routeName),
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(child: ExerciseListContent(showHeader: true)),
    );
  }
}

class ExerciseListContent extends ConsumerStatefulWidget {
  const ExerciseListContent({this.showHeader = false, super.key});

  final bool showHeader;

  @override
  ConsumerState<ExerciseListContent> createState() {
    return _ExerciseListContentState();
  }
}

class _ExerciseListContentState extends ConsumerState<ExerciseListContent> {
  final _searchController = TextEditingController();
  ExerciseLibraryFilter _filter = ExerciseLibraryFilter.all;
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercisesAsync = ref.watch(exerciseListProvider);

    return exercisesAsync.when(
      data: (exercises) {
        final filtered = _filterExercises(exercises);
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            if (widget.showHeader)
              QfScreenHeader(
                salutation: 'Exercise Codex',
                title: 'Movement Library',
                trailing: _HeaderAddButton(
                  onPressed: () => context.goNamed(ExerciseFormScreen.routeName),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
              child: _SearchField(
                controller: _searchController,
                onChanged: (value) => setState(() => _query = value),
              ),
            ),
            SizedBox(
              height: 38,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                children: [
                  _FilterChip(
                    label: 'All',
                    selected: _filter == ExerciseLibraryFilter.all,
                    onSelected: () {
                      setState(() => _filter = ExerciseLibraryFilter.all);
                    },
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Custom',
                    selected: _filter == ExerciseLibraryFilter.custom,
                    onSelected: () {
                      setState(() => _filter = ExerciseLibraryFilter.custom);
                    },
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Seed',
                    selected: _filter == ExerciseLibraryFilter.seed,
                    onSelected: () {
                      setState(() => _filter = ExerciseLibraryFilter.seed);
                    },
                  ),
                ],
              ),
            ),
            QfSectionHeader(title: 'Exercises (${filtered.length})'),
            if (filtered.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: QfCard(
                  child: Text(
                    'No exercises match this search.',
                    style: TextStyle(color: AppColors.inkMute),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    for (final exercise in filtered) ...[
                      _ExerciseCard(
                        exercise: exercise,
                        onTap: exercise.isCustom
                            ? () => _editExercise(exercise.id)
                            : null,
                        onLongPress: () => _showActions(exercise),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
            const SizedBox(height: 88),
          ],
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
            'Exercises could not be loaded: $error',
            style: const TextStyle(color: AppColors.inkMute),
          ),
        ),
      ),
    );
  }

  List<Exercise> _filterExercises(List<Exercise> exercises) {
    final query = _query.trim().toLowerCase();
    return exercises.where((exercise) {
      final matchesFilter = switch (_filter) {
        ExerciseLibraryFilter.all => true,
        ExerciseLibraryFilter.custom => exercise.isCustom,
        ExerciseLibraryFilter.seed => !exercise.isCustom,
      };
      if (!matchesFilter) return false;
      if (query.isEmpty) return true;
      return exercise.name.toLowerCase().contains(query) ||
          exercise.category.toLowerCase().contains(query) ||
          (exercise.equipment?.toLowerCase().contains(query) ?? false) ||
          (exercise.primaryMuscles?.toLowerCase().contains(query) ?? false);
    }).toList();
  }

  void _editExercise(String exerciseId) {
    context.goNamed(
      ExerciseFormScreen.routeName,
      queryParameters: {'exerciseId': exerciseId},
    );
  }

  Future<void> _showActions(Exercise exercise) async {
    final action = await showModalBottomSheet<_ExerciseAction>(
      context: context,
      backgroundColor: AppColors.surface2,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (exercise.isCustom)
                  ListTile(
                    leading: const Icon(Icons.edit, color: AppColors.ink),
                    title: const Text(
                      'Edit',
                      style: TextStyle(color: AppColors.ink),
                    ),
                    onTap: () => Navigator.pop(context, _ExerciseAction.edit),
                  ),
                ListTile(
                  leading: const Icon(
                    Icons.archive_outlined,
                    color: AppColors.ink,
                  ),
                  title: const Text(
                    'Archive',
                    style: TextStyle(color: AppColors.ink),
                  ),
                  onTap: () => Navigator.pop(context, _ExerciseAction.archive),
                ),
              ],
            ),
          ),
        );
      },
    );
    if (!mounted || action == null) return;
    if (action == _ExerciseAction.edit) {
      _editExercise(exercise.id);
      return;
    }
    await _archiveExercise(exercise);
  }

  Future<void> _archiveExercise(Exercise exercise) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Archive ${exercise.name}?'),
        content: const Text('Archived exercises are hidden from the library.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Archive'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    await repositories.exercises.archiveExercise(exercise.id);
    ref.invalidate(exerciseListProvider);
    ref.invalidate(customExerciseListProvider);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('${exercise.name} archived')));
  }
}

class _HeaderAddButton extends StatelessWidget {
  const _HeaderAddButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: AppColors.surface2,
        foregroundColor: AppColors.ink,
        side: const BorderSide(color: AppColors.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.add, size: 18),
      tooltip: 'Create exercise',
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.ink),
      decoration: InputDecoration(
        hintText: 'Search exercises',
        hintStyle: const TextStyle(color: AppColors.inkDim),
        prefixIcon: const Icon(Icons.search, color: AppColors.inkDim),
        filled: true,
        fillColor: AppColors.surface2,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.outlineSoft),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.forest),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onSelected(),
      selectedColor: AppColors.surface3,
      backgroundColor: Colors.transparent,
      labelStyle: TextStyle(
        color: selected ? AppColors.ink : AppColors.inkDim,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      side: BorderSide(
        color: selected ? AppColors.outline : AppColors.outlineSoft,
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  const _ExerciseCard({
    required this.exercise,
    required this.onTap,
    required this.onLongPress,
  });

  final Exercise exercise;
  final VoidCallback? onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: QfCard(
        variant: QfCardVariant.raised,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          exercise.name,
                          style: const TextStyle(
                            color: AppColors.ink,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (!exercise.isCustom)
                        const Icon(
                          Icons.lock_outline,
                          size: 16,
                          color: AppColors.inkDim,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      QfPill(
                        tone: QfPillTone.forest,
                        child: Text(exercise.category),
                      ),
                      if (exercise.equipment != null)
                        Text(
                          exercise.equipment!,
                          style: const TextStyle(
                            color: AppColors.inkMute,
                            fontSize: 12,
                          ),
                        ),
                      if (exercise.isBodyweight)
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.accessibility_new,
                              color: AppColors.sky,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Bodyweight',
                              style: TextStyle(
                                color: AppColors.inkMute,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              exercise.isCustom ? Icons.more_horiz : Icons.archive_outlined,
              color: AppColors.inkDim,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

enum _ExerciseAction { edit, archive }
