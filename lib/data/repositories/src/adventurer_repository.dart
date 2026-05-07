import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';

class AdventurerRepository {
  const AdventurerRepository(this._database);

  static const defaultAdventurerId = 'primary-adventurer';

  final AppDatabase _database;

  Future<Adventurer> getOrCreatePrimary() async {
    final existing =
        await (_database.select(_database.adventurers)
              ..where((table) => table.id.equals(defaultAdventurerId)))
            .getSingleOrNull();
    if (existing != null) return existing;

    final now = DateTime.now();
    await _database
        .into(_database.adventurers)
        .insert(
          AdventurersCompanion.insert(
            id: defaultAdventurerId,
            name: 'Iron Ranger',
            selectedClass: 'Warrior',
            currentTitle: 'Novice Adventurer',
            might: const Value(12),
            endurance: const Value(11),
            discipline: const Value(13),
            vitality: const Value(10),
            agility: const Value(9),
            wisdom: const Value(10),
            createdAt: now,
            updatedAt: now,
          ),
        );

    return (_database.select(
      _database.adventurers,
    )..where((table) => table.id.equals(defaultAdventurerId))).getSingle();
  }

  Future<Adventurer> grantXp(int amount) async {
    if (amount <= 0) return getOrCreatePrimary();

    final adventurer = await getOrCreatePrimary();
    var level = adventurer.level;
    var xp = adventurer.xp + amount;

    while (xp >= xpRequiredForLevel(level)) {
      xp -= xpRequiredForLevel(level);
      level += 1;
    }

    await (_database.update(
      _database.adventurers,
    )..where((table) => table.id.equals(adventurer.id))).write(
      AdventurersCompanion(
        level: Value(level),
        xp: Value(xp),
        currentTitle: Value(_titleForLevel(level)),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return getOrCreatePrimary();
  }

  int xpRequiredForLevel(int level) => 100 + ((level - 1) * 50);

  String _titleForLevel(int level) {
    if (level >= 10) return 'Veteran Adventurer';
    if (level >= 5) return 'Iron Ranger';
    if (level >= 2) return 'Trail Initiate';
    return 'Novice Adventurer';
  }
}
