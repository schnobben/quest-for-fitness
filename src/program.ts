import type { Goal, ProgramPhase, WeightLog, WorkingWeight } from './types';

export const programPhases: ProgramPhase[] = [
  {
    phase: 1,
    name: 'The Foundation',
    startDate: '2026-05-05',
    endDate: '2026-06-29',
    days: [
      {
        id: 'day-a',
        name: 'Upper strength',
        scheduledDay: 'Monday',
        weekday: 1,
        exercises: [
          { exerciseId: 'barbell-bench-press', exerciseName: 'Barbell bench press', sets: 5, repsTarget: '4', startingWeightKg: 100, rpeTarget: '8-9' },
          { exerciseId: 'weighted-pull-up', exerciseName: 'Weighted pull-up', sets: 5, repsTarget: '4', startingWeightKg: 20, rpeTarget: '8-9' },
          { exerciseId: 'barbell-ohp', exerciseName: 'Barbell OHP', sets: 3, repsTarget: '6', startingWeightKg: 65, rpeTarget: '8' },
          { exerciseId: 'pendlay-row', exerciseName: 'Pendlay row', sets: 3, repsTarget: '8', startingWeightKg: null, rpeTarget: '7-8', notes: 'Calibrate' },
          { exerciseId: 'face-pull-cable', exerciseName: 'Face pull (cable)', sets: 3, repsTarget: '15', startingWeightKg: null, rpeTarget: '7', notes: 'Light' },
          { exerciseId: 'barbell-curl', exerciseName: 'Barbell curl', sets: 3, repsTarget: '10', startingWeightKg: null, rpeTarget: '7-8', notes: 'Calibrate' },
        ],
      },
      {
        id: 'day-b',
        name: 'Lower strength',
        scheduledDay: 'Tuesday',
        weekday: 2,
        exercises: [
          { exerciseId: 'conventional-deadlift', exerciseName: 'Conventional deadlift', sets: 4, repsTarget: '4', startingWeightKg: 160, rpeTarget: '8-9' },
          { exerciseId: 'romanian-deadlift', exerciseName: 'Romanian deadlift', sets: 3, repsTarget: '8', startingWeightKg: 80, rpeTarget: '8' },
          { exerciseId: 'leg-press', exerciseName: 'Leg press', sets: 3, repsTarget: '10', startingWeightKg: null, rpeTarget: '7-8', notes: 'Calibrate' },
          { exerciseId: 'seated-leg-curl', exerciseName: 'Seated leg curl', sets: 3, repsTarget: '12', startingWeightKg: 50, rpeTarget: '7-8' },
          { exerciseId: 'hanging-leg-raise', exerciseName: 'Hanging leg raise', sets: 3, repsTarget: '12', startingWeightKg: null, rpeTarget: '-', bodyweight: true },
        ],
      },
      {
        id: 'day-c',
        name: 'Upper volume',
        scheduledDay: 'Thursday',
        weekday: 4,
        exercises: [
          { exerciseId: 'barbell-bench-press', exerciseName: 'Barbell bench press', sets: 4, repsTarget: '8-10', startingWeightKg: 80, rpeTarget: '7-8' },
          { exerciseId: 'incline-db-press', exerciseName: 'Incline DB press', sets: 3, repsTarget: '10-12', startingWeightKg: 35, rpeTarget: '7-8' },
          { exerciseId: 'lat-pulldown', exerciseName: 'Lat pulldown', sets: 4, repsTarget: '10-12', startingWeightKg: null, rpeTarget: '7-8', notes: 'Calibrate' },
          { exerciseId: 'machine-row', exerciseName: 'Machine row', sets: 3, repsTarget: '12-15', startingWeightKg: null, rpeTarget: '7-8', notes: 'Calibrate' },
          { exerciseId: 'lateral-raise-db', exerciseName: 'Lateral raise (DB)', sets: 4, repsTarget: '15-20', startingWeightKg: 8, rpeTarget: '7-8' },
          { exerciseId: 'tricep-pushdown', exerciseName: 'Tricep pushdown (cable)', sets: 3, repsTarget: '15', startingWeightKg: 25, rpeTarget: '7' },
          { exerciseId: 'incline-db-curl', exerciseName: 'Incline DB curl', sets: 3, repsTarget: '12', startingWeightKg: null, rpeTarget: '7', notes: 'Calibrate' },
        ],
      },
      {
        id: 'day-d',
        name: 'Lower volume',
        scheduledDay: 'Friday or Saturday',
        weekday: 5,
        exercises: [
          { exerciseId: 'barbell-squat', exerciseName: 'Barbell back squat', sets: 4, repsTarget: '6-8', startingWeightKg: 80, rpeTarget: '7' },
          { exerciseId: 'leg-press', exerciseName: 'Leg press', sets: 3, repsTarget: '12-15', startingWeightKg: null, rpeTarget: '7-8', notes: 'Calibrate' },
          { exerciseId: 'nordic-curl', exerciseName: 'Nordic curl', sets: 3, repsTarget: '5-8', startingWeightKg: null, rpeTarget: '-', bodyweight: true },
          { exerciseId: 'seated-leg-curl', exerciseName: 'Seated leg curl', sets: 3, repsTarget: '15', startingWeightKg: 40, rpeTarget: '7' },
          { exerciseId: 'seated-calf-raise', exerciseName: 'Seated calf raise', sets: 3, repsTarget: '20', startingWeightKg: null, rpeTarget: '7', notes: 'Calibrate' },
          { exerciseId: 'ab-wheel', exerciseName: 'Ab wheel', sets: 3, repsTarget: '10', startingWeightKg: null, rpeTarget: '-', bodyweight: true },
        ],
      },
    ],
  },
  { phase: 2, name: 'The Quest', startDate: '2026-07-01', endDate: '2026-08-31', days: [] },
  { phase: 3, name: 'The Peak', startDate: '2026-09-01', endDate: '2026-09-30', days: [] },
];

export const seedWorkingWeights: WorkingWeight[] = [
  { exerciseId: 'barbell-bench-press', exerciseName: 'Barbell bench press', weightKg: 100, lastUpdated: '2026-05-05' },
  { exerciseId: 'weighted-pull-up', exerciseName: 'Weighted pull-up', weightKg: 20, lastUpdated: '2026-05-05' },
  { exerciseId: 'barbell-ohp', exerciseName: 'Barbell OHP', weightKg: 65, lastUpdated: '2026-05-05' },
  { exerciseId: 'conventional-deadlift', exerciseName: 'Conventional deadlift', weightKg: 160, lastUpdated: '2026-05-05' },
  { exerciseId: 'romanian-deadlift', exerciseName: 'Romanian deadlift', weightKg: 80, lastUpdated: '2026-05-05' },
  { exerciseId: 'seated-leg-curl', exerciseName: 'Seated leg curl', weightKg: 50, lastUpdated: '2026-05-05' },
  { exerciseId: 'barbell-squat', exerciseName: 'Barbell back squat', weightKg: 80, lastUpdated: '2026-05-05' },
  { exerciseId: 'incline-db-press', exerciseName: 'Incline DB press', weightKg: 35, lastUpdated: '2026-05-05' },
  { exerciseId: 'lateral-raise-db', exerciseName: 'Lateral raise (DB)', weightKg: 8, lastUpdated: '2026-05-05' },
  { exerciseId: 'tricep-pushdown', exerciseName: 'Tricep pushdown', weightKg: 25, lastUpdated: '2026-05-05' },
];

export const seedGoals: Goal[] = [
  { id: 'bench-1rm', name: 'Bench press 1RM', unit: 'kg', current: 115, target: 140, higherIsBetter: true, targetDate: '2026-09-30' },
  { id: '5km-time', name: '5 km run time', unit: 'min', current: 32, target: 25, higherIsBetter: false, targetDate: '2026-09-30' },
  { id: 'weighted-pullup', name: 'Weighted pull-up', unit: 'kg', current: 20, target: 60, higherIsBetter: true, targetDate: '2026-09-30' },
  { id: 'bw-pullups', name: 'Bodyweight pull-ups', unit: 'reps', current: 8, target: 25, higherIsBetter: true, targetDate: '2026-09-30' },
  { id: 'body-weight', name: 'Body weight', unit: 'kg', current: 92.5, target: 83, higherIsBetter: false, targetDate: '2026-09-30' },
];

export const seedWeightLogs: WeightLog[] = [
  { id: 'bw-seed-1', date: '2026-05-02', weightKg: 92.5 },
];
