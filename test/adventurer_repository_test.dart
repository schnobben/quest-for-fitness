import 'package:flutter_test/flutter_test.dart';
import 'package:quest_for_fitness/data/local_database/local_database.dart';
import 'package:quest_for_fitness/data/repositories/repositories.dart';

void main() {
  group('AdventurerRepository', () {
    test(
      'grantXp: multi-level-up produces correct level and residual XP',
      () async {
        final database = AppDatabase.inMemory();
        addTearDown(database.close);

        final repo = AdventurerRepository(database);
        await repo.getOrCreatePrimary();

        // Grant 500 XP from level 1 (0 XP):
        //   level 1 → needs 100 → xp = 400, level = 2
        //   level 2 → needs 150 → xp = 250, level = 3
        //   level 3 → needs 200 → xp =  50, level = 4
        //   level 4 → needs 250 → 50 < 250, stop
        final result = await repo.grantXp(500);

        expect(result.level, 4);
        expect(result.xp, 50);
      },
    );

    test('grantXp: zero or negative amount is a no-op', () async {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);

      final repo = AdventurerRepository(database);
      await repo.getOrCreatePrimary();

      final before = await repo.grantXp(0);
      expect(before.level, 1);
      expect(before.xp, 0);
    });

    test('xpRequiredForLevel: scales correctly', () {
      final database = AppDatabase.inMemory();
      addTearDown(database.close);

      final repo = AdventurerRepository(database);

      expect(repo.xpRequiredForLevel(1), 100);
      expect(repo.xpRequiredForLevel(2), 150);
      expect(repo.xpRequiredForLevel(3), 200);
      expect(repo.xpRequiredForLevel(10), 550);
    });
  });
}
