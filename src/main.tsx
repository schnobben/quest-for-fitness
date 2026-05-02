import React, { useEffect, useMemo, useState } from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';
import { formatDate, getSessionPlan, isoDate, parseDurationToSeconds, secondsToPace } from './dateUtils';
import { programPhases } from './program';
import { registerServiceWorker } from './registerServiceWorker';
import { createId, exportAppData, loadAppData, saveAppData, type AppData } from './storage';
import type { ExerciseLog, Goal, ProgramExercise, SetLog, WeightLog, WorkingWeight } from './types';

type View = 'today' | 'history' | 'weights' | 'goals' | 'body' | 'runs';

const nav: Array<{ id: View; label: string }> = [
  { id: 'today', label: 'Today' },
  { id: 'history', label: 'History' },
  { id: 'weights', label: 'Weights' },
  { id: 'goals', label: 'Goals' },
  { id: 'body', label: 'Body' },
  { id: 'runs', label: 'Runs' },
];

function App() {
  const [view, setView] = useState<View>('today');
  const [data, setData] = useState<AppData>(() => loadAppData());

  useEffect(() => saveAppData(data), [data]);

  const latestWeight = [...data.weights].sort((a, b) => b.date.localeCompare(a.date))[0];
  const goals = useMemo(() => {
    return data.goals.map((goal) => goal.id === 'body-weight' && latestWeight ? { ...goal, current: latestWeight.weightKg } : goal);
  }, [data.goals, latestWeight]);

  function updateData(next: Partial<AppData>) {
    setData((current) => ({ ...current, ...next }));
  }

  return (
    <div className="app">
      <header className="topbar">
        <div>
          <p className="eyebrow">Quest for Fitness</p>
          <h1>Coach Logbook</h1>
        </div>
        <div className="phase-pill">{programPhases[0].name}</div>
      </header>

      <main>
        {view === 'today' && <TodayView data={data} updateData={updateData} />}
        {view === 'history' && <HistoryView data={data} />}
        {view === 'weights' && <WeightsView data={data} updateData={updateData} />}
        {view === 'goals' && <GoalsView goals={goals} rawGoals={data.goals} updateGoals={(next) => updateData({ goals: next })} />}
        {view === 'body' && <BodyView weights={data.weights} updateWeights={(weights) => updateData({ weights })} />}
        {view === 'runs' && <RunsView data={data} updateData={updateData} />}
      </main>

      <nav className="bottom-nav" aria-label="Primary">
        {nav.map((item) => (
          <button key={item.id} className={view === item.id ? 'active' : ''} onClick={() => setView(item.id)}>
            {item.label}
          </button>
        ))}
      </nav>
    </div>
  );
}

function TodayView({ data, updateData }: { data: AppData; updateData: (next: Partial<AppData>) => void }) {
  const plan = getSessionPlan(data.sessions);
  const [draft, setDraft] = useState<Record<string, SetLog[]>>(() => buildDraft(plan.day.exercises, data.workingWeights));
  const [sessionNotes, setSessionNotes] = useState('');

  useEffect(() => setDraft(buildDraft(plan.day.exercises, data.workingWeights)), [plan.day.id, data.workingWeights]);

  function updateSet(exercise: ProgramExercise, setIndex: number, patch: Partial<SetLog>) {
    setDraft((current) => {
      const sets = current[exercise.exerciseId] ?? [];
      return {
        ...current,
        [exercise.exerciseId]: sets.map((set, index) => index === setIndex ? { ...set, ...patch } : set),
      };
    });
  }

  function completeSession() {
    const exercises: ExerciseLog[] = plan.day.exercises.map((exercise) => ({
      exerciseId: exercise.exerciseId,
      exerciseName: exercise.exerciseName,
      sets: draft[exercise.exerciseId] ?? [],
    }));
    const nextWeights = mergeWorkingWeights(data.workingWeights, exercises, plan.plannedDate);
    updateData({
      sessions: [
        {
          id: createId('session'),
          date: plan.plannedDate,
          programDayId: plan.day.id,
          phase: plan.phase.phase,
          week: plan.week,
          exercises,
          sessionNotes: sessionNotes.trim() || undefined,
          completedAt: new Date().toISOString(),
        },
        ...data.sessions,
      ],
      workingWeights: nextWeights,
    });
    setSessionNotes('');
  }

  const doneSets = Object.values(draft).flat().filter((set) => set.reps > 0).length;
  const totalSets = plan.day.exercises.reduce((sum, exercise) => sum + exercise.sets, 0);

  return (
    <section className="stack">
      <div className="hero-panel">
        <div>
          <p className="eyebrow">Next session</p>
          <h2>{plan.day.name}</h2>
          <p>{formatDate(plan.plannedDate)} · Week {plan.week} · {plan.day.scheduledDay}</p>
        </div>
        <div className="big-count">{doneSets}/{totalSets}</div>
      </div>

      <div className="exercise-list">
        {plan.day.exercises.map((exercise) => {
          const sets = draft[exercise.exerciseId] ?? [];
          const targetWeight = getTargetWeight(exercise, data.workingWeights);
          return (
            <article className="exercise-card" key={exercise.exerciseId}>
              <div className="exercise-head">
                <div>
                  <h3>{exercise.exerciseName}</h3>
                  <p>{exercise.sets} x {exercise.repsTarget} · RPE {exercise.rpeTarget}</p>
                </div>
                <strong>{exercise.bodyweight ? 'BW' : targetWeight == null ? 'Open' : `${targetWeight} kg`}</strong>
              </div>
              <div className="set-grid">
                {sets.map((set, index) => (
                  <div className={set.reps > 0 ? 'set-row done' : 'set-row'} key={index}>
                    <span>Set {index + 1}</span>
                    <input inputMode="numeric" aria-label={`${exercise.exerciseName} set ${index + 1} reps`} value={set.reps || ''} placeholder="reps" onChange={(event) => updateSet(exercise, index, { reps: Number(event.target.value) || 0 })} />
                    <input inputMode="decimal" aria-label={`${exercise.exerciseName} set ${index + 1} weight`} value={set.weight ?? ''} placeholder={exercise.bodyweight ? 'BW' : 'kg'} disabled={exercise.bodyweight} onChange={(event) => updateSet(exercise, index, { weight: event.target.value === '' ? null : Number(event.target.value) })} />
                    <input inputMode="decimal" aria-label={`${exercise.exerciseName} set ${index + 1} RPE`} value={set.rpe ?? ''} placeholder="RPE" onChange={(event) => updateSet(exercise, index, { rpe: event.target.value === '' ? null : Number(event.target.value) })} />
                  </div>
                ))}
              </div>
            </article>
          );
        })}
      </div>

      <textarea className="notes" placeholder="Session notes" value={sessionNotes} onChange={(event) => setSessionNotes(event.target.value)} />
      <button className="primary-action" onClick={completeSession} disabled={doneSets === 0}>Complete Session</button>
    </section>
  );
}

function HistoryView({ data }: { data: AppData }) {
  const [exportStatus, setExportStatus] = useState('');

  async function handleExport() {
    try {
      await exportAppData(data);
      setExportStatus('Export ready.');
    } catch (error) {
      if (error instanceof DOMException && error.name === 'AbortError') return;
      setExportStatus('Export failed. Try again from Chrome.');
    }
  }

  return (
    <section className="stack">
      <SectionTitle title="Session History" detail={`${data.sessions.length} logged`} />
      <div className="export-card">
        <div>
          <h3>Coach Export</h3>
          <p>JSON file with workouts, runs, body weight, goals, working weights, and program context.</p>
          {exportStatus && <small>{exportStatus}</small>}
        </div>
        <button className="secondary-action" onClick={handleExport}>Export JSON</button>
      </div>
      {data.sessions.length === 0 ? <Empty text="No sessions logged yet." /> : data.sessions.map((session) => (
        <details className="history-item" key={session.id}>
          <summary>
            <strong>{formatDate(session.date)}</strong>
            <span>{session.programDayId.toUpperCase()} · Week {session.week}</span>
          </summary>
          {session.exercises.map((exercise) => (
            <div className="history-exercise" key={exercise.exerciseId}>
              <h4>{exercise.exerciseName}</h4>
              <p>{exercise.sets.map((set) => `${set.reps || '-'} x ${set.weight == null ? 'BW' : `${set.weight} kg`}${set.rpe ? ` @${set.rpe}` : ''}`).join(' · ')}</p>
            </div>
          ))}
          {session.sessionNotes && <p className="muted">{session.sessionNotes}</p>}
        </details>
      ))}
    </section>
  );
}

function WeightsView({ data, updateData }: { data: AppData; updateData: (next: Partial<AppData>) => void }) {
  function updateWeight(item: WorkingWeight, value: string) {
    const next = data.workingWeights.map((weight) => weight.exerciseId === item.exerciseId
      ? { ...weight, weightKg: value === '' ? null : Number(value), lastUpdated: isoDate() }
      : weight);
    updateData({ workingWeights: next });
  }

  return (
    <section className="stack">
      <SectionTitle title="Working Weights" detail="Manual overrides allowed" />
      <div className="table-list">
        {data.workingWeights.map((item) => (
          <label className="weight-row" key={item.exerciseId}>
            <span>
              <strong>{item.exerciseName}</strong>
              <small>{item.lastUpdated}</small>
            </span>
            <input inputMode="decimal" value={item.weightKg ?? ''} placeholder="kg" onChange={(event) => updateWeight(item, event.target.value)} />
          </label>
        ))}
      </div>
    </section>
  );
}

function GoalsView({ goals, rawGoals, updateGoals }: { goals: Goal[]; rawGoals: Goal[]; updateGoals: (goals: Goal[]) => void }) {
  function updateGoal(goal: Goal, value: string) {
    updateGoals(rawGoals.map((item) => item.id === goal.id ? { ...item, current: Number(value) || 0 } : item));
  }

  return (
    <section className="stack">
      <SectionTitle title="Goals" detail="Target: Sep 30" />
      <div className="goal-grid">
        {goals.map((goal) => {
          const progress = goalProgress(goal);
          return (
            <article className="goal-card" key={goal.id}>
              <div className="exercise-head">
                <h3>{goal.name}</h3>
                <strong>{Math.round(progress)}%</strong>
              </div>
              <div className="progress"><span style={{ width: `${Math.min(100, Math.max(0, progress))}%` }} /></div>
              <label>
                <span>Current {goal.unit}</span>
                <input inputMode="decimal" disabled={goal.id === 'body-weight'} value={goal.current} onChange={(event) => updateGoal(goal, event.target.value)} />
              </label>
              <p className="muted">Target {goal.target} {goal.unit}</p>
            </article>
          );
        })}
      </div>
    </section>
  );
}

function BodyView({ weights, updateWeights }: { weights: WeightLog[]; updateWeights: (weights: WeightLog[]) => void }) {
  const [date, setDate] = useState(isoDate());
  const [weight, setWeight] = useState('');
  const sorted = [...weights].sort((a, b) => a.date.localeCompare(b.date));

  function addWeight() {
    const value = Number(weight);
    if (!value) return;
    updateWeights([{ id: createId('weight'), date, weightKg: value }, ...weights]);
    setWeight('');
  }

  return (
    <section className="stack">
      <SectionTitle title="Body Weight" detail={`${weights.length} entries`} />
      <div className="entry-row">
        <input type="date" value={date} onChange={(event) => setDate(event.target.value)} />
        <input inputMode="decimal" placeholder="kg" value={weight} onChange={(event) => setWeight(event.target.value)} />
        <button onClick={addWeight}>Add</button>
      </div>
      <TrendChart points={sorted.map((item) => item.weightKg)} labels={sorted.map((item) => item.date)} />
      <div className="table-list">
        {[...weights].sort((a, b) => b.date.localeCompare(a.date)).map((item) => (
          <div className="plain-row" key={item.id}><span>{formatDate(item.date)}</span><strong>{item.weightKg} kg</strong></div>
        ))}
      </div>
    </section>
  );
}

function RunsView({ data, updateData }: { data: AppData; updateData: (next: Partial<AppData>) => void }) {
  const [date, setDate] = useState(isoDate());
  const [distance, setDistance] = useState('');
  const [duration, setDuration] = useState('');
  const sorted = [...data.runs].sort((a, b) => a.date.localeCompare(b.date));

  function addRun() {
    const distanceKm = Number(distance);
    const durationSeconds = parseDurationToSeconds(duration);
    if (!distanceKm || !durationSeconds) return;
    updateData({
      runs: [{
        id: createId('run'),
        date,
        distanceKm,
        durationSeconds,
        pacePerKm: durationSeconds / distanceKm,
      }, ...data.runs],
    });
    setDistance('');
    setDuration('');
  }

  return (
    <section className="stack">
      <SectionTitle title="Run Log" detail="Pace auto-calculated" />
      <div className="entry-row run-entry">
        <input type="date" value={date} onChange={(event) => setDate(event.target.value)} />
        <input inputMode="decimal" placeholder="km" value={distance} onChange={(event) => setDistance(event.target.value)} />
        <input inputMode="numeric" placeholder="mm:ss" value={duration} onChange={(event) => setDuration(event.target.value)} />
        <button onClick={addRun}>Add</button>
      </div>
      <TrendChart points={sorted.map((item) => item.pacePerKm / 60)} labels={sorted.map((item) => item.date)} invert />
      <div className="table-list">
        {[...data.runs].sort((a, b) => b.date.localeCompare(a.date)).map((item) => (
          <div className="plain-row" key={item.id}><span>{formatDate(item.date)} · {item.distanceKm} km</span><strong>{secondsToPace(item.pacePerKm)}</strong></div>
        ))}
      </div>
    </section>
  );
}

function buildDraft(exercises: ProgramExercise[], weights: WorkingWeight[]): Record<string, SetLog[]> {
  return Object.fromEntries(exercises.map((exercise) => {
    const targetWeight = exercise.bodyweight ? null : getTargetWeight(exercise, weights);
    return [exercise.exerciseId, Array.from({ length: exercise.sets }, () => ({ reps: 0, weight: targetWeight, rpe: null }))];
  }));
}

function getTargetWeight(exercise: ProgramExercise, weights: WorkingWeight[]) {
  return weights.find((weight) => weight.exerciseId === exercise.exerciseId)?.weightKg ?? exercise.startingWeightKg;
}

function mergeWorkingWeights(weights: WorkingWeight[], exercises: ExerciseLog[], date: string): WorkingWeight[] {
  const next = [...weights];
  exercises.forEach((exercise) => {
    const heaviest = Math.max(...exercise.sets.map((set) => set.weight ?? Number.NEGATIVE_INFINITY));
    if (!Number.isFinite(heaviest)) return;
    const index = next.findIndex((item) => item.exerciseId === exercise.exerciseId);
    if (index >= 0 && (next[index].weightKg == null || heaviest >= next[index].weightKg)) {
      next[index] = { ...next[index], weightKg: heaviest, lastUpdated: date };
    } else if (index === -1) {
      next.push({ exerciseId: exercise.exerciseId, exerciseName: exercise.exerciseName, weightKg: heaviest, lastUpdated: date });
    }
  });
  return next.sort((a, b) => a.exerciseName.localeCompare(b.exerciseName));
}

function goalProgress(goal: Goal) {
  const start = goal.id === 'body-weight' ? 92.5 : goal.higherIsBetter ? 0 : goal.current + Math.abs(goal.current - goal.target);
  const total = Math.abs(goal.target - start) || 1;
  const current = Math.abs(goal.current - start);
  return (current / total) * 100;
}

function TrendChart({ points, invert = false }: { points: number[]; labels: string[]; invert?: boolean }) {
  if (points.length < 2) return <Empty text="Add another entry to see a trend." />;
  const min = Math.min(...points);
  const max = Math.max(...points);
  const spread = max - min || 1;
  const coords = points.map((point, index) => {
    const x = (index / (points.length - 1)) * 100;
    const rawY = ((point - min) / spread) * 80 + 10;
    const y = invert ? rawY : 100 - rawY;
    return `${x},${y}`;
  }).join(' ');

  return (
    <svg className="trend" viewBox="0 0 100 100" preserveAspectRatio="none" role="img" aria-label="Trend chart">
      <polyline points={coords} />
    </svg>
  );
}

function SectionTitle({ title, detail }: { title: string; detail: string }) {
  return (
    <div className="section-title">
      <h2>{title}</h2>
      <span>{detail}</span>
    </div>
  );
}

function Empty({ text }: { text: string }) {
  return <p className="empty">{text}</p>;
}

createRoot(document.getElementById('root')!).render(<App />);
registerServiceWorker();
