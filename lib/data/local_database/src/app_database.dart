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
    BodyweightLogs,
    Goals,
    SeedRuns,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  factory AppDatabase.inMemory() {
    return AppDatabase.forTesting(NativeDatabase.memory());
  }

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (migrator) => migrator.createAll(),
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
