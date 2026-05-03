import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/data_providers.dart';
import '../../../data/repositories/repositories.dart';

final sessionHistoryProvider =
    FutureProvider.autoDispose<List<SessionHistoryEntry>>((ref) {
      final repositories = AppRepositories(ref.watch(appDatabaseProvider));
      return repositories.sessions.getSessionHistory();
    });
