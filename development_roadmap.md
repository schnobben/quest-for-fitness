# Quest for Fitness — Development Roadmap

**Document status:** Roadmap draft 1  
**Target platforms:** iOS and Android  
**Recommended stack:** Flutter + Dart  
**Product direction:** Commercial mobile app with free core features and optional premium subscription  
**Seed campaign:** May–September 2026 personal training block, used as editable sample content rather than the app's full scope

---

## 1. Roadmap philosophy

Quest for Fitness should be built in layers.

The most important rule:

> Build a genuinely useful fitness tracker first, then make the RPG layer deepen the motivation loop.

Do not start with a giant RPG system before the workout logger feels excellent. The app wins if the user can log a real workout quickly and then feel rewarded for doing it.

The roadmap is split into milestones. Each milestone contains sprints and tasks. Sprints are written as logical development chunks rather than fixed calendar weeks.

---

## 2. Milestone overview

| Milestone | Name | Purpose |
|---|---|---|
| 0 | Product & Project Foundation | Set up docs, Flutter app, architecture, design direction |
| 1 | Fitness Core MVP | Build the workout/session logging app |
| 2 | Goals, Analytics & Progression | Add useful progress dashboards and training insights |
| 3 | Quest Engine V1 | Add Adventurer, XP, levels, achievements, and basic rewards |
| 4 | Pet System V1 | Add companion, bond, mood, evolution, and basic care loop |
| 5 | Modular Builder V1 | Add custom exercises, workouts, programs, and campaigns |
| 6 | Data Safety & Account Layer | Add export/import, backup, optional accounts, sync-ready structure |
| 7 | Premium & Store Readiness | Add entitlements, subscription infrastructure, app store preparation |
| 8 | Idle Expeditions V1 | Add AFK combat/expeditions tied to real fitness actions |
| 9 | Public V1 Expansion | Polish, templates, onboarding, retention, and commercial readiness |

---

## 3. Milestone 0 — Product & Project Foundation

### Goal

Create the technical and product foundation for a real Flutter mobile app.

### Sprint 0.1 — Documentation foundation

Tasks:

- Create `app_design.md`.
- Create `development_roadmap.md`.
- Correct all date references to May–September 2026.
- Define the product as a commercial RPG fitness app, not a single-user tracker.
- Define core terminology:
  - Adventurer
  - Quest
  - Campaign
  - Workout
  - Program
  - Goal
  - Achievement
  - Pet
  - Expedition
  - Reward Event

Exit criteria:

- Project has clear product docs.
- `app_design.md` defines the shared product terminology for UI, data model, seed content, and roadmap planning.
- The May–September 2026 personal training block is clearly documented as seed data, not the whole app.

### Sprint 0.2 — Flutter project setup

Tasks:

- Create Flutter project.
- Configure iOS and Android targets.
- Set up package structure.
- Add linting and formatting rules.
- Add basic app theme.
- Add routing skeleton.
- Add environment config structure.
- Add placeholder screens:
  - Today
  - Log
  - Progress
  - Quest
  - Library
  - Settings

Recommended packages:

- Riverpod
- go_router
- Drift/SQLite
- Freezed
- json_serializable
- fl_chart or equivalent charting package

Exit criteria:

- App runs on iOS simulator and Android emulator.
- Bottom navigation works.
- Placeholder screens exist.
- Project structure is ready for feature modules.

### Sprint 0.3 — Design system foundation

Tasks:

- Define typography scale.
- Define dark theme.
- Define accent colors.
- Define card styles.
- Define large mobile tap targets.
- Define RPG visual components:
  - quest card
  - reward card
  - Adventurer stat card
  - equipment slot
  - pet status card
  - achievement badge
- Define fitness components:
  - metric card
  - progress bar
  - set logging row
  - exercise card
  - chart card

Exit criteria:

- App has a coherent visual base.
- Fitness UI and RPG UI can coexist without clashing.

---

## 4. Milestone 1 — Fitness Core MVP

### Goal

Build the usable workout tracker.

This milestone should make the app valuable even before the RPG features exist.

---

### Sprint 1.1 — Local data foundation

Tasks:

- Set up local database.
- Create initial schema for:
  - exercises
  - workout templates
  - program templates
  - scheduled workouts
  - session logs
  - exercise logs
  - set logs
  - bodyweight logs
  - goals
- Add seed data mechanism.
- Add migration structure.
- Add repository layer.
- Add test data reset/dev tools.

Exit criteria:

- App can persist and reload data.
- Seed data can be loaded on fresh install.
- Database can support the May–September 2026 seed campaign.

---

### Sprint 1.2 — Seed campaign import

Tasks:

- Convert original handover program into app seed data.
- Update phase dates to 2026:
  - Phase 1: May 5 – June 29, 2026
  - Phase 2: July 1 – August 31, 2026
  - Phase 3: September 1 – September 30, 2026
- Add Phase 1 workout templates:
  - Day A — Upper Strength
  - Day B — Lower Strength
  - Day C — Upper Volume
  - Day D — Lower Volume
- Preserve original exercises and notes.
- Add starting goals from the handover.
- Add initial bodyweight entry as seed/example data.
- Mark seed content as editable/duplicable later.

Exit criteria:

- Fresh install includes a working sample campaign.
- Today screen can read from seeded campaign data.

---

### Sprint 1.3 — Today screen v1

Tasks:

- Determine current active campaign.
- Determine current phase.
- Determine next planned workout.
- Show today’s recommended training action.
- Show weekly plan summary.
- Show basic goal snapshot.
- Add “Start Today’s Quest” button.
- Handle non-training days gracefully.

Exit criteria:

- User can open the app and know what to do next.
- Today screen works whether today is a training day or rest day.

---

### Sprint 1.4 — Workout execution v1

Tasks:

- Build workout execution screen.
- Show exercises in order.
- Show target sets, reps, weight, and RPE.
- Pre-fill working/default weights.
- Allow set logging with:
  - reps
  - weight
  - optional RPE
  - optional note
- Mark sets complete.
- Allow editing logged sets.
- Allow completing session.
- Save session log.

Exit criteria:

- User can complete a full planned workout.
- Session persists after app restart.
- Logging is fast enough for gym use.

---

### Sprint 1.5 — Session history v1

Tasks:

- Build session history screen.
- Show chronological session list.
- Show workout name/date/duration if available.
- Expand or open session detail.
- Show exercises and sets.
- Allow deleting a test session.
- Allow editing a session later if practical.

Exit criteria:

- User can review completed workouts.
- User can verify all logged set data.

---

### Sprint 1.6 — Bodyweight log v1

Tasks:

- Add quick bodyweight entry.
- Store date and weight.
- Show latest weight.
- Show simple bodyweight history list.
- Add basic trend chart.
- Link bodyweight goal current value to latest bodyweight log.

Exit criteria:

- User can log bodyweight in under 10 seconds.
- Goal dashboard reflects latest bodyweight.

---

## 5. Milestone 2 — Goals, Analytics & Progression

### Goal

Make the app useful for understanding progress.

---

### Sprint 2.1 — Goals dashboard v1

Tasks:

- Build goal cards.
- Show current vs target.
- Show progress bar.
- Support higher-is-better and lower-is-better goals.
- Allow manual goal value updates.
- Support target dates.
- Link certain goals to tracked metrics.

Exit criteria:

- User can track the five seed goals.
- User can edit current goal values.

---

### Sprint 2.2 — Working weights and exercise history

Tasks:

- Add working weight table.
- Auto-update working weights from session logs.
- Allow manual override.
- Add exercise detail screen.
- Show historical set performance.
- Show best set/estimated PR where applicable.

Exit criteria:

- User can see how each exercise is progressing.
- User can manually correct working weights.

---

### Sprint 2.3 — Basic analytics dashboard

Tasks:

- Add weekly workout count.
- Add weekly volume summary.
- Add session adherence summary.
- Add bodyweight trend chart.
- Add goal progress overview.
- Add recent PR highlights.

Exit criteria:

- Progress screen provides useful information at a glance.

---

### Sprint 2.4 — Run/cardio log v1

Tasks:

- Add run/cardio logging.
- Capture:
  - date
  - distance
  - duration
  - computed pace
  - notes
- Show recent runs.
- Show pace trend.
- Support 5 km goal updates.

Exit criteria:

- User can log runs and see pace progression.

---

### Sprint 2.5 — Progression suggestions v1

Tasks:

- Implement progression rule engine.
- Detect when target rep range is hit at target RPE for consecutive sessions.
- Suggest weight increase.
- Show progression flags on relevant exercises.
- Allow user to accept/ignore suggestion.

Exit criteria:

- App can suggest simple load increases without forcing them.

---

## 6. Milestone 3 — Quest Engine V1

### Goal

Add the RPG identity layer.

---

### Sprint 3.1 — Adventurer profile v1

Tasks:

- Add Adventurer data model.
- Add name.
- Add level.
- Add XP.
- Add selected class.
- Add current title.
- Add basic attributes.
- Build Adventurer profile screen.

Exit criteria:

- User has an Adventurer identity.
- Adventurer can gain XP and level up.

---

### Sprint 3.2 — XP event system

Tasks:

- Create internal fitness event system.
- Emit events for:
  - workout completed
  - run logged
  - bodyweight logged
  - goal updated
  - PR achieved
- Create reward event system.
- Grant XP from events.
- Store XP history.
- Show completion reward summary after workouts.

Exit criteria:

- Real fitness actions produce RPG progress.
- Reward history is stored.

---

### Sprint 3.3 — Achievements v1

Tasks:

- Define achievement model.
- Add achievement categories.
- Add first batch of achievements:
  - first workout
  - first run
  - first bodyweight log
  - 4 workouts in a week
  - first PR
  - 10 total workouts
  - first goal milestone
- Track achievement progress.
- Show achievement unlock modal/card.
- Add achievements screen.

Exit criteria:

- User can unlock achievements.
- Achievements feel rewarding but not intrusive.

---

### Sprint 3.4 — Equipment and titles v1

Tasks:

- Add equipment model.
- Add inventory model.
- Add equipment slots.
- Add cosmetic rewards from achievements.
- Add titles unlocked by milestones.
- Build equipment screen.
- Allow equipping cosmetic gear.

Exit criteria:

- User can unlock and equip basic gear/titles.

---

### Sprint 3.5 — Quest completion screen

Tasks:

- Build post-workout completion screen.
- Show:
  - workout summary
  - XP gained
  - achievement progress
  - new unlocks
  - pet bond changes once pet exists
  - goal progress changes
- Keep animation short and skippable.

Exit criteria:

- Finishing a workout feels rewarding.
- Reward flow does not get annoying.

---

## 7. Milestone 4 — Pet System V1

### Goal

Add the Tamagotchi-like companion system.

---

### Sprint 4.1 — Pet foundation

Tasks:

- Add pet model.
- Add pet name.
- Add pet species/type.
- Add bond level.
- Add mood.
- Add energy.
- Add growth progress.
- Build pet screen.

Exit criteria:

- User has a visible companion.
- Pet state persists.

---

### Sprint 4.2 — Pet reactions to fitness events

Tasks:

- Connect pet to reward event system.
- Workout completion increases bond/energy.
- Runs increase curiosity/endurance flavor.
- Recovery actions restore energy.
- Weekly target completion grants pet bonus.
- Missed days create neutral/resting state, not punishment.

Exit criteria:

- Pet evolves through real user behaviour.
- Missing workouts does not create shame language.

---

### Sprint 4.3 — Pet care actions

Tasks:

- Add simple manual care actions:
  - feed treat
  - play
  - rest
  - inspect
- Add care items as rewards.
- Add cooldowns or limits if needed.
- Add pet mood messages.

Exit criteria:

- User can interact with pet outside workouts.
- Care loop is light and not chore-like.

---

### Sprint 4.4 — Pet evolution v1

Tasks:

- Define evolution stages.
- Add growth thresholds.
- Trigger evolution at bond/level milestones.
- Add evolution celebration.
- Preserve previous stages in pet history.

Exit criteria:

- Pet can evolve.
- Evolution feels like a major milestone.

---

## 8. Milestone 5 — Modular Builder V1

### Goal

Move beyond the seed campaign and support user-created fitness systems.

---

### Sprint 5.1 — Custom exercise builder

Tasks:

- Create custom exercise form.
- Support exercise name, category, equipment, muscles, movement pattern, unit, bodyweight flag.
- Allow editing/archiving exercises.
- Prevent accidental deletion when logs exist.

Exit criteria:

- User can create and manage exercises.

---

### Sprint 5.2 — Custom workout builder

Tasks:

- Create workout template form.
- Add exercises to workout.
- Define target sets/reps/weight/RPE.
- Reorder exercises.
- Duplicate workout.
- Edit workout.

Exit criteria:

- User can create reusable workouts.

---

### Sprint 5.3 — Program builder v1

Tasks:

- Create program form.
- Add phases/blocks.
- Add weekly schedule.
- Assign workouts to days.
- Support fixed-day schedule.
- Support rotating A/B/C/D schedule.
- Start/activate program.

Exit criteria:

- User can create a basic training program.

---

### Sprint 5.4 — Campaign builder v1

Tasks:

- Create campaign model.
- Link goals to a campaign.
- Link program to a campaign.
- Add start/end date.
- Add campaign milestones.
- Add campaign rewards later.

Exit criteria:

- User can create a goal-driven training campaign.

---

## 9. Milestone 6 — Data Safety & Account Layer

### Goal

Prepare the app for real-world use where data matters.

---

### Sprint 6.1 — Export/import

Tasks:

- Add full JSON export.
- Add full JSON import.
- Add import validation.
- Add manual backup reminder.
- Add share/save file support.

Exit criteria:

- User can back up and restore data manually.

---

### Sprint 6.2 — Optional user account foundation

Tasks:

- Decide backend provider.
- Add auth abstraction.
- Add anonymous/local user mode.
- Add optional sign-in later.
- Keep app usable without account.

Exit criteria:

- App architecture can support accounts without forcing them in MVP.

---

### Sprint 6.3 — Cloud backup/sync prototype

Tasks:

- Add cloud backup prototype.
- Sync core logs.
- Handle conflict strategy.
- Test reinstall restore.
- Keep local-first behaviour.

Exit criteria:

- User can recover data after reinstall when signed in.

---

## 10. Milestone 7 — Premium & Store Readiness

### Goal

Prepare for App Store / Google Play distribution and future subscription monetization.

---

### Sprint 7.1 — Entitlement layer

Tasks:

- Add entitlement model.
- Add feature gates.
- Add free/premium states.
- Add mock premium toggle in dev settings.
- Add locked premium UI state.

Potential premium gates:

- unlimited programs
- advanced analytics
- cloud sync
- premium cosmetics
- expanded pet species
- expanded expeditions

Exit criteria:

- App can distinguish free vs premium features without real billing yet.

---

### Sprint 7.2 — Subscription infrastructure

Tasks:

- Decide billing approach:
  - RevenueCat, or
  - native StoreKit/Google Play Billing via Flutter in-app purchase package plus backend verification
- Define products:
  - monthly premium
  - yearly premium
  - optional lifetime unlock later
- Add sandbox purchase testing.
- Validate entitlement updates.
- Add restore purchases.

Exit criteria:

- Test subscriptions work in sandbox/test environment.

---

### Sprint 7.3 — Store compliance foundation

Tasks:

- Add privacy policy.
- Add terms of use.
- Add health/safety disclaimer.
- Add account deletion plan if accounts exist.
- Add subscription terms screen.
- Add restore purchases button.
- Add data export option.
- Review platform requirements.

Exit criteria:

- App has the basic legal/compliance pieces needed for store submission.

---

### Sprint 7.4 — App Store / Google Play assets

Tasks:

- Create app icon.
- Create splash screen.
- Create screenshots.
- Create store descriptions.
- Create preview text.
- Create support URL/contact.
- Configure app metadata.

Exit criteria:

- App is ready for TestFlight/internal testing and Google Play internal testing.

---

## 11. Milestone 8 — Idle Expeditions V1

### Goal

Add the AFK combat/idle progression layer.

---

### Sprint 8.1 — Expedition model

Tasks:

- Add expedition data model.
- Add expedition duration.
- Add difficulty.
- Add rewards.
- Add required/advised power.
- Add active expedition state.

Exit criteria:

- App can start and complete an expedition.

---

### Sprint 8.2 — Expedition power calculation

Tasks:

- Calculate expedition power from:
  - Adventurer level
  - pet bond
  - equipped gear
  - recent activity
  - weekly consistency
- Avoid rewarding excessive activity too strongly.
- Add diminishing returns.

Exit criteria:

- Expedition success reflects consistent fitness behaviour.

---

### Sprint 8.3 — Expedition UI

Tasks:

- Build expedition screen.
- Show available expeditions.
- Show active expedition progress.
- Show Adventurer + pet party.
- Show rewards on completion.
- Add expedition log/history.

Exit criteria:

- Expeditions feel like a lightweight idle game.

---

### Sprint 8.4 — Workout boosts

Tasks:

- Completed workouts provide expedition boosts.
- Runs provide expedition boosts.
- Recovery actions provide defensive/rest boosts.
- Goal milestones provide rare boosts.

Exit criteria:

- Real-world activity meaningfully affects idle progression.

---

## 12. Milestone 9 — Public V1 Expansion

### Goal

Turn the app from usable prototype into a polished public release.

---

### Sprint 9.1 — Onboarding v1

Tasks:

- Create onboarding flow.
- Ask user goals.
- Ask preferred training types.
- Let user pick Adventurer class.
- Let user name Adventurer.
- Let user choose or hatch pet.
- Offer starter programs/campaigns.

Exit criteria:

- New users understand the app quickly.

---

### Sprint 9.2 — Template library

Tasks:

- Add built-in workout templates.
- Add built-in program templates.
- Add built-in campaign templates.
- Add beginner-friendly options.
- Add strength/cardio/bodyweight options.

Exit criteria:

- Users can start without creating everything manually.

---

### Sprint 9.3 — Notifications

Tasks:

- Add local reminders.
- Add scheduled workout reminders.
- Add weekly summary notification.
- Add pet/expedition notification.
- Avoid guilt language.

Exit criteria:

- Notifications support retention without being annoying.

---

### Sprint 9.4 — UX polish

Tasks:

- Reduce taps in logging flow.
- Add haptics where appropriate.
- Add loading/empty/error states.
- Add animations for rewards.
- Add chart polish.
- Add accessibility improvements.
- Test one-handed use.

Exit criteria:

- App feels polished enough for external testers.

---

### Sprint 9.5 — Beta testing

Tasks:

- Prepare TestFlight build.
- Prepare Google Play internal test.
- Recruit small beta group.
- Add feedback channel.
- Track crashes.
- Track retention manually or with analytics if approved.
- Fix critical usability issues.

Exit criteria:

- App is stable with real users.
- Biggest friction points are known.

---

## 13. Suggested initial build order

For the actual first implementation pass, build in this order:

1. Flutter scaffold and navigation.
2. Local database and seed data.
3. Today screen.
4. Workout execution/logging.
5. Session history.
6. Bodyweight log.
7. Goals dashboard.
8. Progress dashboard.
9. Adventurer XP from workouts.
10. Achievements.
11. Pet screen.
12. Export/import.
13. Custom workout builder.
14. Program builder.
15. Entitlement layer.

This order keeps the app usable at every stage.

---

## 14. Risks and mitigation

### Risk: RPG systems overwhelm the fitness tracker

Mitigation:

- Build Fitness Engine first.
- Keep logging friction extremely low.
- Make reward screens skippable.

### Risk: Data model becomes too rigid

Mitigation:

- Treat programs, campaigns, goals, and achievements as configurable data.
- Avoid hardcoding the May–September 2026 campaign into business logic.

### Risk: Subscription model is added too early

Mitigation:

- Build entitlement abstraction early.
- Implement real billing after the app is useful.

### Risk: The pet system becomes guilt-driven

Mitigation:

- No pet death.
- No shame language.
- Missed days trigger rest/comeback states.

### Risk: Overtraining is rewarded

Mitigation:

- Add diminishing returns to XP.
- Reward planned recovery.
- Reward consistency over volume spikes.

### Risk: App stores require more compliance than expected

Mitigation:

- Keep privacy policy, terms, data export, and subscription disclosure in scope before public release.
- Test billing in sandbox early.

---

## 15. Definition of done for internal MVP

The internal MVP is done when:

- App runs on iOS and Android.
- User can follow the seeded May–September 2026 campaign.
- User can start and complete a planned workout.
- User can log sets quickly.
- User can view session history.
- User can log bodyweight.
- User can view the five seed goals.
- User can see basic progress charts.
- User has an Adventurer.
- Completing a workout grants XP.
- At least five achievements can unlock.
- User has a pet screen.
- User can export data.

---

## 16. Definition of done for public V1

Public V1 is done when:

- Onboarding exists.
- User can create custom workouts.
- User can create or select a program.
- User can log workouts and cardio.
- User can track goals.
- User can view meaningful progress dashboards.
- Adventurer leveling exists.
- Achievements and gear unlocks exist.
- Pet progression exists.
- Data can be backed up or exported.
- App has privacy policy and terms.
- App has App Store / Google Play metadata.
- App has a basic entitlement system.
- Premium features are clearly separated from free features.
- App has been tested by external beta users.

---

## 17. Immediate next tasks

Recommended next tasks for the coding assistant:

1. Create Flutter project.
2. Add project folder structure from `app_design.md`.
3. Add bottom navigation shell.
4. Add theme and placeholder screens.
5. Add local database package.
6. Define first database schema.
7. Convert the original handover into 2026 seed JSON/Dart data.
8. Implement Today screen using seed data.
9. Implement workout execution flow.
10. Implement session persistence.

The first working prototype should answer one question:

> Can I open the app, see today’s quest, complete a real workout, and feel rewarded afterward?
