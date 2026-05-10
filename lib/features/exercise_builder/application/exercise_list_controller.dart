import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';

final exerciseListProvider =
    AsyncNotifierProvider.autoDispose<ExerciseListController, List<Exercise>>(
      ExerciseListController.new,
    );

final customExerciseListProvider =
    AsyncNotifierProvider.autoDispose<
      CustomExerciseListController,
      List<Exercise>
    >(CustomExerciseListController.new);

class ExerciseListController extends AutoDisposeAsyncNotifier<List<Exercise>> {
  @override
  Future<List<Exercise>> build() {
    final repositories = AppRepositories(ref.watch(appDatabaseProvider));
    return repositories.exercises.listAll();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}

class CustomExerciseListController
    extends AutoDisposeAsyncNotifier<List<Exercise>> {
  @override
  Future<List<Exercise>> build() {
    final repositories = AppRepositories(ref.watch(appDatabaseProvider));
    return repositories.exercises.listCustom();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}
