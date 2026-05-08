import '../local_database/local_database.dart';

class DatabaseDevTools {
  const DatabaseDevTools(this._database);

  final AppDatabase _database;

  Future<void> resetAllData() async {
    await _database.transaction(() async {
      await _database.delete(_database.seedRuns).go();
      await _database.delete(_database.equippedEquipment).go();
      await _database.delete(_database.equipmentInventory).go();
      await _database.delete(_database.adventurerTitles).go();
      await _database.delete(_database.xpHistory).go();
      await _database.delete(_database.rewardEvents).go();
      await _database.delete(_database.fitnessEvents).go();
      await _database.delete(_database.achievementStates).go();
      await _database.delete(_database.achievements).go();
      await _database.delete(_database.equipmentDefinitions).go();
      await _database.delete(_database.titleDefinitions).go();
      await _database.delete(_database.adventurers).go();
      await _database.delete(_database.progressionSuggestions).go();
      await _database.delete(_database.cardioLogs).go();
      await _database.delete(_database.setLogs).go();
      await _database.delete(_database.exerciseLogs).go();
      await _database.delete(_database.sessionLogs).go();
      await _database.delete(_database.scheduledWorkouts).go();
      await _database.delete(_database.goals).go();
      await _database.delete(_database.bodyweightLogs).go();
      await _database.delete(_database.workoutTemplateExercises).go();
      await _database.delete(_database.workoutTemplates).go();
      await _database.delete(_database.programTemplates).go();
      await _database.delete(_database.campaignPhases).go();
      await _database.delete(_database.campaigns).go();
      await _database.delete(_database.exercises).go();
    });
  }
}
