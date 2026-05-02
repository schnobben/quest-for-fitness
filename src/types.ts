export interface SetLog {
  reps: number;
  weight: number | null;
  rpe: number | null;
  notes?: string;
}

export interface ExerciseLog {
  exerciseId: string;
  exerciseName: string;
  sets: SetLog[];
}

export interface SessionLog {
  id: string;
  date: string;
  programDayId: string;
  phase: 1 | 2 | 3;
  week: number;
  exercises: ExerciseLog[];
  sessionNotes?: string;
  energyRating?: 1 | 2 | 3 | 4 | 5;
  completedAt?: string;
}

export interface RunLog {
  id: string;
  date: string;
  distanceKm: number;
  durationSeconds: number;
  pacePerKm: number;
  notes?: string;
}

export interface WeightLog {
  id: string;
  date: string;
  weightKg: number;
  notes?: string;
}

export interface WorkingWeight {
  exerciseId: string;
  exerciseName: string;
  weightKg: number | null;
  lastUpdated: string;
}

export interface Goal {
  id: string;
  name: string;
  unit: string;
  current: number;
  target: number;
  higherIsBetter: boolean;
  targetDate: string;
}

export interface ProgramExercise {
  exerciseId: string;
  exerciseName: string;
  sets: number;
  repsTarget: string;
  startingWeightKg: number | null;
  rpeTarget: string;
  notes?: string;
  bodyweight?: boolean;
}

export interface ProgramDay {
  id: string;
  name: string;
  scheduledDay: string;
  weekday: number;
  exercises: ProgramExercise[];
}

export interface ProgramPhase {
  phase: 1 | 2 | 3;
  name: string;
  startDate: string;
  endDate: string;
  days: ProgramDay[];
}
