import '../../local_database/local_database.dart';
import 'adventurer_repository.dart';

const int xpWorkoutBase = 50;
const int xpWorkoutPerSet = 5;
const int xpRunPerKm = 15;
const int xpBodyweightLog = 20;
const int xpGoalCompleted = 100;

class XpEventService {
  const XpEventService(this._adventurer);

  final AdventurerRepository _adventurer;

  Future<Adventurer> onWorkoutCompleted({required int setCount}) =>
      _adventurer.grantXp(xpWorkoutBase + setCount * xpWorkoutPerSet);

  Future<Adventurer> onRunLogged({required double distanceKm}) =>
      _adventurer.grantXp((distanceKm * xpRunPerKm).round().clamp(1, 9999));

  Future<Adventurer> onBodyweightLogged() =>
      _adventurer.grantXp(xpBodyweightLog);

  Future<Adventurer> onGoalCompleted() => _adventurer.grantXp(xpGoalCompleted);
}
