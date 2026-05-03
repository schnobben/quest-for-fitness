class MaySeptember2026Seed {
  const MaySeptember2026Seed._();

  static const seedName = 'may_september_2026_campaign';
  static const seedVersion = 2;
  static const campaignId = 'campaign_may_september_2026';
  static const programTemplateId = 'program_may_september_2026';

  static final campaign = SeedCampaign(
    id: campaignId,
    name: 'May-September 2026 Campaign',
    description:
        'Editable seed campaign based on the May-September 2026 handover program.',
    startDate: DateTime.utc(2026, 5, 5),
    endDate: DateTime.utc(2026, 9, 30),
  );

  static final phases = [
    SeedCampaignPhase(
      id: 'phase-foundation-2026',
      campaignId: campaignId,
      name: 'The Foundation',
      phaseOrder: 1,
      startDate: DateTime.utc(2026, 5, 5),
      endDate: DateTime.utc(2026, 6, 29),
      notes:
          '4x/week mornings. Habit rebuild, easy running, no macro tracking.',
    ),
    SeedCampaignPhase(
      id: 'phase-quest-2026',
      campaignId: campaignId,
      name: 'The Quest',
      phaseOrder: 2,
      startDate: DateTime.utc(2026, 7),
      endDate: DateTime.utc(2026, 8, 31),
      notes: '5x/week evenings. Intervals introduced, macro tracking.',
    ),
    SeedCampaignPhase(
      id: 'phase-peak-2026',
      campaignId: campaignId,
      name: 'The Peak',
      phaseOrder: 3,
      startDate: DateTime.utc(2026, 9),
      endDate: DateTime.utc(2026, 9, 30),
      notes: '5x/week. Bench peak and all goal tests in final week.',
    ),
  ];

  static const exercises = [
    SeedExercise(
      id: 'barbell-bench-press',
      name: 'Barbell Bench Press',
      category: 'strength',
      equipment: 'barbell',
      primaryMuscles: 'chest,triceps,front delts',
      movementPattern: 'horizontal push',
    ),
    SeedExercise(
      id: 'weighted-pull-up',
      name: 'Weighted Pull-up',
      category: 'strength',
      equipment: 'bodyweight,external load',
      primaryMuscles: 'lats,biceps',
      movementPattern: 'vertical pull',
      isBodyweight: true,
      notes: 'Track external load for the weighted pull-up goal.',
    ),
    SeedExercise(
      id: 'barbell-ohp',
      name: 'Barbell OHP',
      category: 'strength',
      equipment: 'barbell',
      primaryMuscles: 'shoulders,triceps',
      movementPattern: 'vertical push',
    ),
    SeedExercise(
      id: 'pendlay-row',
      name: 'Pendlay Row',
      category: 'strength',
      equipment: 'barbell',
      primaryMuscles: 'back,biceps',
      movementPattern: 'horizontal pull',
      notes: 'Starting weight should be calibrated.',
    ),
    SeedExercise(
      id: 'face-pull-cable',
      name: 'Face Pull (Cable)',
      category: 'hypertrophy',
      equipment: 'cable',
      primaryMuscles: 'rear delts,upper back',
      movementPattern: 'horizontal pull',
    ),
    SeedExercise(
      id: 'barbell-curl',
      name: 'Barbell Curl',
      category: 'hypertrophy',
      equipment: 'barbell',
      primaryMuscles: 'biceps',
      movementPattern: 'isolation',
      notes: 'Starting weight should be calibrated.',
    ),
    SeedExercise(
      id: 'conventional-deadlift',
      name: 'Conventional Deadlift',
      category: 'strength',
      equipment: 'barbell',
      primaryMuscles: 'posterior chain,back',
      movementPattern: 'hinge',
    ),
    SeedExercise(
      id: 'romanian-deadlift',
      name: 'Romanian Deadlift',
      category: 'strength',
      equipment: 'barbell',
      primaryMuscles: 'hamstrings,glutes',
      movementPattern: 'hinge',
    ),
    SeedExercise(
      id: 'leg-press',
      name: 'Leg Press',
      category: 'hypertrophy',
      equipment: 'machine',
      primaryMuscles: 'quads,glutes',
      movementPattern: 'squat',
      notes: 'Starting weight should be calibrated.',
    ),
    SeedExercise(
      id: 'seated-leg-curl',
      name: 'Seated Leg Curl',
      category: 'hypertrophy',
      equipment: 'machine',
      primaryMuscles: 'hamstrings',
      movementPattern: 'isolation',
    ),
    SeedExercise(
      id: 'hanging-leg-raise',
      name: 'Hanging Leg Raise',
      category: 'core',
      equipment: 'bodyweight',
      primaryMuscles: 'core,hip flexors',
      movementPattern: 'core',
      defaultUnit: 'reps',
      isBodyweight: true,
    ),
    SeedExercise(
      id: 'incline-db-press',
      name: 'Incline DB Press',
      category: 'hypertrophy',
      equipment: 'dumbbell',
      primaryMuscles: 'upper chest,triceps',
      movementPattern: 'horizontal push',
    ),
    SeedExercise(
      id: 'lat-pulldown',
      name: 'Lat Pulldown',
      category: 'hypertrophy',
      equipment: 'cable',
      primaryMuscles: 'lats,biceps',
      movementPattern: 'vertical pull',
      notes: 'Starting weight should be calibrated.',
    ),
    SeedExercise(
      id: 'machine-row',
      name: 'Machine Row',
      category: 'hypertrophy',
      equipment: 'machine',
      primaryMuscles: 'back,biceps',
      movementPattern: 'horizontal pull',
      notes: 'Starting weight should be calibrated.',
    ),
    SeedExercise(
      id: 'lateral-raise-db',
      name: 'Lateral Raise (DB)',
      category: 'hypertrophy',
      equipment: 'dumbbell',
      primaryMuscles: 'side delts',
      movementPattern: 'isolation',
    ),
    SeedExercise(
      id: 'tricep-pushdown-cable',
      name: 'Tricep Pushdown (Cable)',
      category: 'hypertrophy',
      equipment: 'cable',
      primaryMuscles: 'triceps',
      movementPattern: 'isolation',
    ),
    SeedExercise(
      id: 'incline-db-curl',
      name: 'Incline DB Curl',
      category: 'hypertrophy',
      equipment: 'dumbbell',
      primaryMuscles: 'biceps',
      movementPattern: 'isolation',
      notes: 'Starting weight should be calibrated.',
    ),
    SeedExercise(
      id: 'barbell-back-squat',
      name: 'Barbell Back Squat',
      category: 'strength',
      equipment: 'barbell',
      primaryMuscles: 'quads,glutes',
      movementPattern: 'squat',
    ),
    SeedExercise(
      id: 'nordic-curl',
      name: 'Nordic Curl',
      category: 'hypertrophy',
      equipment: 'bodyweight',
      primaryMuscles: 'hamstrings',
      movementPattern: 'hinge',
      defaultUnit: 'reps',
      isBodyweight: true,
    ),
    SeedExercise(
      id: 'seated-calf-raise',
      name: 'Seated Calf Raise',
      category: 'hypertrophy',
      equipment: 'machine',
      primaryMuscles: 'calves',
      movementPattern: 'isolation',
      notes: 'Starting weight should be calibrated.',
    ),
    SeedExercise(
      id: 'ab-wheel',
      name: 'Ab Wheel',
      category: 'core',
      equipment: 'bodyweight',
      primaryMuscles: 'core',
      movementPattern: 'core',
      defaultUnit: 'reps',
      isBodyweight: true,
    ),
  ];

  static const phaseOneWorkouts = [
    SeedWorkout(
      id: 'day-a',
      name: 'Day A - Upper Strength',
      scheduledDay: 'Monday',
      description: 'Phase 1 upper strength session from seeding.md.',
      exercises: [
        SeedWorkoutExercise('barbell-bench-press', 1, 5, '4', '8-9', 100),
        SeedWorkoutExercise('weighted-pull-up', 2, 5, '4', '8-9', 20),
        SeedWorkoutExercise('barbell-ohp', 3, 3, '6', '8', 65),
        SeedWorkoutExercise.calibrate('pendlay-row', 4, 3, '8', '7-8'),
        SeedWorkoutExercise(
          'face-pull-cable',
          5,
          3,
          '15',
          '7',
          null,
          notes: 'Starting weight: light.',
        ),
        SeedWorkoutExercise.calibrate('barbell-curl', 6, 3, '10', '7-8'),
      ],
    ),
    SeedWorkout(
      id: 'day-b',
      name: 'Day B - Lower Strength',
      scheduledDay: 'Tuesday',
      description: 'Phase 1 lower strength session from seeding.md.',
      exercises: [
        SeedWorkoutExercise('conventional-deadlift', 1, 4, '4', '8-9', 160),
        SeedWorkoutExercise('romanian-deadlift', 2, 3, '8', '8', 80),
        SeedWorkoutExercise.calibrate('leg-press', 3, 3, '10', '7-8'),
        SeedWorkoutExercise('seated-leg-curl', 4, 3, '12', '7-8', 50),
        SeedWorkoutExercise(
          'hanging-leg-raise',
          5,
          3,
          '12',
          null,
          null,
          notes: 'Starting weight: bodyweight.',
        ),
      ],
    ),
    SeedWorkout(
      id: 'day-c',
      name: 'Day C - Upper Volume',
      scheduledDay: 'Thursday',
      description: 'Phase 1 upper volume session from seeding.md.',
      exercises: [
        SeedWorkoutExercise('barbell-bench-press', 1, 4, '8-10', '7-8', 80),
        SeedWorkoutExercise('incline-db-press', 2, 3, '10-12', '7-8', 35),
        SeedWorkoutExercise.calibrate('lat-pulldown', 3, 4, '10-12', '7-8'),
        SeedWorkoutExercise.calibrate('machine-row', 4, 3, '12-15', '7-8'),
        SeedWorkoutExercise('lateral-raise-db', 5, 4, '15-20', '7-8', 8),
        SeedWorkoutExercise('tricep-pushdown-cable', 6, 3, '15', '7', 25),
        SeedWorkoutExercise.calibrate('incline-db-curl', 7, 3, '12', '7'),
      ],
    ),
    SeedWorkout(
      id: 'day-d',
      name: 'Day D - Lower Volume',
      scheduledDay: 'Friday or Saturday',
      description: 'Phase 1 lower volume session from seeding.md.',
      exercises: [
        SeedWorkoutExercise('barbell-back-squat', 1, 4, '6-8', '7', 80),
        SeedWorkoutExercise.calibrate('leg-press', 2, 3, '12-15', '7-8'),
        SeedWorkoutExercise(
          'nordic-curl',
          3,
          3,
          '5-8',
          null,
          null,
          notes: 'Starting weight: bodyweight.',
        ),
        SeedWorkoutExercise('seated-leg-curl', 4, 3, '15', '7', 40),
        SeedWorkoutExercise.calibrate('seated-calf-raise', 5, 3, '20', '7'),
        SeedWorkoutExercise(
          'ab-wheel',
          6,
          3,
          '10',
          null,
          null,
          notes: 'Starting weight: bodyweight.',
        ),
      ],
    ),
  ];

  static final phaseOneSchedule = _buildPhaseOneSchedule();

  static final goals = [
    SeedGoal(
      id: 'goal-bench-140kg',
      name: 'Bench Press 1RM',
      category: 'strength',
      currentValue: 115,
      targetValue: 140,
      unit: 'kg',
      direction: 'higher',
      linkedMetric: 'exercise:barbell-bench-press',
      targetDate: DateTime.utc(2026, 9, 30),
    ),
    SeedGoal(
      id: 'goal-run-5k-25min',
      name: '5 km Run Time',
      category: 'cardio',
      currentValue: 32,
      targetValue: 25,
      unit: 'minutes',
      direction: 'lower',
      linkedMetric: 'cardio:5k_time',
      targetDate: DateTime.utc(2026, 9, 30),
    ),
    SeedGoal(
      id: 'goal-weighted-pullup-60kg',
      name: 'Weighted Pull-up',
      category: 'strength',
      currentValue: 20,
      targetValue: 60,
      unit: 'kg',
      direction: 'higher',
      linkedMetric: 'exercise:weighted-pull-up',
      targetDate: DateTime.utc(2026, 9, 30),
    ),
    SeedGoal(
      id: 'goal-bodyweight-pullups-25',
      name: 'Bodyweight Pull-ups',
      category: 'strength',
      currentValue: 8,
      targetValue: 25,
      unit: 'reps',
      direction: 'higher',
      linkedMetric: 'exercise:weighted-pull-up',
      targetDate: DateTime.utc(2026, 9, 30),
    ),
    SeedGoal(
      id: 'goal-bodyweight-83kg',
      name: 'Body Weight',
      category: 'body composition',
      currentValue: 92.5,
      targetValue: 83,
      unit: 'kg',
      direction: 'lower',
      linkedMetric: 'bodyweight',
      targetDate: DateTime.utc(2026, 9, 30),
    ),
  ];

  static final initialBodyweight = SeedBodyweightLog(
    id: 'bodyweight-seed-2026-05-05',
    loggedAt: DateTime.utc(2026, 5, 5),
    weightKg: 92.5,
    notes: 'Seed/example starting bodyweight from seeding.md.',
  );

  static List<SeedScheduledWorkout> _buildPhaseOneSchedule() {
    const workoutIdsByWeekday = {
      DateTime.monday: 'day-a',
      DateTime.tuesday: 'day-b',
      DateTime.thursday: 'day-c',
      DateTime.friday: 'day-d',
    };
    final workouts = <SeedScheduledWorkout>[];
    final start = DateTime.utc(2026, 5, 5);
    final end = DateTime.utc(2026, 6, 29);

    for (
      var date = start;
      !date.isAfter(end);
      date = date.add(const Duration(days: 1))
    ) {
      final workoutId = workoutIdsByWeekday[date.weekday];
      if (workoutId == null) {
        continue;
      }
      workouts.add(
        SeedScheduledWorkout(
          id: 'scheduled-$workoutId-${date.toIso8601String().substring(0, 10)}',
          workoutTemplateId: workoutId,
          scheduledFor: date,
        ),
      );
    }

    return workouts;
  }
}

class SeedCampaign {
  const SeedCampaign({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  final String id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
}

class SeedCampaignPhase {
  const SeedCampaignPhase({
    required this.id,
    required this.campaignId,
    required this.name,
    required this.phaseOrder,
    required this.startDate,
    required this.endDate,
    required this.notes,
  });

  final String id;
  final String campaignId;
  final String name;
  final int phaseOrder;
  final DateTime startDate;
  final DateTime endDate;
  final String notes;
}

class SeedExercise {
  const SeedExercise({
    required this.id,
    required this.name,
    required this.category,
    required this.equipment,
    required this.primaryMuscles,
    required this.movementPattern,
    this.defaultUnit = 'kg',
    this.isBodyweight = false,
    this.notes,
  });

  final String id;
  final String name;
  final String category;
  final String equipment;
  final String primaryMuscles;
  final String movementPattern;
  final String defaultUnit;
  final bool isBodyweight;
  final String? notes;
}

class SeedWorkout {
  const SeedWorkout({
    required this.id,
    required this.name,
    required this.scheduledDay,
    required this.description,
    required this.exercises,
  });

  final String id;
  final String name;
  final String scheduledDay;
  final String description;
  final List<SeedWorkoutExercise> exercises;
}

class SeedWorkoutExercise {
  const SeedWorkoutExercise(
    this.exerciseId,
    this.sortOrder,
    this.targetSets,
    this.targetReps,
    this.rpeTarget,
    this.targetWeight, {
    this.restGuidance = 'Rest 90-180 seconds as needed.',
    this.notes = 'Seed target; editable after import.',
  });

  const SeedWorkoutExercise.calibrate(
    this.exerciseId,
    this.sortOrder,
    this.targetSets,
    this.targetReps,
    this.rpeTarget, {
    this.restGuidance = 'Rest 90-180 seconds as needed.',
  }) : targetWeight = null,
       notes = 'Starting weight: calibrate.';

  final String exerciseId;
  final int sortOrder;
  final int targetSets;
  final String targetReps;
  final String? rpeTarget;
  final double? targetWeight;
  final String restGuidance;
  final String notes;

  double? get targetRpeValue {
    final target = rpeTarget;
    if (target == null) {
      return null;
    }
    final parts = target.split('-');
    final first = double.tryParse(parts.first);
    if (first == null) {
      return null;
    }
    if (parts.length == 1) {
      return first;
    }
    final second = double.tryParse(parts.last);
    return second == null ? first : (first + second) / 2;
  }

  String get notesWithRpe {
    final target = rpeTarget == null ? 'not specified' : rpeTarget!;
    return '$notes RPE target: $target.';
  }
}

class SeedScheduledWorkout {
  const SeedScheduledWorkout({
    required this.id,
    required this.workoutTemplateId,
    required this.scheduledFor,
  });

  final String id;
  final String workoutTemplateId;
  final DateTime scheduledFor;
}

class SeedGoal {
  const SeedGoal({
    required this.id,
    required this.name,
    required this.category,
    required this.currentValue,
    required this.targetValue,
    required this.unit,
    required this.direction,
    required this.linkedMetric,
    required this.targetDate,
  });

  final String id;
  final String name;
  final String category;
  final double currentValue;
  final double targetValue;
  final String unit;
  final String direction;
  final String linkedMetric;
  final DateTime targetDate;
}

class SeedBodyweightLog {
  const SeedBodyweightLog({
    required this.id,
    required this.loggedAt,
    required this.weightKg,
    required this.notes,
  });

  final String id;
  final DateTime loggedAt;
  final double weightKg;
  final String notes;
}
