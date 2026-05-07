import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/repositories/repositories.dart';

final achievementGalleryProvider = FutureProvider<List<AchievementStateView>>((
  ref,
) {
  final repositories = AppRepositories(ref.watch(appDatabaseProvider));
  return repositories.achievements.getAchievementStates();
});
