# Quest for Fitness

Quest for Fitness is a commercial RPG fitness tracker for iOS and Android, built with Flutter and Dart.

The product direction is documented in:

- `app_design.md`
- `technical_architecture.md`
- `development_roadmap.md`

The May–September 2026 personal training block is treated as seed/sample campaign content, not as the full app scope.

## Current Status

- Milestone 1 Fitness Core MVP is implemented.
- Fresh installs load the May–September 2026 sample campaign.
- Today shows campaign guidance and can launch planned workout execution when a workout is scheduled.
- Planned workouts can be completed and reviewed in session history.
- Bodyweight can be logged from Progress and updates the linked bodyweight goal.
- Sprint 2.0 is planned as a polish bridge to make fresh installs clearer and easier to test immediately.

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
- If Flutter/Dart tooling fails with cache, native asset, file-lock, or timeout symptoms, use the already approved outside-sandbox command path for the specific command instead of retrying repeatedly inside the sandbox.
- If `flutter build apk --debug` reports a missing native SQLite artifact under `.dart_tool/hooks_runner`, run `flutter clean`, then `flutter pub get`, then rerun verification.
