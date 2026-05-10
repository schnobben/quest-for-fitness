import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Exercises,
    WorkoutTemplates,
    WorkoutTemplateExercises,
    ProgramTemplates,
    Campaigns,
    CampaignPhases,
    ScheduledWorkouts,
    SessionLogs,
    ExerciseLogs,
    SetLogs,
    WorkingWeights,
    CardioLogs,
    ProgressionSuggestions,
    Adventurers,
    FitnessEvents,
    RewardEvents,
    XpHistory,
    Achievements,
    AchievementStates,
    EquipmentDefinitions,
    EquipmentInventory,
    EquippedEquipment,
    TitleDefinitions,
    AdventurerTitles,
    BodyweightLogs,
    Goals,
    SeedRuns,
    Pets,
    PetEvolutionHistory,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  factory AppDatabase.inMemory() {
    return AppDatabase.forTesting(NativeDatabase.memory());
  }

  @override
  int get schemaVersion => 10;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (migrator) async {
        await migrator.createAll();
        await customStatement(
          'CREATE UNIQUE INDEX fitness_events_source_unique '
          'ON fitness_events (type, source_type, source_id)',
        );
      },
      onUpgrade: (migrator, from, to) async {
        if (from < 2) {
          await migrator.createTable(workingWeights);
        }
        if (from < 3) {
          await migrator.createTable(cardioLogs);
        }
        if (from < 4) {
          await migrator.createTable(progressionSuggestions);
        }
        if (from < 5) {
          await migrator.createTable(adventurers);
        }
        if (from < 6) {
          await migrator.createTable(fitnessEvents);
          await migrator.createTable(rewardEvents);
          await migrator.createTable(xpHistory);
        }
        if (from < 7) {
          await migrator.createTable(achievements);
          await migrator.createTable(achievementStates);
        }
        if (from < 8) {
          await migrator.createTable(equipmentDefinitions);
          await migrator.createTable(equipmentInventory);
          await migrator.createTable(equippedEquipment);
          await migrator.createTable(titleDefinitions);
          await migrator.createTable(adventurerTitles);
        }
        if (from < 9) {
          // Remove duplicate fitness events (same type+source) before indexing.
          // Keeps the earliest row (lowest rowid) for each non-null source.
          await customStatement(
            'DELETE FROM fitness_events '
            'WHERE rowid NOT IN ('
            '  SELECT MIN(rowid) FROM fitness_events '
            '  WHERE source_id IS NOT NULL '
            '  GROUP BY type, source_type, source_id'
            ') AND source_id IS NOT NULL',
          );
          await customStatement(
            'CREATE UNIQUE INDEX fitness_events_source_unique '
            'ON fitness_events (type, source_type, source_id)',
          );
        }
        if (from < 10) {
          await migrator.createTable(pets);
          await migrator.createTable(petEvolutionHistory);
        }
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final databaseFile = File(
      path.join(directory.path, 'quest_for_fitness.sqlite'),
    );

    return NativeDatabase.createInBackground(databaseFile);
  });
}

class Exercises extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get equipment => text().nullable()();
  TextColumn get primaryMuscles => text().nullable()();
  TextColumn get movementPattern => text().nullable()();
  TextColumn get defaultUnit => text().withDefault(const Constant('kg'))();
  BoolColumn get isBodyweight => boolean().withDefault(const Constant(false))();
  BoolColumn get isUnilateral => boolean().withDefault(const Constant(false))();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class WorkoutTemplates extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get sourceCampaignId =>
      text().nullable().references(Campaigns, #id)();
  BoolColumn get isSeedContent =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class WorkoutTemplateExercises extends Table {
  TextColumn get id => text()();
  TextColumn get workoutTemplateId =>
      text().references(WorkoutTemplates, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  IntColumn get sortOrder => integer()();
  IntColumn get targetSets => integer().nullable()();
  TextColumn get targetReps => text().nullable()();
  RealColumn get targetWeight => real().nullable()();
  RealColumn get targetRpe => real().nullable()();
  TextColumn get restGuidance => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ProgramTemplates extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get sourceCampaignId =>
      text().nullable().references(Campaigns, #id)();
  BoolColumn get isSeedContent =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Campaigns extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();
  BoolColumn get isSeedContent =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CampaignPhases extends Table {
  TextColumn get id => text()();
  TextColumn get campaignId => text().references(Campaigns, #id)();
  TextColumn get name => text()();
  IntColumn get phaseOrder => integer()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ScheduledWorkouts extends Table {
  TextColumn get id => text()();
  TextColumn get campaignId => text().nullable().references(Campaigns, #id)();
  TextColumn get programTemplateId =>
      text().nullable().references(ProgramTemplates, #id)();
  TextColumn get workoutTemplateId =>
      text().references(WorkoutTemplates, #id)();
  DateTimeColumn get scheduledFor => dateTime()();
  TextColumn get status => text().withDefault(const Constant('planned'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SessionLogs extends Table {
  TextColumn get id => text()();
  TextColumn get scheduledWorkoutId =>
      text().nullable().references(ScheduledWorkouts, #id)();
  TextColumn get workoutTemplateId =>
      text().nullable().references(WorkoutTemplates, #id)();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ExerciseLogs extends Table {
  TextColumn get id => text()();
  TextColumn get sessionLogId => text().references(SessionLogs, #id)();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  IntColumn get sortOrder => integer()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SetLogs extends Table {
  TextColumn get id => text()();
  TextColumn get exerciseLogId => text().references(ExerciseLogs, #id)();
  IntColumn get setNumber => integer()();
  IntColumn get reps => integer().nullable()();
  RealColumn get weight => real().nullable()();
  RealColumn get rpe => real().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  RealColumn get distanceMeters => real().nullable()();
  BoolColumn get isComplete => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class WorkingWeights extends Table {
  TextColumn get exerciseId => text().references(Exercises, #id)();
  RealColumn get weight => real()();
  TextColumn get unit => text().withDefault(const Constant('kg'))();
  RealColumn get estimatedOneRepMax => real().nullable()();
  TextColumn get sourceSetLogId => text().nullable().references(SetLogs, #id)();
  BoolColumn get isManualOverride =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {exerciseId};
}

class CardioLogs extends Table {
  TextColumn get id => text()();
  DateTimeColumn get loggedAt => dateTime()();
  TextColumn get activityType => text().withDefault(const Constant('run'))();
  RealColumn get distanceMeters => real()();
  IntColumn get durationSeconds => integer()();
  RealColumn get paceSecondsPerKm => real()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class ProgressionSuggestions extends Table {
  TextColumn get id => text()();
  TextColumn get exerciseId => text().references(Exercises, #id)();
  RealColumn get currentWeight => real()();
  RealColumn get suggestedWeight => real()();
  TextColumn get unit => text().withDefault(const Constant('kg'))();
  TextColumn get reason => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Adventurers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get xp => integer().withDefault(const Constant(0))();
  TextColumn get selectedClass => text()();
  TextColumn get currentTitle => text()();
  IntColumn get might => integer().withDefault(const Constant(10))();
  IntColumn get endurance => integer().withDefault(const Constant(10))();
  IntColumn get discipline => integer().withDefault(const Constant(10))();
  IntColumn get vitality => integer().withDefault(const Constant(10))();
  IntColumn get agility => integer().withDefault(const Constant(10))();
  IntColumn get wisdom => integer().withDefault(const Constant(10))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class FitnessEvents extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  DateTimeColumn get occurredAt => dateTime()();
  TextColumn get sourceType => text()();
  TextColumn get sourceId => text().nullable()();
  TextColumn get metadataJson => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class RewardEvents extends Table {
  TextColumn get id => text()();
  TextColumn get fitnessEventId => text().references(FitnessEvents, #id)();
  TextColumn get type => text()();
  IntColumn get xpAmount => integer().withDefault(const Constant(0))();
  TextColumn get summary => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class XpHistory extends Table {
  TextColumn get id => text()();
  TextColumn get rewardEventId => text().references(RewardEvents, #id)();
  TextColumn get adventurerId => text().references(Adventurers, #id)();
  IntColumn get amount => integer()();
  IntColumn get levelBefore => integer()();
  IntColumn get levelAfter => integer()();
  IntColumn get xpBefore => integer()();
  IntColumn get xpAfter => integer()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Achievements extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get category => text()();
  IntColumn get targetValue => integer()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AchievementStates extends Table {
  TextColumn get achievementId => text().references(Achievements, #id)();
  IntColumn get currentValue => integer().withDefault(const Constant(0))();
  BoolColumn get isUnlocked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get unlockedAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {achievementId};
}

class EquipmentDefinitions extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get slot => text()();
  TextColumn get description => text()();
  TextColumn get iconKey => text()();
  TextColumn get rarity => text().withDefault(const Constant('common'))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class EquipmentInventory extends Table {
  TextColumn get equipmentId => text().references(EquipmentDefinitions, #id)();
  TextColumn get sourceRewardEventId =>
      text().nullable().references(RewardEvents, #id)();
  DateTimeColumn get unlockedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {equipmentId};
}

class EquippedEquipment extends Table {
  TextColumn get slot => text()();
  TextColumn get equipmentId => text().references(EquipmentDefinitions, #id)();
  DateTimeColumn get equippedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {slot};
}

class TitleDefinitions extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get requiredLevel => integer().withDefault(const Constant(1))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AdventurerTitles extends Table {
  TextColumn get titleId => text().references(TitleDefinitions, #id)();
  TextColumn get sourceRewardEventId =>
      text().nullable().references(RewardEvents, #id)();
  DateTimeColumn get unlockedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {titleId};
}

class BodyweightLogs extends Table {
  TextColumn get id => text()();
  DateTimeColumn get loggedAt => dateTime()();
  RealColumn get weightKg => real()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isSeedExample =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Goals extends Table {
  TextColumn get id => text()();
  TextColumn get campaignId => text().nullable().references(Campaigns, #id)();
  TextColumn get name => text()();
  TextColumn get category => text()();
  RealColumn get currentValue => real().nullable()();
  RealColumn get targetValue => real()();
  TextColumn get unit => text()();
  TextColumn get direction => text()();
  TextColumn get linkedMetric => text().nullable()();
  DateTimeColumn get targetDate => dateTime().nullable()();
  BoolColumn get isSeedContent =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SeedRuns extends Table {
  TextColumn get id => text()();
  TextColumn get seedName => text().unique()();
  IntColumn get seedVersion => integer()();
  DateTimeColumn get appliedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Pets extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withDefault(const Constant('Ember'))();
  TextColumn get speciesKey =>
      text().withDefault(const Constant('ember-fox'))();
  IntColumn get evolutionStage => integer().withDefault(const Constant(0))();
  IntColumn get bondLevel => integer().withDefault(const Constant(0))();
  IntColumn get bondXp => integer().withDefault(const Constant(0))();
  TextColumn get mood => text().withDefault(const Constant('content'))();
  RealColumn get energyPercent => real().withDefault(const Constant(1.0))();
  DateTimeColumn get lastTreatAt => dateTime().nullable()();
  DateTimeColumn get lastPlayAt => dateTime().nullable()();
  DateTimeColumn get lastRestAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class PetEvolutionHistory extends Table {
  TextColumn get id => text()();
  TextColumn get petId => text().references(Pets, #id)();
  IntColumn get fromStage => integer()();
  IntColumn get toStage => integer()();
  DateTimeColumn get evolvedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
