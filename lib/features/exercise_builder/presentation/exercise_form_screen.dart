import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/app_colors.dart';
import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';
import '../../../shared/presentation/design_system/design_system.dart';
import '../application/exercise_form_controller.dart';

class ExerciseFormScreen extends ConsumerStatefulWidget {
  const ExerciseFormScreen({this.exerciseId, super.key});

  static const routeName = 'exercise-form';
  static const routePath = '/library/exercises/form';

  final String? exerciseId;

  @override
  ConsumerState<ExerciseFormScreen> createState() => _ExerciseFormScreenState();
}

class _ExerciseFormScreenState extends ConsumerState<ExerciseFormScreen> {
  final _nameController = TextEditingController();
  final _primaryMusclesController = TextEditingController();
  final _notesController = TextEditingController();
  Exercise? _exercise;
  bool _isLoading = false;
  bool _isSaving = false;

  bool get _isEditMode => widget.exerciseId != null;
  bool get _canEdit => !_isEditMode || (_exercise?.isCustom ?? false);

  @override
  void initState() {
    super.initState();
    if (_isEditMode) {
      _loadExercise();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _primaryMusclesController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(exerciseFormProvider);

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
                    salutation: _isEditMode ? 'Edit Exercise' : 'New Exercise',
                    title: _isEditMode
                        ? (_exercise?.name ?? 'Exercise')
                        : 'Custom Builder',
                    trailing: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface2,
                        foregroundColor: AppColors.ink,
                        side: const BorderSide(color: AppColors.outline),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.close, size: 18),
                      tooltip: 'Close',
                    ),
                  ),
                  if (_isEditMode && !_canEdit)
                    const Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 18, 12),
                      child: QfCard(
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_outline,
                              color: AppColors.inkDim,
                              size: 18,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Seed exercises are locked. You can archive them from the library.',
                                style: TextStyle(color: AppColors.inkMute),
                              ),
                            ),
                          ],
                        ),
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
                            label: 'Exercise name',
                            enabled: _canEdit,
                            onChanged: ref
                                .read(exerciseFormProvider.notifier)
                                .setName,
                          ),
                          const SizedBox(height: 12),
                          _DropdownInput(
                            label: 'Category',
                            value: form.category,
                            items: exerciseCategories,
                            enabled: _canEdit,
                            onChanged: (value) => ref
                                .read(exerciseFormProvider.notifier)
                                .setCategory(value!),
                          ),
                          const SizedBox(height: 12),
                          _DropdownInput(
                            label: 'Equipment',
                            value: form.equipment,
                            items: exerciseEquipmentOptions,
                            enabled: _canEdit,
                            includeEmpty: true,
                            onChanged: (value) => ref
                                .read(exerciseFormProvider.notifier)
                                .setEquipment(value),
                          ),
                          const SizedBox(height: 12),
                          _TextInput(
                            controller: _primaryMusclesController,
                            label: 'Primary muscles',
                            enabled: _canEdit,
                            onChanged: ref
                                .read(exerciseFormProvider.notifier)
                                .setPrimaryMuscles,
                          ),
                          const SizedBox(height: 12),
                          _DropdownInput(
                            label: 'Movement pattern',
                            value: form.movementPattern,
                            items: exerciseMovementPatterns,
                            enabled: _canEdit,
                            includeEmpty: true,
                            onChanged: (value) => ref
                                .read(exerciseFormProvider.notifier)
                                .setMovementPattern(value),
                          ),
                          const SizedBox(height: 12),
                          _DropdownInput(
                            label: 'Default unit',
                            value: form.defaultUnit,
                            items: exerciseUnits,
                            enabled: _canEdit,
                            onChanged: (value) => ref
                                .read(exerciseFormProvider.notifier)
                                .setDefaultUnit(value!),
                          ),
                          const SizedBox(height: 8),
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            value: form.isBodyweight,
                            activeColor: AppColors.forest,
                            onChanged: _canEdit
                                ? ref
                                      .read(exerciseFormProvider.notifier)
                                      .setBodyweight
                                : null,
                            title: const Text(
                              'Bodyweight exercise',
                              style: TextStyle(color: AppColors.ink),
                            ),
                          ),
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            value: form.isUnilateral,
                            activeColor: AppColors.forest,
                            onChanged: _canEdit
                                ? ref
                                      .read(exerciseFormProvider.notifier)
                                      .setUnilateral
                                : null,
                            title: const Text(
                              'Unilateral',
                              style: TextStyle(color: AppColors.ink),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _TextInput(
                            controller: _notesController,
                            label: 'Notes',
                            enabled: _canEdit,
                            minLines: 3,
                            maxLines: 5,
                            onChanged: ref
                                .read(exerciseFormProvider.notifier)
                                .setNotes,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (_canEdit)
                          FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.forest,
                              foregroundColor: AppColors.bg,
                            ),
                            onPressed: _isSaving ? null : _save,
                            icon: _isSaving
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
                            onPressed: _archive,
                            icon: const Icon(Icons.archive_outlined),
                            label: const Text('Archive'),
                          ),
                        ],
                        if (_isEditMode && _canEdit) ...[
                          const SizedBox(height: 10),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.rose,
                            ),
                            onPressed: _delete,
                            icon: const Icon(Icons.delete_outline),
                            label: const Text('Delete'),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
      ),
    );
  }

  Future<void> _loadExercise() async {
    setState(() => _isLoading = true);
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final exercise = await repositories.exercises.getById(widget.exerciseId!);
    if (!mounted) return;
    if (exercise == null) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Exercise not found')));
      context.pop();
      return;
    }

    _exercise = exercise;
    ref.read(exerciseFormProvider.notifier).loadExercise(exercise);
    _nameController.text = exercise.name;
    _primaryMusclesController.text = exercise.primaryMuscles ?? '';
    _notesController.text = exercise.notes ?? '';
    setState(() => _isLoading = false);
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      final controller = ref.read(exerciseFormProvider.notifier);
      if (_isEditMode) {
        await controller.updateExercise(widget.exerciseId!);
      } else {
        await controller.createExercise();
      }
      if (!mounted) return;
      context.go('/library/exercises');
    } on Object catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _archive() async {
    final exercise = _exercise;
    if (exercise == null) return;
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final hasLogs = await repositories.exercises.hasLogs(exercise.id);
    if (!mounted) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Archive ${exercise.name}?'),
        content: Text(
          hasLogs
              ? 'This exercise has logged history. Archiving hides it from new library lists while keeping history intact.'
              : 'Archived exercises are hidden from the library.',
        ),
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

    await ref.read(exerciseFormProvider.notifier).archiveExercise(exercise.id);
    if (!mounted) return;
    context.go('/library/exercises');
  }

  Future<void> _delete() async {
    final exercise = _exercise;
    if (exercise == null) return;
    final repositories = AppRepositories(ref.read(appDatabaseProvider));
    final hasLogs = await repositories.exercises.hasLogs(exercise.id);
    if (!mounted) return;

    if (hasLogs) {
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Cannot delete exercise'),
          content: const Text(
            'This custom exercise has logs. Archive it to keep your history intact.',
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

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${exercise.name}?'),
        content: const Text('This permanently removes the custom exercise.'),
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

    await ref.read(exerciseFormProvider.notifier).deleteExercise(exercise.id);
    if (!mounted) return;
    context.go('/library/exercises');
  }
}

class _TextInput extends StatelessWidget {
  const _TextInput({
    required this.controller,
    required this.label,
    required this.enabled,
    required this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.ink),
      decoration: _inputDecoration(label),
    );
  }
}

class _DropdownInput extends StatelessWidget {
  const _DropdownInput({
    required this.label,
    required this.value,
    required this.items,
    required this.enabled,
    required this.onChanged,
    this.includeEmpty = false,
  });

  final String label;
  final String? value;
  final List<String> items;
  final bool enabled;
  final ValueChanged<String?> onChanged;
  final bool includeEmpty;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: [
        if (includeEmpty)
          const DropdownMenuItem<String>(
            value: null,
            child: Text('None'),
          ),
        for (final item in items)
          DropdownMenuItem<String>(value: item, child: Text(item)),
      ],
      onChanged: enabled ? onChanged : null,
      dropdownColor: AppColors.surface2,
      style: const TextStyle(color: AppColors.ink),
      decoration: _inputDecoration(label),
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
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.outlineSoft),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.forest),
    ),
  );
}
