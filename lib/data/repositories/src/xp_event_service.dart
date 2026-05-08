import 'dart:convert';

import 'package:drift/drift.dart';

import '../../local_database/local_database.dart';
import 'achievement_repository.dart';
import 'adventurer_repository.dart';
import 'equipment_repository.dart';

const int xpWorkoutBase = 50;
const int xpWorkoutPerSet = 5;
const int xpRunPerKm = 15;
const int xpBodyweightLog = 20;
const int xpGoalCompleted = 100;
const int xpGoalUpdated = 10;
const int xpPrAchieved = 35;

class XpEventService {
  const XpEventService(
    this._database,
    this._adventurer,
    this._achievements,
    this._equipment,
  );

  static int _idSequence = 0;

  final AppDatabase _database;
  final AdventurerRepository _adventurer;
  final AchievementRepository _achievements;
  final EquipmentRepository _equipment;

  Future<RewardGrant> onWorkoutCompleted({
    required String sessionId,
    required int setCount,
    required DateTime occurredAt,
  }) {
    final xpAmount = xpWorkoutBase + setCount * xpWorkoutPerSet;
    return _recordXpReward(
      fitnessType: FitnessEventType.workoutCompleted,
      sourceType: 'session_log',
      sourceId: sessionId,
      occurredAt: occurredAt,
      xpAmount: xpAmount,
      summary: 'Workout complete: +$xpAmount XP',
      metadata: {'setCount': setCount},
    );
  }

  Future<RewardGrant> onRunLogged({
    required String cardioLogId,
    required double distanceKm,
    required DateTime occurredAt,
  }) {
    final xpAmount = (distanceKm * xpRunPerKm).round().clamp(1, 9999);
    return _recordXpReward(
      fitnessType: FitnessEventType.runLogged,
      sourceType: 'cardio_log',
      sourceId: cardioLogId,
      occurredAt: occurredAt,
      xpAmount: xpAmount,
      summary: 'Run logged: +$xpAmount XP',
      metadata: {'distanceKm': distanceKm},
    );
  }

  Future<RewardGrant> onBodyweightLogged({
    required String bodyweightLogId,
    required DateTime occurredAt,
  }) {
    return _recordXpReward(
      fitnessType: FitnessEventType.bodyweightLogged,
      sourceType: 'bodyweight_log',
      sourceId: bodyweightLogId,
      occurredAt: occurredAt,
      xpAmount: xpBodyweightLog,
      summary: 'Bodyweight logged: +$xpBodyweightLog XP',
    );
  }

  Future<RewardGrant> onGoalUpdated({
    required String goalId,
    required DateTime occurredAt,
    required bool completed,
  }) {
    final xpAmount = completed ? xpGoalCompleted : xpGoalUpdated;
    return _recordXpReward(
      fitnessType: completed
          ? FitnessEventType.goalCompleted
          : FitnessEventType.goalUpdated,
      sourceType: 'goal',
      sourceId: goalId,
      occurredAt: occurredAt,
      xpAmount: xpAmount,
      summary: completed
          ? 'Goal milestone complete: +$xpAmount XP'
          : 'Goal updated: +$xpAmount XP',
      metadata: {'completed': completed},
    );
  }

  Future<RewardGrant> onGoalCompleted({
    required String goalId,
    required DateTime occurredAt,
  }) {
    return onGoalUpdated(
      goalId: goalId,
      occurredAt: occurredAt,
      completed: true,
    );
  }

  Future<RewardGrant> onPrAchieved({
    required String exerciseId,
    required String setLogId,
    required DateTime occurredAt,
  }) {
    return _recordXpReward(
      fitnessType: FitnessEventType.prAchieved,
      sourceType: 'set_log',
      sourceId: setLogId,
      occurredAt: occurredAt,
      xpAmount: xpPrAchieved,
      summary: 'New strength PR: +$xpPrAchieved XP',
      metadata: {'exerciseId': exerciseId},
    );
  }

  Future<RewardGrant> onDebugXpGranted({required int xpAmount}) {
    return _recordXpReward(
      fitnessType: FitnessEventType.debugXpGranted,
      sourceType: 'debug',
      sourceId: null,
      occurredAt: DateTime.now(),
      xpAmount: xpAmount,
      summary: 'Debug XP grant: +$xpAmount XP',
    );
  }

  Future<List<RewardEvent>> getRecentRewards({int limit = 20}) {
    return (_database.select(_database.rewardEvents)
          ..orderBy([(table) => OrderingTerm.desc(table.createdAt)])
          ..limit(limit))
        .get();
  }

  Future<List<XpHistoryData>> getXpHistory({int limit = 50}) {
    return (_database.select(_database.xpHistory)
          ..orderBy([(table) => OrderingTerm.desc(table.createdAt)])
          ..limit(limit))
        .get();
  }

  Future<RewardGrant> _recordXpReward({
    required String fitnessType,
    required String sourceType,
    required String? sourceId,
    required DateTime occurredAt,
    required int xpAmount,
    required String summary,
    Map<String, Object?> metadata = const {},
  }) async {
    final now = DateTime.now();
    final eventId = _id('fitness', now);
    final rewardId = _id('reward', now);
    final historyId = _id('xp', now);
    final before = await _adventurer.getOrCreatePrimary();

    await _database
        .into(_database.fitnessEvents)
        .insert(
          FitnessEventsCompanion.insert(
            id: eventId,
            type: fitnessType,
            occurredAt: occurredAt,
            sourceType: sourceType,
            sourceId: Value(sourceId),
            metadataJson: metadata.isEmpty
                ? const Value(null)
                : Value(jsonEncode(metadata)),
            createdAt: now,
          ),
        );
    await _database
        .into(_database.rewardEvents)
        .insert(
          RewardEventsCompanion.insert(
            id: rewardId,
            fitnessEventId: eventId,
            type: RewardEventType.xpGranted,
            xpAmount: Value(xpAmount),
            summary: summary,
            createdAt: now,
          ),
        );

    final after = await _adventurer.grantXp(xpAmount);
    final titleUnlocks = await _equipment.unlockTitlesForLevelRange(
      fitnessEventId: eventId,
      levelBefore: before.level,
      levelAfter: after.level,
      occurredAt: occurredAt,
    );
    await _database
        .into(_database.xpHistory)
        .insert(
          XpHistoryCompanion.insert(
            id: historyId,
            rewardEventId: rewardId,
            adventurerId: after.id,
            amount: xpAmount,
            levelBefore: before.level,
            levelAfter: after.level,
            xpBefore: before.xp,
            xpAfter: after.xp,
            createdAt: now,
          ),
        );
    final unlockedAchievements = await _achievements.processFitnessEvent(
      fitnessEventId: eventId,
      fitnessEventType: fitnessType,
      occurredAt: occurredAt,
    );
    final equipmentUnlocks = await _equipment.unlockEquipmentForAchievements(
      fitnessEventId: eventId,
      achievements: unlockedAchievements,
      occurredAt: occurredAt,
    );

    return RewardGrant(
      fitnessEventId: eventId,
      rewardEventId: rewardId,
      xpAmount: xpAmount,
      levelBefore: before.level,
      levelAfter: after.level,
      xpBefore: before.xp,
      xpAfter: after.xp,
      summary: summary,
      unlockedAchievements: unlockedAchievements,
      equipmentUnlocks: equipmentUnlocks,
      titleUnlocks: titleUnlocks,
    );
  }

  String _id(String prefix, DateTime now) {
    _idSequence += 1;
    return '$prefix-${now.toUtc().microsecondsSinceEpoch}-$_idSequence';
  }
}

abstract final class FitnessEventType {
  static const workoutCompleted = 'workout_completed';
  static const runLogged = 'run_logged';
  static const bodyweightLogged = 'bodyweight_logged';
  static const goalUpdated = 'goal_updated';
  static const goalCompleted = 'goal_completed';
  static const prAchieved = 'pr_achieved';
  static const debugXpGranted = 'debug_xp_granted';
}

abstract final class RewardEventType {
  static const xpGranted = 'xp_granted';
  static const achievementUnlocked = 'achievement_unlocked';
  static const equipmentUnlocked = 'equipment_unlocked';
  static const titleUnlocked = 'title_unlocked';
}

class RewardGrant {
  const RewardGrant({
    required this.fitnessEventId,
    required this.rewardEventId,
    required this.xpAmount,
    required this.levelBefore,
    required this.levelAfter,
    required this.xpBefore,
    required this.xpAfter,
    required this.summary,
    this.unlockedAchievements = const [],
    this.equipmentUnlocks = const [],
    this.titleUnlocks = const [],
  });

  final String fitnessEventId;
  final String rewardEventId;
  final int xpAmount;
  final int levelBefore;
  final int levelAfter;
  final int xpBefore;
  final int xpAfter;
  final String summary;
  final List<AchievementStateView> unlockedAchievements;
  final List<CosmeticUnlockView> equipmentUnlocks;
  final List<CosmeticUnlockView> titleUnlocks;

  bool get leveledUp => levelAfter > levelBefore;
}
