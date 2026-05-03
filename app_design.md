# Quest for Fitness — App Design Documentation

**Document status:** Product/design draft 1  
**Target platforms:** iOS and Android  
**Recommended app stack:** Flutter + Dart  
**Product direction:** Commercial mobile app with free core tracking and optional premium subscription  
**Seed campaign:** May–September 2026 personal training block, preserved from the original handover as sample/default content

---

## 1. Product vision

**Quest for Fitness** is a mobile fitness tracking app wrapped in a fantasy RPG progression layer.

At its core, it is a serious workout, running, bodyweight, goal, and progress tracking app. It should be fast enough to use in the gym, detailed enough to analyze real training progress, and modular enough to support custom workouts, routines, programs, targets, and long-term goals.

Its unique identity comes from the RPG layer: the user becomes an **Adventurer** whose growth mirrors their real fitness journey. Training sessions become quests. Goals become campaign objectives. Achievements unlock gear, titles, companions, cosmetics, and pet evolution. The app should deliver the reliability of a proper training log with the emotional reward loop of a cozy RPG, Garmin-style achievements, idle progression, and a Tamagotchi-like companion system.

The guiding product promise:

> **Train in real life. Progress in the realm.**

---

## 2. Product positioning

Quest for Fitness should sit between these existing app categories:

- **Workout trackers** — strong logging and analytics, but usually dry and utilitarian.
- **Habit/self-improvement apps** — motivating, but often too shallow for serious training.
- **Wearable achievement systems** — good badges and streaks, but not enough fantasy identity.
- **Idle RPGs/Tamagotchi games** — rewarding progression, but usually disconnected from real behaviour.

Quest for Fitness combines them:

- serious training log
- modular program builder
- body metrics and cardio tracking
- achievement-driven motivation
- fantasy character progression
- pet care and evolution
- optional idle/AFK adventure loop
- long-term goal campaigns

The app should never become “a game that happens to track workouts.” It should be **a great fitness app made emotionally sticky through RPG progression**.

---

## 3. Core terminology

These terms are product-level concepts and should stay consistent across UI, data models, seed content, and roadmap planning.

- **Adventurer:** The user's RPG avatar. The Adventurer gains XP, levels, titles, gear cosmetics, and attributes from real fitness activity.
- **Quest:** A short-term actionable task, such as today's planned workout, a recovery action, a run, or a weekly consistency target.
- **Campaign:** A longer goal-driven journey that can contain phases, programs, goals, milestones, rewards, and a date range. The May–September 2026 training block is the first seed campaign, not the full product scope.
- **Workout:** A single planned or completed training session made up of exercises, target sets, logging data, and completion status.
- **Program:** A reusable training structure that schedules workouts over time, often through phases, weeks, or rotating workout days.
- **Goal:** A measurable target with current value, target value, unit, direction, optional target date, and optional link to tracked metrics.
- **Achievement:** A persistent milestone unlocked from fitness or quest behavior, such as first workout, weekly consistency, PRs, program completion, or pet bond.
- **Pet:** The user's companion. The pet gains bond, mood, energy, growth, and evolution progress from activity and recovery without guilt-based penalties.
- **Expedition:** A future idle/AFK adventure that the Adventurer and pet can undertake, with outcome power influenced by consistent real-world fitness behavior.
- **Reward Event:** A stored RPG outcome caused by a fitness or quest event, such as XP granted, level up, achievement unlocked, title unlocked, equipment unlocked, pet bond increase, pet evolution, or expedition completion.

---

## 4. Core design principle

### Fitness first, fantasy second

The RPG layer must never slow down logging.

During a workout, the user should be able to:

1. open the app
2. see today’s planned session
3. tap a set
4. enter reps, weight, and optionally RPE
5. move on

The fantasy layer should primarily appear:

- after completing a session
- on the dashboard
- in achievement moments
- in the Adventurer profile
- in the pet screen
- in weekly summaries
- in idle expedition outcomes

Logging is sacred. Rewards are the celebration.

---

## 5. Target users

### 5.1 Primary user: the fitness RPG nerd

A user who enjoys strength training, running, climbing, bodybuilding, or general fitness and also likes RPG progression, gear, achievements, classes, titles, companions, and visual growth.

They want:

- a real training log
- visible progress
- streaks and achievements
- a reason to come back
- emotional reward for consistency
- a fun identity around fitness

### 5.2 Secondary user: the structured beginner

A user who wants to start training and benefits from being told what to do next.

They want:

- simple workouts
- guided programs
- clear goals
- forgiving motivation
- visible improvement
- a friendly companion that makes the process less lonely

### 5.3 Tertiary user: the data-focused lifter/runner

A user who values dashboards and historical training data.

They want:

- volume trends
- PR tracking
- workout history
- exercise progression
- goal dashboards
- bodyweight trends
- running pace trends
- program adherence

They may ignore some game systems, so the app must remain valuable even if the fantasy layer is treated as flavor.

---

## 6. Platform and technical direction

### 6.1 Recommended stack

Use **Flutter + Dart** as the primary app stack.

Rationale:

- one codebase for iOS and Android
- suitable for real App Store and Google Play deployment
- strong mobile UI performance
- good fit for custom gamified UI
- easier to build polished animations, character screens, pet screens, and dashboard interactions than a web-first PWA
- compatible with in-app purchases/subscriptions through platform billing integrations

### 6.2 Suggested architecture

Use a modular architecture with clear domain separation:

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

### 6.3 Recommended libraries and services

Initial recommendation:

- **Flutter** for the app.
- **Dart** for app logic.
- **Riverpod** for state management.
- **go_router** for navigation.
- **Drift/SQLite** for structured local-first persistence.
- **Freezed + json_serializable** for immutable data models and JSON serialization.
- **fl_chart** or equivalent for charts.
- **Firebase or Supabase later** for optional accounts, cloud sync, and server-side purchase verification.
- **RevenueCat or native StoreKit/Play Billing abstraction later** for subscription entitlement management.

Important: do not build the subscription system into the core app too early. Design an entitlement layer early, but implement real subscriptions only when the free product has clear value.

---

## 7. Product layers

Quest for Fitness has two major product systems.

## 7.1 The Fitness Engine

The Fitness Engine is responsible for all serious training functionality.

It includes:

- exercise library
- workout builder
- program builder
- scheduled sessions
- workout execution
- set logging
- session history
- bodyweight logging
- body measurements
- running/cardio logging
- goal tracking
- progression rules
- analytics dashboards
- personal records
- adherence tracking
- injury/discomfort notes
- substitutions and skipped exercise reasons

This layer must work even if the RPG layer is disabled.

## 7.2 The Quest Engine

The Quest Engine translates fitness behaviour into RPG progression.

It includes:

- Adventurer profile
- class identity
- XP and levels
- attributes
- gear and cosmetics
- titles
- achievements
- quests
- campaigns
- rewards
- pet progression
- idle expeditions/AFK combat

This layer should consume events from the Fitness Engine rather than owning fitness data directly.

Example:

```text
Fitness event: WorkoutCompleted
Quest response: +120 XP, achievement progress updated, pet bond increased, expedition power boosted
```

This separation keeps the app maintainable.

---

## 8. Core app loop

The everyday loop:

1. User opens the app.
2. Dashboard shows today’s recommended action.
3. User starts a workout, run, bodyweight check-in, or recovery action.
4. User logs the activity quickly.
5. Fitness Engine saves the real training data.
6. Quest Engine grants XP, achievement progress, pet care value, and possible rewards.
7. User sees a completion celebration.
8. Adventurer, pet, goals, and dashboards update.

Short version:

```text
Plan → Train → Log → Progress → Reward → Return
```

---

## 9. Main navigation

Recommended bottom navigation:

1. **Today**
2. **Log**
3. **Progress**
4. **Quest**
5. **Library**

### 9.1 Today

The home screen and daily command center.

Shows:

- today’s recommended workout/run/recovery action
- current active campaign/goal focus
- readiness/light check-in
- Adventurer status summary
- pet status summary
- weekly completion progress
- next unlock/achievement progress

Primary action:

- “Start Today’s Quest”

### 9.2 Log

Fast manual logging hub.

Includes:

- start planned workout
- start empty workout
- log run/cardio
- log bodyweight
- log body measurement
- log recovery/rest day
- view recent logs

### 9.3 Progress

The serious analytics area.

Includes:

- goal dashboard
- strength progress
- exercise history
- volume trends
- bodyweight trend
- running pace trend
- weekly adherence
- personal records
- program performance

### 9.4 Quest

The RPG home.

Includes:

- Adventurer character sheet
- class/title
- level and XP
- attributes
- equipped gear
- inventory/cosmetics
- achievements
- active quests/campaigns
- pet screen
- expeditions/AFK combat

### 9.5 Library

Creation and management area.

Includes:

- exercises
- workouts
- programs
- routines
- goals
- templates
- campaigns
- substitutions
- premium content library later

---

## 10. Visual design direction

Quest for Fitness should be a hybrid between a modern fitness dashboard and fantasy RPG UI.

### 10.1 Fitness UI

Should feel:

- clean
- fast
- legible
- mobile-first
- dark-mode friendly
- clear under gym lighting
- usable with sweaty hands
- low friction

Use:

- large tap targets
- high contrast
- minimal typing
- simple cards
- progress bars
- trend charts
- bottom sheets for set logging
- sticky session controls

### 10.2 RPG UI

Should feel:

- cozy
- motivating
- fantasy-flavoured
- rewarding
- collectible
- not childish
- not visually noisy

Use:

- character sheet metaphors
- quest log language
- equipment slots
- title banners
- achievement cards
- pet habitat
- campfire/rest motifs
- subtle fantasy ornaments
- animated reward moments

### 10.3 Tone of voice

The app should speak like a supportive RPG coach.

Examples:

- “Quest complete.”
- “Your Adventurer grows stronger.”
- “The companion looks proud.”
- “A new personal record has been forged.”
- “You missed a session. The road continues.”
- “Recovery is not retreat. Rest at the campfire.”

Avoid guilt-heavy language.

Bad:

- “You failed your streak.”
- “Your pet is starving.”
- “You disappointed your Adventurer.”

Better:

- “The trail was quiet today. Return when ready.”
- “Your companion is resting.”
- “A comeback quest is available.”

---

## 11. Fitness Engine feature design

## 11.1 Exercise library

Each exercise should support:

- name
- category
- muscle groups
- equipment
- movement pattern
- default unit
- bodyweight flag
- unilateral flag
- notes
- user-created/custom flag
- archived flag

Example categories:

- strength
- hypertrophy
- cardio
- mobility
- recovery
- skill
- climbing/grip

Example movement patterns:

- horizontal push
- vertical push
- horizontal pull
- vertical pull
- squat
- hinge
- lunge
- carry
- core
- isolation
- locomotion/cardio

## 11.2 Workout builder

A workout is a reusable template.

A workout contains:

- name
- description
- exercises
- target sets
- target reps/time/distance
- target intensity/RPE/RIR/zone
- rest guidance
- optional supersets/circuits later
- notes

Examples:

- Upper Strength
- Lower Volume
- Easy Run
- Grip & Pull-up Session
- Recovery Mobility

## 11.3 Program builder

A program is a scheduled training structure.

A program contains:

- name
- description
- start date
- end date or duration
- phases/blocks
- weeks
- scheduled days
- workouts
- progression rules
- goal associations

The app should eventually support:

- fixed weekly programs
- rotating A/B/C/D programs
- flexible “next session” programs
- deload weeks
- testing weeks
- custom phases
- program duplication
- program templates

## 11.4 Workout execution

During a workout, the user sees:

- workout title
- exercise list
- target sets/reps/weight/RPE
- previous performance
- current working weight
- set completion buttons
- quick edit controls
- rest timer later
- notes

Set logging should be extremely fast.

Required fields:

- reps or duration/distance depending on exercise type
- weight where applicable

Optional fields:

- RPE
- notes
- pain/discomfort
- form quality

## 11.5 Session history

Session history should support:

- chronological list
- filtering by exercise/program/date
- expanded session detail
- edit/delete session
- duplicate session
- PR highlights
- volume summaries
- quest rewards earned

## 11.6 Goals and targets

Goals should support:

- name
- category
- current value
- target value
- target date
- direction: higher/lower is better
- unit
- linked metric
- linked exercise/cardio/body metric
- manual update or automatic update
- reward mapping

Goal categories:

- strength
- cardio
- body composition
- consistency
- skill
- recovery
- custom

Examples:

- Bench 140 kg
- Run 5 km in 25:00
- Bodyweight 83 kg
- 25 bodyweight pull-ups
- Complete 16 workouts in a month
- Average 7,000 steps/day

## 11.7 Analytics

Initial analytics:

- weekly workout count
- weekly volume
- exercise best set
- estimated 1RM where applicable
- bodyweight trend
- run pace trend
- goal progress
- adherence to planned sessions

Later analytics:

- volume by muscle group
- volume by movement pattern
- intensity distribution
- RPE trends
- fatigue/readiness correlation
- program comparison
- plateau detection
- injury/discomfort trend

## 11.8 Injury and discomfort logging

The app should support lightweight discomfort tracking without becoming a medical app.

A set, exercise, session, or run may include:

- discomfort area
- severity 1–5
- note
- “affected performance?” yes/no

The app should not diagnose. It can surface trends and suggest cautionary language.

Example:

> “Right foot discomfort has appeared in 3 recent runs. Consider reducing running volume or choosing a lower-impact session.”

---

## 12. Quest Engine feature design

## 12.1 Adventurer

The Adventurer is the user’s RPG avatar.

The Adventurer has:

- name
- level
- XP
- class
- title
- attributes
- equipped gear
- cosmetic appearance
- achievement history
- campaign history

The Adventurer should grow from real training behaviour.

## 12.2 Classes

Classes can work in two possible ways. The app should support both conceptually.

### Option A — Flavor class

The user chooses a class during onboarding. It affects:

- visuals
- title language
- achievement naming
- gear themes
- pet flavor

It does not affect training recommendations.

This is safer for v1.

### Option B — Adaptive class identity

The app observes recent behaviour and gives dynamic titles or subclass suggestions.

Examples:

- lots of strength training → Warrior
- lots of running/cardio → Ranger
- balanced training → Adventurer
- consistency streaks → Monk
- recovery and mobility → Druid
- program building/data focus → Artificer

Recommended v1 approach:

- user picks a permanent flavor class
- app also grants dynamic titles based on behaviour

Example:

```text
Class: Warrior
Current Title: Iron Ranger
Reason: 3 strength sessions + 2 runs this week
```

## 12.3 Attributes

Attributes should be flavourful but tied to real behaviours.

Suggested attributes:

- **Might** — strength training, PRs, heavy sets
- **Endurance** — running/cardio, conditioning, long sessions
- **Discipline** — consistency, planned sessions completed, streaks
- **Vitality** — bodyweight trend, recovery, sleep/readiness logging
- **Agility** — mobility, climbing, movement skill, lower-body/cardio variety
- **Wisdom** — program adherence, deloads, recovery choices, logging quality

These should not be used for medical or prescriptive claims. They are motivational abstractions.

## 12.4 XP

XP is earned through behaviours.

Examples:

- complete planned workout
- complete run
- log bodyweight
- hit a PR
- complete a goal milestone
- complete a recovery day
- maintain weekly adherence
- return after a missed week

XP should reward consistency more than extremity.

Suggested XP principles:

- planned workout completion: high XP
- unplanned workout: medium XP
- bodyweight/logging habit: small XP
- PR: bonus XP
- recovery/rest: valid XP when planned
- comeback quest: bonus XP after inactivity

Avoid rewarding unhealthy overtraining. Do not make “more is always better.”

## 12.5 Levels

Levels are long-term progression.

Leveling should feel meaningful but not too fast.

Every level can unlock one or more of:

- gear cosmetic
- title
- pet item
- portrait frame
- background
- achievement badge
- expedition slot later

## 12.6 Equipment

Equipment is primarily cosmetic and status-based.

Equipment slots:

- weapon
- off-hand
- helmet
- chest
- gloves
- boots
- trinket
- cloak
- pet accessory

Equipment can be unlocked by:

- achievements
- level milestones
- campaign milestones
- PRs
- consistency streaks
- seasonal events later

Important: equipment should not create pressure to overtrain. It can provide cosmetic “power” for idle expeditions, but not unlock unsafe training advice.

## 12.7 Achievements

Achievements should be structured into categories.

Categories:

- first steps
- consistency
- strength
- cardio
- body composition
- program completion
- logging mastery
- comeback quests
- pet bond
- exploration/expeditions

Achievement examples:

- First Quest — complete your first workout
- Iron Habit — complete 4 workouts in a week
- Forged in Steel — set a new strength PR
- Road Worn — log 10 runs
- Campfire Wisdom — complete a planned recovery day
- Return to the Road — complete a workout after 7+ days away
- Bonded Companion — reach pet bond level 5

## 12.8 Quests

Quests are short-term tasks.

Examples:

- Complete today’s planned workout
- Log bodyweight twice this week
- Complete two easy runs this week
- Hit all planned workouts this week
- Add notes to three sessions
- Complete a recovery session

Quest types:

- daily
- weekly
- campaign
- comeback
- milestone
- pet
- expedition

## 12.9 Campaigns

A campaign is a long-term structured journey.

The May–September 2026 personal training block should be treated as the first seed campaign, not the entire product.

A campaign contains:

- name
- start date
- end date
- phases
- goals
- program blocks
- milestones
- rewards
- campaign summary

Examples:

- The Foundation
- The Quest
- The Peak
- Road to 5K
- First Pull-up
- Strength Rebuild
- Summer Cut
- Winter Bulk

---

## 13. Pet system

## 13.1 Pet fantasy

The pet is the user’s companion. It evolves alongside the user and reacts to consistent care, activity, and recovery.

The pet should feel like:

- companion
- mascot
- accountability buddy
- cozy reward system
- light idle game character

It should not be framed as a fragile creature that suffers when the user misses workouts.

## 13.2 Pet stats

Suggested pet stats:

- Bond
- Mood
- Energy
- Growth
- Curiosity
- Expedition Power

## 13.3 Pet care

Pet care should be driven mostly by real-world actions.

Examples:

- complete workout → pet gains energy/bond
- complete run → pet gains curiosity/endurance flavor
- log recovery → pet rests and restores
- hit weekly target → pet finds treasure
- miss days → pet rests at camp, comeback quest appears

Manual care actions can exist but should be lightweight.

Examples:

- feed treat
- play
- send on expedition
- change habitat
- equip pet accessory

## 13.4 Pet evolution

Pet evolution can be tied to:

- Adventurer level
- bond level
- completed campaigns
- consistency milestones
- mixed training exposure

Evolution should be exciting but not punishing.

Possible evolution stages:

1. Hatchling
2. Companion
3. Trailmate
4. Guardian
5. Mythic Companion

## 13.5 Idle/AFK combat and expeditions

This is a strong future differentiator.

Concept:

- The Adventurer and pet can be sent on expeditions.
- Expeditions progress slowly over real time.
- Workouts act as major boosts or “heroic actions.”
- The user earns treasure, cosmetics, crafting materials, or lore fragments.
- Expedition success is influenced by consistency, recent activity, pet bond, and equipped gear.

Important design rule:

Idle combat should never be the main reason to do excessive workouts. It should reward steady behaviour and give the user something fun to check between sessions.

Expedition examples:

- Patrol the Old Road — short idle expedition
- Explore the Ironwood — strength-flavoured expedition
- Run the Moonlit Trail — cardio-flavoured expedition
- Defend the Campfire — consistency/recovery expedition
- Delve the Forgotten Gym — achievement milestone expedition

Expedition rewards:

- gold/cosmetic currency
- crafting shards
- pet treats
- gear cosmetics
- titles
- lore entries
- habitat decorations

---

## 14. Monetization design

The app should be designed as a free app with optional premium subscription.

## 14.1 Free tier

The free tier must be genuinely useful.

Suggested free features:

- basic workout logging
- limited custom workouts/programs
- basic bodyweight logging
- basic goals
- basic Adventurer leveling
- basic pet
- core achievements
- local data export

## 14.2 Premium tier

Premium should unlock depth and convenience, not basic dignity.

Potential premium features:

- unlimited custom programs
- advanced analytics dashboards
- advanced progression suggestions
- cloud sync/backup
- premium RPG cosmetics
- additional classes/pet species
- expanded expedition system
- advanced goal campaigns
- program templates
- custom achievement packs
- data import/export tools
- wearable integrations later

## 14.3 Entitlement architecture

The codebase should include an entitlement layer from early development.

Example:

```text
Entitlement.free
Entitlement.premium
FeatureGate.advancedAnalytics
FeatureGate.unlimitedPrograms
FeatureGate.cloudSync
FeatureGate.premiumCosmetics
```

The UI can hide or lock premium features without tightly coupling app logic to a billing provider.

Real subscription implementation should come after the app is useful enough to retain users.

---

## 15. Data model overview

The app should use persistent local storage from the beginning. Prefer SQLite through Drift rather than raw JSON/localStorage because this is intended to become a real shipped app.

Core entities:

```text
UserProfile
Exercise
WorkoutTemplate
WorkoutExerciseTemplate
Program
ProgramPhase
ProgramWeek
ScheduledWorkout
SessionLog
ExerciseLog
SetLog
CardioLog
BodyMetricLog
Goal
GoalMilestone
ProgressionRule
Achievement
AchievementProgress
Adventurer
AdventurerAttribute
EquipmentItem
InventoryItem
Pet
PetEvent
Expedition
RewardEvent
Entitlement
```

## 15.1 Fitness events

The app should emit internal events after important actions.

Examples:

```text
WorkoutCompleted
SetLogged
PersonalRecordAchieved
RunLogged
BodyweightLogged
GoalUpdated
GoalMilestoneReached
WeekTargetCompleted
ProgramPhaseCompleted
RecoveryLogged
```

The Quest Engine listens to these events and grants rewards.

## 15.2 Reward events

Reward events should be stored as history.

Examples:

```text
XpGranted
LevelUp
AchievementUnlocked
EquipmentUnlocked
PetBondIncreased
PetEvolved
ExpeditionCompleted
TitleUnlocked
```

This allows the app to show a timeline of progress.

---

## 16. Seed content: May–September 2026 campaign

The original handover should be preserved as seed data for the first real campaign.

Corrected timeline:

| Phase | Name | Dates | Notes |
|---|---|---|---|
| 1 | The Foundation | May 5 – June 29, 2026 | Habit rebuild, easy running, baseline tracking |
| 2 | The Quest | July 1 – August 31, 2026 | Higher training frequency, more structured progression |
| 3 | The Peak | September 1 – September 30, 2026 | Goal testing, peak focus, campaign completion |

The original hardcoded program should be converted into a static seed campaign/program template.

Important note:

- This seed program is not the whole product.
- It is the first example campaign.
- The app must support replacing it, editing it, duplicating it, and creating other campaigns later.

---

## 17. Safety and health boundaries

Quest for Fitness is not a medical app and should avoid diagnosis or medical claims.

The app may:

- track discomfort
- surface trends
- encourage rest when workload is high
- suggest reducing intensity after repeated discomfort
- recommend consulting a professional for persistent pain

The app should not:

- diagnose injuries
- prescribe medical treatment
- override professional advice
- encourage extreme weight loss
- reward dangerous overtraining
- punish missed workouts harshly

---

## 18. MVP scope

The first shippable internal MVP should include:

- Flutter app scaffold
- local database
- seed May–September 2026 campaign
- Today screen
- planned workout execution
- set logging
- session history
- bodyweight logging
- basic goals
- basic progress dashboard
- basic Adventurer profile
- XP from completed workouts
- basic achievement unlocks
- basic pet screen
- JSON export/import

Do not build subscriptions, cloud sync, or full idle combat in the first MVP.

---

## 19. V1 commercial scope

The first public App Store / Google Play version should include:

- polished onboarding
- user profile
- optional account/cloud backup
- core workout logging
- custom workouts
- simple program templates
- goals
- progress dashboards
- Adventurer leveling
- achievements
- cosmetic rewards
- pet progression
- local notifications
- basic premium entitlement system
- privacy policy and terms
- store-ready app icons/screenshots

---

## 20. Future vision

Long-term, Quest for Fitness can become:

- a modular workout tracker
- a goal/campaign builder
- a fitness RPG
- a pet evolution game
- an idle expedition game
- a premium program marketplace
- a community challenge platform
- a wearable-integrated progress system

But the first goal remains simple:

> Build the best possible fantasy-flavoured workout tracker that one motivated user wants to open every day.
