import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/repositories/repositories.dart';
import 'adventurer_profile_controller.dart';

final equipmentInventoryProvider = FutureProvider<EquipmentInventoryView>((
  ref,
) async {
  final repositories = AppRepositories(ref.watch(appDatabaseProvider));
  return repositories.equipment.getInventoryView();
});

final equipmentControllerProvider = Provider<EquipmentController>(
  (ref) => EquipmentController(ref),
);

class EquipmentController {
  const EquipmentController(this._ref);

  final Ref _ref;

  Future<void> equip(String equipmentId) async {
    await AppRepositories(
      _ref.read(appDatabaseProvider),
    ).equipment.equip(equipmentId);
    _ref.invalidate(equipmentInventoryProvider);
  }

  Future<void> selectTitle(String titleId) async {
    await AppRepositories(
      _ref.read(appDatabaseProvider),
    ).equipment.selectTitle(titleId);
    _ref.invalidate(equipmentInventoryProvider);
    _ref.invalidate(adventurerProfileProvider);
  }
}
