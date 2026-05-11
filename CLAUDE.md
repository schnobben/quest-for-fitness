# Quest for Fitness

## What this is
A Flutter + Dart RPG fitness tracker app targeting iOS and Android.
Commercial app with free core features and optional premium subscription.

## Stack
- Flutter / Dart
- Riverpod (state management)
- go_router (routing)
- Drift / SQLite (local database)
- Freezed + json_serializable (code generation)
- fl_chart (charts)

## Project structure
- lib/app — routing and app shell
- lib/core — shared utilities
- lib/data — database, repositories, migrations
- lib/features — feature modules (quest, workout_execution, etc.)
- test — unit and widget tests

## Key rules
- Always run: flutter analyze, flutter test --reporter expanded, flutter build apk --debug
- Never hardcode dates or user data
- Keep RPG and fitness layers separate
- All database changes need migrations

## Current status
Milestones 0–4 complete. Milestone 5 in progress. Sprint 5.1 (Custom Exercise Builder) complete. Sprint 5.2 (Custom Workout Builder) complete. Next: Sprint 5.3 — Program Builder v1.
