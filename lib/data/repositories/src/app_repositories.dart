import '../../../core/ids/ids.dart';
import '../../local_database/local_database.dart';
import 'achievement_repository.dart';
import 'adventurer_repository.dart';
import 'bodyweight_repository.dart';
import 'campaign_repository.dart';
import 'cardio_repository.dart';
import 'equipment_repository.dart';
import 'exercise_repository.dart';
import 'goal_repository.dart';
import 'pet_repository.dart';
import 'session_repository.dart';
import 'workout_repository.dart';
import 'xp_event_service.dart';

class AppRepositories {
  AppRepositories._({
    required this.adventurer,
    required this.achievements,
    required this.xpEvents,
    required this.exercises,
    required this.campaigns,
    required this.workouts,
    required this.sessions,
    required this.cardio,
    required this.bodyweight,
    required this.goals,
    required this.equipment,
    required this.pet,
  });

  factory AppRepositories(AppDatabase database) {
    final adventurer = AdventurerRepository(database);
    final achievements = AchievementRepository(database);
    final equipment = EquipmentRepository(database);
    final pet = PetRepository(database, UuidV4Generator());
    final xpEvents = XpEventService(
      database,
      adventurer,
      achievements,
      equipment,
      pet,
      UuidV4Generator(),
    );
    return AppRepositories._(
      adventurer: adventurer,
      achievements: achievements,
      xpEvents: xpEvents,
      exercises: ExerciseRepository(database),
      campaigns: CampaignRepository(database),
      workouts: WorkoutRepository(database),
      sessions: SessionRepository(database, xpEvents),
      cardio: CardioRepository(database, xpEvents),
      bodyweight: BodyweightRepository(database, xpEvents),
      goals: GoalRepository(database, xpEvents),
      equipment: equipment,
      pet: pet,
    );
  }

  final AdventurerRepository adventurer;
  final AchievementRepository achievements;
  final XpEventService xpEvents;
  final ExerciseRepository exercises;
  final CampaignRepository campaigns;
  final WorkoutRepository workouts;
  final SessionRepository sessions;
  final CardioRepository cardio;
  final BodyweightRepository bodyweight;
  final GoalRepository goals;
  final EquipmentRepository equipment;
  final PetRepository pet;
}
