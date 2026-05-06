import '../../local_database/local_database.dart';
import 'adventurer_repository.dart';
import 'bodyweight_repository.dart';
import 'campaign_repository.dart';
import 'cardio_repository.dart';
import 'exercise_repository.dart';
import 'goal_repository.dart';
import 'session_repository.dart';
import 'workout_repository.dart';

class AppRepositories {
  AppRepositories(AppDatabase database)
    : adventurer = AdventurerRepository(database),
      exercises = ExerciseRepository(database),
      campaigns = CampaignRepository(database),
      workouts = WorkoutRepository(database),
      sessions = SessionRepository(database),
      cardio = CardioRepository(database),
      bodyweight = BodyweightRepository(database),
      goals = GoalRepository(database);

  final AdventurerRepository adventurer;
  final ExerciseRepository exercises;
  final CampaignRepository campaigns;
  final WorkoutRepository workouts;
  final SessionRepository sessions;
  final CardioRepository cardio;
  final BodyweightRepository bodyweight;
  final GoalRepository goals;
}
