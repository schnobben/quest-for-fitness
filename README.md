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

Run the baseline checks with:

```sh
flutter analyze
flutter test
flutter build apk --debug
```
