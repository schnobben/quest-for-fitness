import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';
import 'xp_event_service.dart';

class AchievementRepository {
  const AchievementRepository(this._database);

  static int _idSequence = 0;

  final AppDatabase _database;

  Future<List<AchievementStateView>> getAchievementStates() async {
    await ensureBuiltInAchievements();
    final achievements =
        await (_database.select(_database.achievements)..orderBy([
              (table) => OrderingTerm.asc(table.category),
              (table) => OrderingTerm.asc(table.targetValue),
            ]))
            .get();

    final views = <AchievementStateView>[];
    for (final achievement in achievements) {
      final state =
          await (_database.select(_database.achievementStates)
                ..where((table) => table.achievementId.equals(achievement.id)))
              .getSingleOrNull();
      views.add(
        AchievementStateView(
          achievement: achievement,
          state:
              state ??
              AchievementState(
                achievementId: achievement.id,
                currentValue: 0,
                isUnlocked: false,
                unlockedAt: null,
                updatedAt: achievement.createdAt,
              ),
        ),
      );
    }
    return views;
  }

  Future<List<AchievementStateView>> processFitnessEvent({
    required String fitnessEventId,
    required String fitnessEventType,
    required DateTime occurredAt,
  }) async {
    await ensureBuiltInAchievements();

    final unlocked = <AchievementStateView>[];
    for (final definition in _builtInAchievements) {
      final progress = await _progressFor(definition.id, occurredAt);
      final existing =
          await (_database.select(_database.achievementStates)
                ..where((table) => table.achievementId.equals(definition.id)))
              .getSingleOrNull();
      final wasUnlocked = existing?.isUnlocked ?? false;
      final isUnlocked = wasUnlocked || progress >= definition.targetValue;

      await _database
          .into(_database.achievementStates)
          .insertOnConflictUpdate(
            AchievementStatesCompanion.insert(
              achievementId: definition.id,
              currentValue: Value(progress.clamp(0, definition.targetValue)),
              isUnlocked: Value(isUnlocked),
              unlockedAt: Value(
                isUnlocked ? existing?.unlockedAt ?? occurredAt : null,
              ),
              updatedAt: occurredAt,
            ),
          );

      if (!wasUnlocked && isUnlocked) {
        final achievement = await (_database.select(
          _database.achievements,
        )..where((table) => table.id.equals(definition.id))).getSingle();
        final state =
            await (_database.select(_database.achievementStates)
                  ..where((table) => table.achievementId.equals(definition.id)))
                .getSingle();
        await _recordUnlockReward(
          fitnessEventId: fitnessEventId,
          achievement: achievement,
          occurredAt: occurredAt,
        );
        unlocked.add(
          AchievementStateView(achievement: achievement, state: state),
        );
      }
    }

    return unlocked;
  }

  Future<void> ensureBuiltInAchievements() async {
    final now = DateTime.now();
    for (final definition in _builtInAchievements) {
      await _database
          .into(_database.achievements)
          .insertOnConflictUpdate(
            AchievementsCompanion.insert(
              id: definition.id,
              name: definition.name,
              description: definition.description,
              category: definition.category,
              targetValue: definition.targetValue,
              createdAt: now,
            ),
          );
    }
  }

  Future<int> _progressFor(String achievementId, DateTime occurredAt) {
    return switch (achievementId) {
      AchievementId.firstWorkout => _eventCount(
        FitnessEventType.workoutCompleted,
      ),
      AchievementId.firstRun => _eventCount(FitnessEventType.runLogged),
      AchievementId.firstBodyweightLog => _eventCount(
        FitnessEventType.bodyweightLogged,
      ),
      AchievementId.fourWorkoutsWeek => _workoutCountForWeek(occurredAt),
      AchievementId.firstPr => _eventCount(FitnessEventType.prAchieved),
      AchievementId.tenTotalWorkouts => _eventCount(
        FitnessEventType.workoutCompleted,
      ),
      AchievementId.firstGoalMilestone => _eventCount(
        FitnessEventType.goalCompleted,
      ),
      _ => Future.value(0),
    };
  }

  Future<int> _eventCount(String type) async {
    final rows = await (_database.select(
      _database.fitnessEvents,
    )..where((table) => table.type.equals(type))).get();
    return rows.length;
  }

  Future<int> _workoutCountForWeek(DateTime day) async {
    final date = DateTime(day.year, day.month, day.day);
    final weekStart = date.subtract(Duration(days: date.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 7));
    final rows =
        await (_database.select(_database.fitnessEvents)
              ..where(
                (table) => table.type.equals(FitnessEventType.workoutCompleted),
              )
              ..where(
                (table) => table.occurredAt.isBiggerOrEqualValue(weekStart),
              )
              ..where((table) => table.occurredAt.isSmallerThanValue(weekEnd)))
            .get();
    return rows.length;
  }

  Future<void> _recordUnlockReward({
    required String fitnessEventId,
    required Achievement achievement,
    required DateTime occurredAt,
  }) {
    final id = _id('achievement-reward', occurredAt);
    return _database
        .into(_database.rewardEvents)
        .insert(
          RewardEventsCompanion.insert(
            id: id,
            fitnessEventId: fitnessEventId,
            type: RewardEventType.achievementUnlocked,
            summary: 'Achievement unlocked: ${achievement.name}',
            createdAt: occurredAt,
          ),
        );
  }

  String _id(String prefix, DateTime now) {
    _idSequence += 1;
    return '$prefix-${now.toUtc().microsecondsSinceEpoch}-$_idSequence';
  }
}

abstract final class AchievementId {
  static const firstWorkout = 'first-workout';
  static const firstRun = 'first-run';
  static const firstBodyweightLog = 'first-bodyweight-log';
  static const fourWorkoutsWeek = 'four-workouts-week';
  static const firstPr = 'first-pr';
  static const tenTotalWorkouts = 'ten-total-workouts';
  static const firstGoalMilestone = 'first-goal-milestone';
}

class AchievementDefinition {
  const AchievementDefinition({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.targetValue,
  });

  final String id;
  final String name;
  final String description;
  final String category;
  final int targetValue;
}

class AchievementStateView {
  const AchievementStateView({required this.achievement, required this.state});

  final Achievement achievement;
  final AchievementState state;

  double get progress => achievement.targetValue <= 0
      ? 0
      : state.currentValue / achievement.targetValue;
}

const _builtInAchievements = [
  AchievementDefinition(
    id: AchievementId.firstWorkout,
    name: 'First Quest',
    description: 'Complete your first workout.',
    category: 'strength',
    targetValue: 1,
  ),
  AchievementDefinition(
    id: AchievementId.firstRun,
    name: 'First Trail',
    description: 'Log your first run.',
    category: 'cardio',
    targetValue: 1,
  ),
  AchievementDefinition(
    id: AchievementId.firstBodyweightLog,
    name: 'Weigh-In Ritual',
    description: 'Log your first bodyweight entry.',
    category: 'body',
    targetValue: 1,
  ),
  AchievementDefinition(
    id: AchievementId.fourWorkoutsWeek,
    name: 'Iron Week',
    description: 'Complete four workouts in one week.',
    category: 'consistency',
    targetValue: 4,
  ),
  AchievementDefinition(
    id: AchievementId.firstPr,
    name: 'New Standard',
    description: 'Set your first strength PR.',
    category: 'strength',
    targetValue: 1,
  ),
  AchievementDefinition(
    id: AchievementId.tenTotalWorkouts,
    name: 'Ten Quests',
    description: 'Complete ten total workouts.',
    category: 'consistency',
    targetValue: 10,
  ),
  AchievementDefinition(
    id: AchievementId.firstGoalMilestone,
    name: 'Milestone Claimed',
    description: 'Complete your first goal milestone.',
    category: 'goals',
    targetValue: 1,
  ),
];
