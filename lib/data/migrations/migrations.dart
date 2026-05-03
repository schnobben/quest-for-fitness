import '../local_database/local_database.dart';

class DatabaseDevTools {
  const DatabaseDevTools(this._database);

  final AppDatabase _database;

  Future<void> resetAllData() async {
    await _database.transaction(() async {
      await _database.delete(_database.seedRuns).go();
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
