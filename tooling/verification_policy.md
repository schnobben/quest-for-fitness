# Verification Policy

This project runs on a Windows Flutter/Dart toolchain that can hang when commands touch shared `.dart_tool`, `build`, Gradle, or native asset state from inside the sandbox. Treat these as tooling failures first, not application test failures.

## Command Rules

- Run Flutter/Dart toolchain commands sequentially only.
- Use targeted tests before full-suite verification.
- Do not retry a sandboxed Flutter/Dart command after the first timeout, file-lock, cache, native-asset, or network symptom. Rerun that same command outside the sandbox through the approved command prefix path.
- Before rerunning after a timeout, inspect for stale `dart`, `dartvm`, `flutter`, `java`, or Gradle processes from the failed command.
- Do not use full `flutter test --reporter expanded` as the first diagnostic step when a narrower repository or widget test can isolate the change.

## Recommended Order

1. `.\tooling\verify.ps1 -Mode targeted-db` for repository/database changes.
2. `.\tooling\verify.ps1 -Mode targeted-widget` for UI/navigation changes.
3. `.\tooling\verify.ps1 -Mode analyze`.
4. `.\tooling\verify.ps1 -Mode full` after targeted checks pass.
5. Add `-BuildApk` only for schema, codegen, native asset, platform, or full milestone verification.

## Failure Classification

- **Tooling timeout:** sandbox timeout, stale process, file lock, cache/native-asset error. Stop retrying sandboxed commands and rerun outside the sandbox.
- **Real test failure:** assertion failure, exception with a file/line in project test code, or widget hit-test warning. Fix the narrow failing test first.
- **Environment failure:** dependency resolution, SDK, network, or Android/Gradle setup issue. Resolve environment state before rerunning tests.

## Widget Test Rule

Treat hit-test warnings as real failures. Use `ensureVisible`, a larger test surface size, or a direct state assertion before rerunning the full suite.
