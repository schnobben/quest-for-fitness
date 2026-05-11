import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_theme.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../application/workout_form_controller.dart';
import '../application/workout_list_controller.dart';

class WorkoutFormScreen extends ConsumerStatefulWidget {
  const WorkoutFormScreen({this.workoutId, super.key});

  static const routeName = 'workout-form';
  static const routePath = '/library/workouts/form';

  final String? workoutId;

  @override
  ConsumerState<WorkoutFormScreen> createState() => _WorkoutFormScreenState();
}

class _WorkoutFormScreenState extends ConsumerState<WorkoutFormScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  WorkoutTemplate? _template;
  bool _isLoading = false;

  bool get _isEditMode => widget.workoutId != null;

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      _loadWorkout();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(workoutFormProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.forest),
              )
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  QfScreenHeader(
                    salutation: _isEditMode ? 'Edit Workout' : 'New Workout',
                    title: form.name.trim().isEmpty
                        ? 'Workout Builder'
                        : form.name.trim(),
                    trailing: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface2,
                        foregroundColor: AppColors.ink,
                        side: const BorderSide(color: AppColors.outline),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => context.go('/library/workouts'),
                      icon: const Icon(Icons.close, size: 18),
                      tooltip: 'Close',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: QfCard(
                      variant: QfCardVariant.raised,
                      child: Column(
                        children: [
                          _TextInput(
                            controller: _nameController,
                            label: 'Workout name',
                            onChanged: ref
                                .read(workoutFormProvider.notifier)
                                .setName,
                          ),
                          const SizedBox(height: 12),
                          _TextInput(
                            controller: _descriptionController,
                            label: 'Description',
                            minLines: 2,
                            maxLines: 4,
                            onChanged: ref
                                .read(workoutFormProvider.notifier)
                                .setDescription,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'EXERCISES (${form.exercises.length})',
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.inkMute,
                              letterSpacing: 0.1 * 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: _openExercisePicker,
                          icon: const Icon(Icons.add),
                          label: const Text('Add Exercise'),
                        ),
                      ],
                    ),
                  ),
                  if (form.exercises.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: QfCard(
                        child: Text(
                          'Add exercises to build this workout.',
                          style: TextStyle(color: AppColors.inkMute),
                        ),
                      ),
                    )
                  else
                    ReorderableListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      itemCount: form.exercises.length,
                      onReorder: ref
                          .read(workoutFormProvider.notifier)
                          .reorder,
                      itemBuilder: (context, index) {
                        final target = form.exercises[index];
                        return Padding(
                          key: ValueKey(target.templateExercise.id),
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _ExerciseTargetCard(
                            index: index,
                            target: target,
                            onRemove: () => ref
                                .read(workoutFormProvider.notifier)
                                .removeExercise(index),
                            onChanged:
                                ({
                                  int? sets,
                                  String? reps,
                                  double? weight,
                                  double? rpe,
                                }) {
                                  ref
                                      .read(workoutFormProvider.notifier)
                                      .updateTarget(
                                        index,
                                        sets: sets,
                                        reps: reps,
                                        weight: weight,
                                        rpe: rpe,
                                      );
                                },
                          ),
                        );
                      },
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.forest,
                            foregroundColor: AppColors.bg,
                          ),
                          onPressed: form.isSaving ? null : _save,
                          icon: form.isSaving
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.save_outlined),
                          label: const Text('Save'),
                        ),
                        if (_isEditMode) ...[
                          const SizedBox(height: 10),
                          OutlinedButton.icon(
                            onPressed: _duplicate,
                            icon: const Icon(Icons.copy_outlined),
                            label: const Text('Duplicate'),
                          ),
                          const SizedBox(height: 10),
                          OutlinedButton.icon(
                            onPressed: _archive,
                            icon: const Icon(Icons.archive_outlined),
                            label: const Text('Archive'),
                          ),
                        ],
                        if (_isEditMode && !(_template?.isSeedContent ?? true))
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.rose,
                              ),
                              onPressed: _delete,
                              icon: const Icon(Icons.delete_outline),
                              label: const Text('Delete'),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
      ),
    );
  }

  Future<void> _loadWorkout() async {
    setState(() => _isLoading = true);
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final template = await repositories.workouts.getTemplate(widget.workoutId!);
    if (!mounted) return;
    if (template == null) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Workout not found')));
      context.go('/library/workouts');
      return;
    }
    final targets = await repositories.workouts.getExerciseTargets(template.id);
    if (!mounted) return;
    _template = template;
    ref.read(workoutFormProvider.notifier).loadTemplate(template, targets);
    _nameController.text = template.name;
    _descriptionController.text = template.description ?? '';
    setState(() => _isLoading = false);
  }

  Future<void> _save() async {
    try {
      final controller = ref.read(workoutFormProvider.notifier);
      if (_isEditMode) {
        await controller.updateWorkout(widget.workoutId!);
      } else {
        await controller.createWorkout();
      }
      if (!mounted) return;
      context.go('/library/workouts');
    } on Object catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  Future<void> _duplicate() async {
    final id = widget.workoutId;
    if (id == null) return;
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final newId = await repositories.workouts.duplicateTemplate(id);
    ref.invalidate(workoutListProvider);
    if (!mounted) return;
    context.goNamed(
      WorkoutFormScreen.routeName,
      queryParameters: {'workoutId': newId},
    );
  }

  Future<void> _archive() async {
    final id = widget.workoutId;
    if (id == null) return;
    await ref.read(workoutListProvider.notifier).archive(id);
    if (!mounted) return;
    context.go('/library/workouts');
  }

  Future<void> _delete() async {
    final template = _template;
    if (template == null) return;
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    if (await repositories.workouts.hasSessionLogs(template.id)) {
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Cannot delete workout'),
          content: const Text(
            'This workout has logged sessions. Archive it to keep history intact.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    if (!mounted) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${template.name}?'),
        content: const Text('This permanently removes the workout template.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(workoutListProvider.notifier).delete(template.id);
    if (!mounted) return;
    context.go('/library/workouts');
  }

  Future<void> _openExercisePicker() async {
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final exercises = await repositories.exercises.listAll();
    if (!mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface2,
      builder: (context) => _ExercisePickerSheet(exercises: exercises),
    );
  }
}

class _ExerciseTargetCard extends StatelessWidget {
  const _ExerciseTargetCard({
    required this.index,
    required this.target,
    required this.onRemove,
    required this.onChanged,
  });

  final int index;
  final WorkoutExerciseTarget target;
  final VoidCallback onRemove;
  final void Function({int? sets, String? reps, double? weight, double? rpe})
  onChanged;

  @override
  Widget build(BuildContext context) {
    final templateExercise = target.templateExercise;
    return QfCard(
      variant: QfCardVariant.raised,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      target.exercise.name,
                      style: const TextStyle(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      target.exercise.category,
                      style: const TextStyle(
                        color: AppColors.inkDim,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.close, size: 18),
                tooltip: 'Remove',
              ),
              ReorderableDragStartListener(
                index: index,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.drag_handle, color: AppColors.inkDim),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _CompactInput(
                label: 'Sets',
                initialValue: templateExercise.targetSets?.toString() ?? '',
                keyboardType: TextInputType.number,
                onChanged: (value) => onChanged(
                  sets: int.tryParse(value.trim()),
                  reps: templateExercise.targetReps,
                  weight: templateExercise.targetWeight,
                  rpe: templateExercise.targetRpe,
                ),
              ),
              _CompactInput(
                label: 'Reps',
                initialValue: templateExercise.targetReps ?? '',
                onChanged: (value) => onChanged(
                  sets: templateExercise.targetSets,
                  reps: value,
                  weight: templateExercise.targetWeight,
                  rpe: templateExercise.targetRpe,
                ),
              ),
              _CompactInput(
                label: 'Weight',
                initialValue: templateExercise.targetWeight?.toString() ?? '',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (value) => onChanged(
                  sets: templateExercise.targetSets,
                  reps: templateExercise.targetReps,
                  weight: double.tryParse(value.trim()),
                  rpe: templateExercise.targetRpe,
                ),
              ),
              _CompactInput(
                label: 'RPE',
                initialValue: templateExercise.targetRpe?.toString() ?? '',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (value) => onChanged(
                  sets: templateExercise.targetSets,
                  reps: templateExercise.targetReps,
                  weight: templateExercise.targetWeight,
                  rpe: double.tryParse(value.trim()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExercisePickerSheet extends ConsumerStatefulWidget {
  const _ExercisePickerSheet({required this.exercises});

  final List<Exercise> exercises;

  @override
  ConsumerState<_ExercisePickerSheet> createState() {
    return _ExercisePickerSheetState();
  }
}

class _ExercisePickerSheetState extends ConsumerState<_ExercisePickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIds = ref
        .watch(workoutFormProvider)
        .exercises
        .map((target) => target.exercise.id)
        .toSet();
    final query = _query.trim().toLowerCase();
    final filtered = widget.exercises.where((exercise) {
      if (query.isEmpty) return true;
      return exercise.name.toLowerCase().contains(query) ||
          exercise.category.toLowerCase().contains(query) ||
          (exercise.equipment?.toLowerCase().contains(query) ?? false);
    }).toList();

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.78,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _query = value),
                style: const TextStyle(color: AppColors.ink),
                decoration: _inputDecoration('Search exercises').copyWith(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.inkDim,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final exercise = filtered[index];
                  final selected = selectedIds.contains(exercise.id);
                  return ListTile(
                    title: Text(
                      exercise.name,
                      style: const TextStyle(color: AppColors.ink),
                    ),
                    subtitle: Text(
                      exercise.category,
                      style: const TextStyle(color: AppColors.inkDim),
                    ),
                    trailing: selected
                        ? const Icon(Icons.check, color: AppColors.forest)
                        : null,
                    onTap: () {
                      final notifier = ref.read(workoutFormProvider.notifier);
                      final current = ref.read(workoutFormProvider).exercises;
                      final existingIndex = current.indexWhere(
                        (target) => target.exercise.id == exercise.id,
                      );
                      if (existingIndex >= 0) {
                        notifier.removeExercise(existingIndex);
                      } else {
                        notifier.addExercise(exercise);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextInput extends StatelessWidget {
  const _TextInput({
    required this.controller,
    required this.label,
    required this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.ink),
      decoration: _inputDecoration(label),
    );
  }
}

class _CompactInput extends StatelessWidget {
  const _CompactInput({
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.keyboardType,
  });

  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: TextFormField(
        key: ValueKey('$label-$initialValue'),
        initialValue: initialValue,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: AppTheme.monoStyle(fontSize: 12, color: AppColors.ink),
        decoration: _inputDecoration(label).copyWith(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: AppColors.inkDim),
    filled: true,
    fillColor: AppColors.surface,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.outlineSoft),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.forest),
    ),
  );
}
