# Quest for Fitness - Technical Architecture

**Document status:** Architecture draft 1  
**Primary sources:** `app_design.md`, `development_roadmap.md`  
**Target platforms:** iOS and Android  
**Primary stack:** Flutter + Dart  
**Persistence direction:** Local-first SQLite through Drift  
**Update rule:** Update this document whenever a structural architecture decision changes.

---

## 1. Purpose

This document explains how the major systems in Quest for Fitness fit together. It is the reference document for developers and AI coding agents when making structural decisions.

The app should be built as a serious fitness tracker first, with RPG systems layered on through events and rewards. Fitness logging must remain fast, reliable, and usable even if every RPG feature is disabled.

Core architectural principle:

```text
Fitness data is the source of truth.
Quest, pet, achievement, and reward systems react to fitness events.
```

---

## 2. Current architectural status

The project is currently in product and architecture planning. The intended implementation is a Flutter mobile application with a modular feature structure, local-first storage, and later optional cloud sync, accounts, and subscriptions.

The May-September 2026 personal training campaign is seed content. It must not be hardcoded as the only supported program structure.

---

## 3. Product architecture overview

Quest for Fitness has five major product systems.

### 3.1 Fitness Engine

The Fitness Engine owns real-world training functionality.

Responsibilities:

- exercise library
- workout templates
- program templates
- scheduled workouts
- workout execution
- set logging
- session history
- bodyweight and body metric logs
- cardio logs
- goals
- progression rules
- fitness analytics
- personal records
- discomfort notes

The Fitness Engine must not depend on RPG state to save or display training data.

### 3.2 Quest Engine

The Quest Engine translates completed fitness behavior into RPG progression.

Responsibilities:

- Adventurer profile
- XP and levels
- classes and titles
- attributes
- achievements
- equipment and cosmetics
- quests and campaigns
- reward history

The Quest Engine consumes fitness events such as `WorkoutCompleted` and produces reward events such as `XpGranted`.

### 3.3 Pet System

The Pet System is a companion progression layer.

Responsibilities:

- pet profile
- bond
- mood
- energy
- growth and evolution
- care actions
- expedition readiness
- pet event history

The Pet System reacts to fitness and reward events. Missed workouts should create neutral rest or comeback states, never shame or punishment states.

### 3.4 Data Layer

The Data Layer owns persistence and data access.

Responsibilities:

- Drift database
- SQLite schema
- migrations
- seed data loading
- repositories
- export/import
- future sync adapters

Feature modules should access persistent data through repositories or query services, not by directly coupling UI code to database tables.

### 3.5 Entitlement Layer

The Entitlement Layer separates free and premium capabilities.

Responsibilities:

- entitlement state
- feature gates
- locked UI state
- development premium toggle
- later billing provider integration

Real billing should be added after the free product has clear value. Core app logic should depend on feature gates, not on RevenueCat, StoreKit, or Google Play Billing directly.

---

## 4. Recommended Flutter project structure

Use a modular package layout with clear boundaries between app shell, shared core utilities, features, and persistence.

```text
lib/
  app/
    routing/
    theme/
    shell/
  core/
    dates/
    ids/
    result/
    utils/
  features/
    fitness/
      exercises/
      workouts/
      programs/
      sessions/
      goals/
      body_metrics/
      cardio/
      analytics/
    quest/
      adventurer/
      classes/
      xp/
      achievements/
      equipment/
      titles/
      rewards/
    pet/
      companion/
      mood/
      evolution/
      care/
      expeditions/
    monetization/
      entitlements/
      subscriptions/
    settings/
      profile/
      backup_export/
  data/
    local_database/
    repositories/
    seed_data/
    migrations/
```

Default package choices:

- Riverpod for state management
- go_router for navigation
- Drift/SQLite for local persistence
- Freezed plus json_serializable for immutable models and JSON serialization
- fl_chart or equivalent for charts

These are defaults, not permanent constraints. If any choice changes, update this document.

---

## 5. Layer responsibilities

### 5.1 UI layer

The UI layer renders screens, collects user input, and dispatches user intents.

Rules:

- Workout logging screens must minimize taps and typing.
- Reward animations must be short and skippable.
- UI should not contain business rules for XP, achievements, goals, or progression.
- UI should use providers/controllers to access feature state.

### 5.2 Application/controller layer

Controllers coordinate user actions across repositories and services.

Examples:

- starting a planned workout
- logging a set
- completing a workout session
- adding a bodyweight log
- accepting a progression suggestion
- claiming or displaying reward results

Controllers may emit events after successful domain actions.

### 5.3 Domain/service layer

Domain services contain business rules.

Examples:

- determine today's planned workout
- calculate weekly adherence
- detect personal records
- calculate XP from a completed workout
- update achievement progress
- calculate pet bond changes
- evaluate entitlement gates

Domain services should be testable without Flutter widgets.

### 5.4 Repository layer

Repositories provide feature-oriented access to persistent data.

Examples:

- `ExerciseRepository`
- `WorkoutRepository`
- `ProgramRepository`
- `SessionRepository`
- `GoalRepository`
- `AdventurerRepository`
- `AchievementRepository`
- `PetRepository`
- `EntitlementRepository`

Repositories should hide Drift table details from feature UI and controllers.

### 5.5 Database layer

The database layer owns Drift tables, DAOs, migrations, and low-level queries.

Rules:

- Schema changes require migrations.
- Seed data should be idempotent.
- Deleting records that have dependent logs should be restricted, archived, or handled explicitly.
- Export/import should use stable DTOs rather than raw table internals when practical.

---

## 6. Data ownership

The following entities are owned by the Fitness Engine:

- `Exercise`
- `WorkoutTemplate`
- `WorkoutExerciseTemplate`
- `Program`
- `ProgramPhase`
- `ProgramWeek`
- `ScheduledWorkout`
- `SessionLog`
- `ExerciseLog`
- `SetLog`
- `CardioLog`
- `BodyMetricLog`
- `Goal`
- `GoalMilestone`
- `ProgressionRule`

The following entities are owned by the Quest Engine:

- `Adventurer`
- `AdventurerAttribute`
- `Achievement`
- `AchievementProgress`
- `EquipmentItem`
- `InventoryItem`
- `Title`
- `Quest`
- `CampaignReward`
- `RewardEvent`

The following entities are owned by the Pet System:

- `Pet`
- `PetEvent`
- `PetCareAction`
- `PetEvolutionStage`
- `Expedition`

The following entities are cross-cutting:

- `UserProfile`
- `Entitlement`
- `FeatureGate`
- `ExportBundle`
- `ImportResult`

Cross-system reads are allowed through repositories or read models. Cross-system writes should happen through explicit services or event processing.

---

## 7. Event and reward flow

Fitness actions should emit internal events after successful persistence.

Example flow:

```text
User completes workout
  -> SessionRepository saves SessionLog, ExerciseLog, SetLog
  -> FitnessEventBus emits WorkoutCompleted
  -> Quest reward processor grants XP and achievement progress
  -> Pet processor updates bond/energy
  -> RewardRepository stores reward events
  -> Completion screen displays summary
```

### 7.1 Fitness events

Initial event types:

- `WorkoutCompleted`
- `SetLogged`
- `PersonalRecordAchieved`
- `RunLogged`
- `BodyweightLogged`
- `GoalUpdated`
- `GoalMilestoneReached`
- `WeekTargetCompleted`
- `ProgramPhaseCompleted`
- `RecoveryLogged`

Fitness events should describe what happened in training terms. They should not contain UI display logic.

### 7.2 Reward events

Initial reward event types:

- `XpGranted`
- `LevelUp`
- `AchievementUnlocked`
- `AchievementProgressed`
- `EquipmentUnlocked`
- `TitleUnlocked`
- `PetBondIncreased`
- `PetEvolved`
- `ExpeditionCompleted`

Reward events should be stored as history so the app can show a progress timeline and completion summaries.

### 7.3 Event processing rules

- Event processing must be idempotent where duplicate processing could corrupt rewards.
- Quest and pet systems should not block the core fitness save path.
- If reward processing fails, the saved fitness log should remain valid.
- Reward summaries should be derived from stored reward events, not recalculated only in UI memory.

---

## 8. Navigation architecture

Use a bottom navigation shell for the main app.

Main tabs:

1. Today
2. Log
3. Progress
4. Quest
5. Library

Recommended responsibilities:

- Today: daily recommendation, active campaign, next planned workout, weekly summary, Adventurer and pet snapshot.
- Log: fast manual entry for workouts, runs, bodyweight, recovery, and recent logs.
- Progress: goals, charts, analytics, exercise history, PRs, adherence.
- Quest: Adventurer, XP, achievements, gear, pet, quests, expeditions.
- Library: exercises, workouts, programs, routines, campaigns, templates.

Settings can be reachable from the app shell or profile area. It should contain profile, backup/export, developer tools, and later account/subscription controls.

---

## 9. State management

Use Riverpod as the default state management approach.

Recommended pattern:

- repositories exposed as providers
- services exposed as providers
- screen controllers or notifiers for user workflows
- derived read models for dashboard data
- async providers for database-backed queries

State rules:

- Persisted training data belongs in SQLite, not only provider memory.
- Provider state may cache or derive data, but should be reloadable from persistence.
- Long workflows such as workout execution should save progress frequently enough to survive app restarts.
- Feature UI should depend on read models where possible instead of assembling complex cross-feature data directly.

---

## 10. Seed data strategy

The May-September 2026 campaign is the first seed campaign and sample program.

Corrected campaign phases:

| Phase | Name | Dates | Purpose |
|---|---|---|---|
| 1 | The Foundation | May 5-June 29, 2026 | Habit rebuild, easy running, baseline tracking |
| 2 | The Quest | July 1-August 31, 2026 | Higher training frequency, structured progression |
| 3 | The Peak | September 1-September 30, 2026 | Goal testing, peak focus, campaign completion |

Seed data rules:

- Seed content should be loaded through a seed data mechanism.
- Seed workouts, goals, programs, and campaigns should use the same models as user-created content.
- Seed content should be duplicable and eventually editable.
- Business logic must not assume this campaign is the only campaign.
- Fresh install should be able to load a working sample campaign.

---

## 11. Entitlements and monetization

The app should support a free core product with optional premium subscription later.

Initial entitlement concepts:

- `Entitlement.free`
- `Entitlement.premium`
- `FeatureGate.advancedAnalytics`
- `FeatureGate.unlimitedPrograms`
- `FeatureGate.cloudSync`
- `FeatureGate.premiumCosmetics`
- `FeatureGate.expandedPetSpecies`
- `FeatureGate.expandedExpeditions`

Rules:

- Add feature gates before real billing.
- Keep locked UI states separate from billing provider logic.
- Do not block basic workout logging, basic goals, basic Adventurer progression, basic pet, or local export behind premium.
- Billing integration should be replaceable behind an entitlement service.

---

## 12. Future integrations

The architecture should leave space for these integrations without requiring them in the MVP.

### 12.1 Accounts and cloud sync

Future account/sync work should preserve local-first behavior.

Rules:

- App must remain usable without an account.
- Sync should be introduced behind repository or sync adapter boundaries.
- Conflict handling must be explicit before public cloud sync.
- Export/import remains valuable even if cloud sync exists.

### 12.2 Subscriptions

Billing provider is undecided.

Allowed future approaches:

- RevenueCat
- native StoreKit/Google Play Billing through Flutter packages plus backend verification

App code should depend on entitlement state and feature gates rather than billing SDKs directly.

### 12.3 Idle expeditions

Idle expeditions are a future differentiator, not an MVP blocker.

Rules:

- Expedition power should reward consistency more than extreme volume.
- Use diminishing returns for recent activity.
- Workouts, runs, recovery actions, gear, Adventurer level, and pet bond can influence expedition outcomes.
- Expeditions must not encourage unsafe overtraining.

---

## 13. Safety and health boundaries

Quest for Fitness is not a medical app.

The app may:

- track discomfort
- surface repeated discomfort trends
- suggest cautionary language
- encourage rest when workload is high
- recommend consulting a professional for persistent pain

The app must not:

- diagnose injuries
- prescribe medical treatment
- override professional advice
- encourage extreme weight loss
- reward dangerous overtraining
- punish missed workouts harshly

Safety-related copy should be supportive and non-shaming.

---

## 14. Testing expectations

Test coverage should focus on business rules and persistence before broad widget polish.

Initial test priorities:

- database migrations and seed loading
- repository persistence and reload behavior
- workout completion save flow
- fitness event emission
- XP calculation
- achievement unlock/progress logic
- pet reaction rules
- goal progress calculations
- entitlement gate behavior
- export/import round trip

Important scenarios:

- fresh install loads seed campaign
- Today can find the active campaign and next planned workout
- completed workout persists after restart
- duplicate reward processing does not double-grant XP or achievements
- bodyweight log updates linked bodyweight goals
- missed days do not create punitive pet states
- premium gates do not block core free logging

---

## 15. Architecture decision log

Track major structural decisions here as the project evolves.

| Date | Decision | Rationale |
|---|---|---|
| 2026-05-03 | Use Flutter + Dart as the target app stack. | One codebase for iOS and Android with strong mobile UI support. |
| 2026-05-03 | Use local-first persistence through Drift/SQLite. | Training logs must be reliable, structured, and available offline. |
| 2026-05-03 | Separate Fitness Engine from Quest Engine. | Fitness logging must remain useful and maintainable without RPG coupling. |
| 2026-05-03 | Use internal fitness and reward events between systems. | RPG, pet, and achievement systems should react to completed real-world actions. |
| 2026-05-03 | Treat the May-September 2026 campaign as seed data. | The product must support future custom campaigns and programs. |
| 2026-05-03 | Add entitlement architecture before real billing. | Premium features should be gated without coupling app logic to a billing provider. |

When an architecture decision changes, update the relevant section and add a row to this log.
