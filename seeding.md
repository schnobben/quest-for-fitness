# Quest for Fitness — App Handover Document
> Feed this document to Claude Code or ChatGPT Codex as the opening prompt for the project.

---

## 2. The program context

I am running a structured 3-phase program ending September 30. This app tracks me through all three phases.

### The five goals (to be hit by end of September)

| Goal | Current | Target |
|---|---|---|
| Bench press 1RM | 115 kg | 140 kg |
| 5 km run time | 32:00 | 25:00 |
| Weighted pull-up | +20 kg | +60 kg |
| Bodyweight pull-ups | 8 reps | 25 reps |
| Body weight | 92.5 kg | 83.0 kg |

### Phase overview

| Phase | Name | Dates | Gym | Notes |
|---|---|---|---|---|
| 1 | The Foundation | May 5 – June 29 | 4×/week mornings | Habit rebuild, easy running, no macro tracking |
| 2 | The Quest | July 1 – Aug 31 | 5×/week evenings | Paternity leave, intervals introduced, macro tracking |
| 3 | The Peak | Sep 1 – Sep 30 | 5×/week | Bench peak, all goal tests final week |

---

## 3. Phase 1 program — the sessions

This is the hardcoded program for Phase 1. Phases 2 and 3 will be added later — the app should support adding new program blocks without rebuilding.

### Day A — Upper strength (Monday)

| Exercise | Sets | Reps | Starting weight | RPE target |
|---|---|---|---|---|
| Barbell bench press | 5 | 4 | 100 kg | 8–9 |
| Weighted pull-up | 5 | 4 | +20 kg | 8–9 |
| Barbell OHP | 3 | 6 | 65 kg | 8 |
| Pendlay row | 3 | 8 | calibrate | 7–8 |
| Face pull (cable) | 3 | 15 | light | 7 |
| Barbell curl | 3 | 10 | calibrate | 7–8 |

### Day B — Lower strength (Tuesday)

| Exercise | Sets | Reps | Starting weight | RPE target |
|---|---|---|---|---|
| Conventional deadlift | 4 | 4 | 160 kg | 8–9 |
| Romanian deadlift | 3 | 8 | 80 kg | 8 |
| Leg press | 3 | 10 | calibrate | 7–8 |
| Seated leg curl | 3 | 12 | 50 kg | 7–8 |
| Hanging leg raise | 3 | 12 | BW | — |

### Day C — Upper volume (Thursday)

| Exercise | Sets | Reps | Starting weight | RPE target |
|---|---|---|---|---|
| Barbell bench press | 4 | 8–10 | 80 kg | 7–8 |
| Incline DB press | 3 | 10–12 | 35 kg | 7–8 |
| Lat pulldown | 4 | 10–12 | calibrate | 7–8 |
| Machine row | 3 | 12–15 | calibrate | 7–8 |
| Lateral raise (DB) | 4 | 15–20 | 8 kg | 7–8 |
| Tricep pushdown (cable) | 3 | 15 | 25 kg | 7 |
| Incline DB curl | 3 | 12 | calibrate | 7 |

### Day D — Lower volume (Friday or Saturday)

| Exercise | Sets | Reps | Starting weight | RPE target |
|---|---|---|---|---|
| Barbell back squat | 4 | 6–8 | 80 kg | 7 |
| Leg press | 3 | 12–15 | calibrate | 7–8 |
| Nordic curl | 3 | 5–8 | BW | — |
| Seated leg curl | 3 | 15 | 40 kg | 7 |
| Seated calf raise | 3 | 20 | calibrate | 7 |
| Ab wheel | 3 | 10 | BW | — |

### Progression rule
- Hit the top of the rep range at target RPE for **2 consecutive sessions** → increase weight
- Upper body compounds: +2.5 kg
- Lower body compounds: +5 kg
- Accessories: add reps first, then add weight

---

## 4. Running log

Running sessions are separate from gym sessions. Each run entry captures:
- Date
- Distance (km)
- Duration (mm:ss)
- Computed pace (auto-calculated)
- Notes (optional)

Phase 1 running plan (for reference display in app):

| Weeks | Sessions/week | Duration | Type |
|---|---|---|---|
| 1–2 | 2 | 25 min | Easy |
| 3–4 | 2 | 30 min | Easy |
| 5–6 | 3 | 25–30 min | Easy |
| 7–8 | 3 | 25–30 min | 2 easy + 1 with 4× 1-min pickups |

---

## 5. Data models

Use these as the canonical TypeScript interfaces. Persist everything to `localStorage` (no backend).

```typescript
// A single set within an exercise
interface SetLog {
  reps: number;
  weight: number | null;  // null for bodyweight
  rpe: number | null;     // 1–10, optional
  notes?: string;
}

// One exercise within a session
interface ExerciseLog {
  exerciseId: string;     // e.g. "barbell-bench-press"
  exerciseName: string;
  sets: SetLog[];
}

// A logged gym session
interface SessionLog {
  id: string;             // uuid
  date: string;           // ISO date "2025-05-05"
  programDayId: string;   // "day-a" | "day-b" | "day-c" | "day-d"
  phase: 1 | 2 | 3;
  week: number;           // week number within the phase
  exercises: ExerciseLog[];
  sessionNotes?: string;
  energyRating?: 1 | 2 | 3 | 4 | 5;  // optional session feel rating
}

// A logged run
interface RunLog {
  id: string;
  date: string;
  distanceKm: number;
  durationSeconds: number;
  pacePerKm: number;      // auto-calculated: durationSeconds / distanceKm
  notes?: string;
}

// Body weight check-in
interface WeightLog {
  id: string;
  date: string;
  weightKg: number;
  notes?: string;
}

// Working weight for an exercise (current best known weight for that exercise)
interface WorkingWeight {
  exerciseId: string;
  exerciseName: string;
  weightKg: number | null;
  lastUpdated: string;  // ISO date
}

// Goal definition
interface Goal {
  id: string;
  name: string;
  unit: string;
  current: number;
  target: number;
  higherIsBetter: boolean;  // false for bodyweight and run time
  targetDate: string;       // "2025-09-30"
}

// Programmed exercise (template, not a log)
interface ProgramExercise {
  exerciseId: string;
  exerciseName: string;
  sets: number;
  repsTarget: string;     // e.g. "4" or "8–10"
  startingWeightKg: number | null;
  rpeTarget: string;      // e.g. "8–9" or "7"
  notes?: string;
}

// Programmed day (template)
interface ProgramDay {
  id: string;             // "day-a" | "day-b" | "day-c" | "day-d"
  name: string;           // "Upper strength"
  scheduledDay: string;   // "Monday"
  exercises: ProgramExercise[];
}

// A phase of the program
interface ProgramPhase {
  phase: 1 | 2 | 3;
  name: string;
  startDate: string;
  endDate: string;
  days: ProgramDay[];
}
```

---
