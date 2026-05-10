# Quest for Fitness

Quest for Fitness is a commercial RPG fitness tracker for iOS and Android, built with Flutter and Dart.

The product direction is documented in:

- `app_design.md`
- `technical_architecture.md`
- `development_roadmap.md`

The May-September 2026 personal training block is treated as seed/sample campaign content, not as the full app scope.

## Current Status

- Milestones 1 and 2 are implemented.
- Milestone 3 Quest Engine V1 is in progress through Sprint 3.5.
- Fresh installs load the May-September 2026 sample campaign.
- Today shows campaign guidance and can launch the next planned workout immediately.
- Planned workouts can be completed, reviewed in session history, and converted into XP/reward progress.
- Progress supports bodyweight logging, editable goals, analytics, working weights, cardio/run logging, and progression suggestions.
- Quest now has a persisted Adventurer profile, XP/level progression, reward history, Achievements V1, cosmetic equipment, and selectable titles.
- Planned workout completion now routes through a skippable reward summary screen with XP, unlock, PR, goal, and pet-bond feedback.
- Current database schema version: 8.

## Next Sprint

Next planned roadmap item: **Sprint 4.1 - Pet model and stats**.

Expected starting points:

- Reuse the existing fitness/reward event pipeline instead of adding direct UI-to-RPG writes.
- Keep equipment/titles cosmetic for now and avoid coupling them to workout save reliability.
- Pet-bond rows on the completion screen are placeholders until Milestone 4 adds the pet model.
- Update `development_roadmap.md` completion notes after the sprint is finished.

## Verification

For normal sprint work, use a tiered verification loop:

1. Run targeted tests for the area being changed.
2. Run `flutter analyze`.
3. Run `flutter test --reporter expanded`.
4. Run `flutter build apk --debug` only when the sprint changes database/codegen, native assets, platform build behavior, or when full roadmap verification is requested.

Baseline full verification:

```sh
flutter analyze
flutter test --reporter expanded
flutter build apk --debug
```

### Flutter tooling notes for coding agents

On this Windows development host, Flutter/Dart commands can hang or fail when sandboxed because they share state in `.dart_tool`, `build/`, Gradle caches, and native asset hooks. This is especially common around Drift/build_runner output and `sqlite3_flutter_libs` native asset generation.

Operational rules:

- Do not run Flutter/Dart toolchain commands in parallel. Run `dart format`, `dart run build_runner ...`, `flutter analyze`, `flutter test`, `flutter clean`, and `flutter build apk --debug` sequentially.
- Prefer sandboxed commands for source inspection and normal file reads.
- If Flutter/Dart tooling fails with cache, native asset, file-lock, or timeout symptoms, use the already approved outside-sandbox command path for the specific command instead of retrying repeatedly inside the sandbox. Do not spend multiple attempts on the same sandbox failure.
- Before rerunning after a timeout, inspect for stale `dart`, `dartvm`, `flutter`, `java`, or Gradle processes from the failed command.
- Prefer `.\tooling\verify.ps1 -Mode targeted-db` or `.\tooling\verify.ps1 -Mode targeted-widget` before the full suite when the changed area is narrow.
- If `flutter build apk --debug` reports a missing native SQLite artifact under `.dart_tool/hooks_runner`, run `flutter clean`, then `flutter pub get`, then rerun verification.

See `tooling/verification_policy.md` for the full failure-classification policy.
