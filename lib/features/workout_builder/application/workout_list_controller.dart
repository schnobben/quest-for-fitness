import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';

final workoutListProvider =
    AsyncNotifierProvider.autoDispose<
      WorkoutListNotifier,
      List<WorkoutTemplate>
    >(WorkoutListNotifier.new);

class WorkoutListNotifier extends AsyncNotifier<List<WorkoutTemplate>> {
  @override
  Future<List<WorkoutTemplate>> build() async {
    final templates = await _repositories.workouts.getTemplates();
    return templates.where((template) => !template.isArchived).toList();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }

  Future<void> duplicate(String id) async {
    await _repositories.workouts.duplicateTemplate(id);
    await refresh();
  }

  Future<void> archive(String id) async {
    await _repositories.workouts.archiveTemplate(id);
    await refresh();
  }

  Future<void> delete(String id) async {
    await _repositories.workouts.deleteTemplate(id);
    await refresh();
  }

  AppRepositories get _repositories {
    return AppRepositories(ref.read(appDatabaseProvider));
  }
}
