# Quest for Fitness — App Handover Document
> Feed this document to Claude Code or ChatGPT Codex as the opening prompt for the project.

---

## 1. What we're building

A personal fitness tracking app for one user (me). No auth, no multi-user, no backend required. The app tracks my workouts, logs bodyweight and running sessions, shows progress toward 5 specific goals, and tells me what to do today based on where I am in the program.

It should feel like a coach's logbook — fast to log, clear to read back, never in my way.

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

## 6. Core features — prioritised

Build in this order. Stop when it feels usable.

### MVP (must have)

**1. Today's session view**
- Show the programmed session for today based on the current date and phase
- For each exercise: show name, target sets × reps, target weight (pulled from working weights or program default), RPE target
- Simple tap-to-log flow: tap a set → enter reps, weight, RPE → confirm → set marked done
- Session complete → session saved to log

**2. Session history**
- Chronological list of past sessions
- Tap to expand and see full exercise log
- Show the date, day type, and total session time if captured

**3. Working weights**
- A simple table showing current working weight per exercise
- Auto-updates when a session log shows weight increased
- Manual override allowed

**4. Goals dashboard**
- 5 goal cards showing current vs target
- Progress bar for each goal
- Current values should be editable (user manually enters 1RM tests, run times, etc.)
- Body weight pulls from the most recent WeightLog automatically

**5. Body weight log**
- Quick entry: date + weight in kg
- Small chart showing trend over time

### Nice to have (add after MVP)

**6. Run log**
- Log a run: distance + duration → auto-compute pace
- List of recent runs
- Simple pace trend line

**7. Progression flags**
- Highlight exercises where the user has hit the top of the rep range at target RPE for 2 consecutive sessions
- Show a "+2.5 kg" or "+5 kg" suggestion next to the exercise

**8. Week summary**
- Count of gym sessions this week vs target (4)
- Count of runs this week vs phase target
- Current streak of weeks hitting target sessions

**9. Phase timeline**
- Visual bar showing current position in the overall program (May → September)
- Countdown to September 30

---

## 7. UX requirements

- **Mobile first.** This will be used in the gym on a phone. Big tap targets, minimal typing.
- **Fast logging.** The log flow must be: open app → today's session → tap set → enter weight/reps → done. No more than 3 taps to start logging a set.
- **Pre-fill weights.** When opening a session, pre-fill the weight field for each exercise with the current working weight. User only needs to change it if something is different.
- **RPE is optional.** Don't require RPE to complete a set log. But surface it clearly when present.
- **No login.** Single user, local storage only. No accounts, no sync (yet).
- **Dark mode.** I train in the morning in a gym. Dark mode is default or follows system.
- **Offline first.** Must work with no internet connection.

---

## 8. Suggested tech stack

Preferred: **React + Vite + TypeScript + localStorage**

Rationale: fast to scaffold, no backend needed, works as a PWA, easy to add to home screen on iOS.

Optional additions worth considering:
- **Tailwind CSS** for styling
- **Recharts or Chart.js** for progress graphs
- **date-fns** for date calculations
- **Zustand or Context API** for state management
- **Vite PWA plugin** to enable "add to home screen" on iOS/Android

Avoid: anything that requires a server to run, anything that requires a database, any framework that adds significant complexity for a single-user local app.

---

## 9. Initial data to seed on first launch

On first launch (empty localStorage), seed the following:

**Working weights:**
```json
[
  { "exerciseId": "barbell-bench-press",   "exerciseName": "Barbell bench press",   "weightKg": 100, "lastUpdated": "2025-05-05" },
  { "exerciseId": "weighted-pull-up",      "exerciseName": "Weighted pull-up",      "weightKg": 20,  "lastUpdated": "2025-05-05" },
  { "exerciseId": "barbell-ohp",           "exerciseName": "Barbell OHP",           "weightKg": 65,  "lastUpdated": "2025-05-05" },
  { "exerciseId": "conventional-deadlift", "exerciseName": "Conventional deadlift", "weightKg": 160, "lastUpdated": "2025-05-05" },
  { "exerciseId": "romanian-deadlift",     "exerciseName": "Romanian deadlift",     "weightKg": 80,  "lastUpdated": "2025-05-05" },
  { "exerciseId": "seated-leg-curl",       "exerciseName": "Seated leg curl",       "weightKg": 50,  "lastUpdated": "2025-05-05" },
  { "exerciseId": "barbell-squat",         "exerciseName": "Barbell back squat",    "weightKg": 80,  "lastUpdated": "2025-05-05" },
  { "exerciseId": "incline-db-press",      "exerciseName": "Incline DB press",      "weightKg": 35,  "lastUpdated": "2025-05-05" },
  { "exerciseId": "lateral-raise-db",      "exerciseName": "Lateral raise (DB)",    "weightKg": 8,   "lastUpdated": "2025-05-05" },
  { "exerciseId": "tricep-pushdown",       "exerciseName": "Tricep pushdown",       "weightKg": 25,  "lastUpdated": "2025-05-05" }
]
```

**Goals:**
```json
[
  { "id": "bench-1rm",       "name": "Bench press 1RM",    "unit": "kg",  "current": 115,  "target": 140, "higherIsBetter": true,  "targetDate": "2025-09-30" },
  { "id": "5km-time",        "name": "5 km run time",      "unit": "min", "current": 32.0, "target": 25,  "higherIsBetter": false, "targetDate": "2025-09-30" },
  { "id": "weighted-pullup", "name": "Weighted pull-up",   "unit": "kg",  "current": 20,   "target": 60,  "higherIsBetter": true,  "targetDate": "2025-09-30" },
  { "id": "bw-pullups",      "name": "Bodyweight pull-ups","unit": "reps","current": 8,    "target": 25,  "higherIsBetter": true,  "targetDate": "2025-09-30" },
  { "id": "body-weight",     "name": "Body weight",        "unit": "kg",  "current": 92.5, "target": 83,  "higherIsBetter": false, "targetDate": "2025-09-30" }
]
```

**Initial body weight log entry:**
```json
[
  { "id": "bw-seed-1", "date": "2025-05-02", "weightKg": 92.5 }
]
```

---

## 10. Out of scope (for now)

- Multi-user / auth
- Cloud sync
- Social features
- Nutrition logging (diet is tracked loosely, not in this app)
- AI coaching (that's handled in the separate Claude project)
- Calendar integration
- Wearable integration

---

## 11. Notes for the AI building this

- The program data (sessions, exercises, target weights) should be stored as a **static JSON config file**, not in localStorage. It is the "source of truth" for what to do. The logs are what actually happened.
- The "today's session" logic should: (1) determine the current phase from today's date, (2) determine the next unlogged session day in the A/B/C/D rotation, (3) pre-fill it with working weights.
- The A/B/C/D rotation is Monday/Tuesday/Thursday/Friday. If today is not a gym day, show the next upcoming session.
- Exercises marked "calibrate" in the program data have no starting weight — the weight field should show empty and the user enters it fresh on session 1.
- "BW" exercises (bodyweight) should store weight as `null` — handle this gracefully in the UI (don't show "null kg").
- All dates are stored as ISO strings ("2025-05-05"). Use date-fns or native Date objects for calculations, not string comparisons.
- Keep the codebase simple. This is a solo personal tool, not a product. Prefer clarity over abstraction.

---

*Generated: May 2025. Feed this document as the opening system prompt or first message to Claude Code / ChatGPT Codex.*
