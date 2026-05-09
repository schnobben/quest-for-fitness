import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/repositories/repositories.dart';

final petProvider = FutureProvider<PetView>((ref) async {
  return AppRepositories(ref.watch(appDatabaseProvider)).pet.getPetView();
});

final petControllerProvider = Provider<PetController>(
  (ref) => PetController(ref),
);

class PetController {
  const PetController(this._ref);

  final Ref _ref;

  AppRepositories _repos() =>
      AppRepositories(_ref.read(appDatabaseProvider));

  Future<void> feedTreat() async {
    await _repos().pet.feedTreat(DateTime.now());
    _ref.invalidate(petProvider);
  }

  Future<void> play() async {
    await _repos().pet.play(DateTime.now());
    _ref.invalidate(petProvider);
  }

  Future<void> rest() async {
    await _repos().pet.rest(DateTime.now());
    _ref.invalidate(petProvider);
  }
}
