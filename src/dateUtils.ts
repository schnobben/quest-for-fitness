import { programPhases } from './program';
import type { ProgramDay, ProgramPhase, SessionLog } from './types';

const dayMs = 24 * 60 * 60 * 1000;

export function isoDate(date = new Date()) {
  const local = new Date(date.getFullYear(), date.getMonth(), date.getDate());
  return local.toISOString().slice(0, 10);
}

export function parseIsoDate(value: string) {
  const [year, month, day] = value.split('-').map(Number);
  return new Date(year, month - 1, day);
}

export function daysBetween(startIso: string, endIso: string) {
  return Math.round((parseIsoDate(endIso).getTime() - parseIsoDate(startIso).getTime()) / dayMs);
}

export function getCurrentPhase(todayIso = isoDate()): ProgramPhase {
  const today = parseIsoDate(todayIso).getTime();
  return programPhases.find((phase) => today >= parseIsoDate(phase.startDate).getTime() && today <= parseIsoDate(phase.endDate).getTime())
    ?? programPhases[0];
}

export function getPhaseWeek(phase: ProgramPhase, todayIso = isoDate()) {
  const elapsed = Math.max(0, daysBetween(phase.startDate, todayIso));
  return Math.floor(elapsed / 7) + 1;
}

export function formatDate(value: string) {
  return new Intl.DateTimeFormat(undefined, { month: 'short', day: 'numeric', weekday: 'short' }).format(parseIsoDate(value));
}

export function getSessionPlan(sessions: SessionLog[], todayIso = isoDate()): { phase: ProgramPhase; day: ProgramDay; plannedDate: string; week: number } {
  const phase = getCurrentPhase(todayIso);
  const phaseSessions = sessions
    .filter((session) => session.phase === phase.phase)
    .sort((a, b) => a.date.localeCompare(b.date));
  const nextIndex = phase.days.length ? phaseSessions.length % phase.days.length : 0;
  const day = phase.days[nextIndex] ?? programPhases[0].days[0];
  const start = parseIsoDate(todayIso);

  for (let offset = 0; offset < 14; offset += 1) {
    const candidate = new Date(start);
    candidate.setDate(start.getDate() + offset);
    if (candidate.getDay() === day.weekday) {
      const plannedDate = isoDate(candidate);
      return { phase, day, plannedDate, week: getPhaseWeek(phase, plannedDate) };
    }
  }

  return { phase, day, plannedDate: todayIso, week: getPhaseWeek(phase, todayIso) };
}

export function secondsToPace(seconds: number) {
  const minutes = Math.floor(seconds / 60);
  const remainder = Math.round(seconds % 60).toString().padStart(2, '0');
  return `${minutes}:${remainder}/km`;
}

export function parseDurationToSeconds(value: string) {
  const parts = value.split(':').map(Number);
  if (parts.some(Number.isNaN)) return 0;
  if (parts.length === 2) return parts[0] * 60 + parts[1];
  if (parts.length === 3) return parts[0] * 3600 + parts[1] * 60 + parts[2];
  return Number(value) * 60;
}
