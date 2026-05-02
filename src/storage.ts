import { seedGoals, seedWeightLogs, seedWorkingWeights } from './program';
import type { Goal, RunLog, SessionLog, WeightLog, WorkingWeight } from './types';

const keys = {
  sessions: 'qff:sessions',
  runs: 'qff:runs',
  weights: 'qff:weights',
  workingWeights: 'qff:working-weights',
  goals: 'qff:goals',
};

function read<T>(key: string, fallback: T): T {
  const raw = localStorage.getItem(key);
  if (!raw) return fallback;

  try {
    return JSON.parse(raw) as T;
  } catch {
    return fallback;
  }
}

function write<T>(key: string, value: T) {
  localStorage.setItem(key, JSON.stringify(value));
}

export interface AppData {
  sessions: SessionLog[];
  runs: RunLog[];
  weights: WeightLog[];
  workingWeights: WorkingWeight[];
  goals: Goal[];
}

export function loadAppData(): AppData {
  return {
    sessions: read<SessionLog[]>(keys.sessions, []),
    runs: read<RunLog[]>(keys.runs, []),
    weights: read<WeightLog[]>(keys.weights, seedWeightLogs),
    workingWeights: read<WorkingWeight[]>(keys.workingWeights, seedWorkingWeights),
    goals: read<Goal[]>(keys.goals, seedGoals),
  };
}

export function saveAppData(data: AppData) {
  write(keys.sessions, data.sessions);
  write(keys.runs, data.runs);
  write(keys.weights, data.weights);
  write(keys.workingWeights, data.workingWeights);
  write(keys.goals, data.goals);
}

export function createId(prefix: string) {
  if ('randomUUID' in crypto) return `${prefix}-${crypto.randomUUID()}`;
  return `${prefix}-${Date.now()}-${Math.random().toString(16).slice(2)}`;
}
