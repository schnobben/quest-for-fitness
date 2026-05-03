# Quest for Fitness

Quest for Fitness is a commercial RPG fitness tracker for iOS and Android, built with Flutter and Dart.

The product direction is documented in:

- `app_design.md`
- `technical_architecture.md`
- `development_roadmap.md`

The May–September 2026 personal training block is treated as seed/sample campaign content, not as the full app scope.

## Current Foundation

- Flutter app scaffold with Android and iOS targets.
- Riverpod app root.
- go_router bottom navigation shell.
- Dark visual theme and shared design-system components.
- Placeholder screens for Today, Log, Progress, Quest, Library, and Settings.
- Package structure prepared for feature modules, local data, repositories, seed data, and migrations.

## Verification

Run the baseline checks with:

```sh
flutter analyze
flutter test
flutter build apk --debug
```
