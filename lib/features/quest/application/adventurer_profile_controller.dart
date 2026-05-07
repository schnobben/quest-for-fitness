import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/local_database/local_database.dart';
import '../../../data/repositories/repositories.dart';

final adventurerProfileProvider = FutureProvider<AdventurerProfile>((
  ref,
) async {
  final repositories = AppRepositories(ref.watch(appDatabaseProvider));
  final adventurer = await repositories.adventurer.getOrCreatePrimary();

  return AdventurerProfile(
    adventurer: adventurer,
    xpToNextLevel: repositories.adventurer.xpRequiredForLevel(adventurer.level),
  );
});

class AdventurerProfile {
  const AdventurerProfile({
    required this.adventurer,
    required this.xpToNextLevel,
  });

  final Adventurer adventurer;
  final int xpToNextLevel;

  double get xpProgress =>
      xpToNextLevel <= 0 ? 0 : adventurer.xp / xpToNextLevel;
}

// ─── XP controller ────────────────────────────────────────────────────────────

final adventurerXpControllerProvider = Provider<AdventurerXpController>(
  (ref) => AdventurerXpController(ref),
);

class AdventurerXpController {
  const AdventurerXpController(this._ref);

  final Ref _ref;

  Future<void> grantTestXp() async {
    await AppRepositories(
      _ref.read(appDatabaseProvider),
    ).xpEvents.onDebugXpGranted(xpAmount: 125);
    _ref.invalidate(adventurerProfileProvider);
  }
}
