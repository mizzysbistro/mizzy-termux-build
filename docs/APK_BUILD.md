# Build and verify an APK

## Prerequisites
- A real Flutter app project directory containing `pubspec.yaml` and an `android/` directory.
- Flutter, a compatible JDK, Android SDK command-line/build tools, accepted SDK licenses, and all project dependencies.
- A toolchain compatible with the project and host. Termux native Android builds are not guaranteed.

## Inspect before building
From the Flutter app root:
```sh
git status --short
flutter --version
flutter doctor -v
flutter pub get
flutter analyze
flutter test
```

Fix errors rather than ignoring them. Some existing projects may not have tests; record that fact rather than claiming tests passed.

## Build a debug APK
```sh
flutter build apk --debug
```

Expected output for a standard Flutter project:
`build/app/outputs/flutter-apk/app-debug.apk`

## Build a release APK
Only after the debug build and tests are satisfactory:
```sh
flutter build apk --release
```

A release APK is not necessarily signed with a production key. Do not commit signing keys or passwords. Configure release signing locally and securely only when needed.

## Verify output
```sh
test -s build/app/outputs/flutter-apk/app-debug.apk
sha256sum build/app/outputs/flutter-apk/app-debug.apk
```

Keep the SHA-256 output alongside the artifact when transferring it. A checksum verifies file integrity against the recorded checksum; it does not prove the APK is safe or that the app functions correctly.

## Android 16 and ARM64
Test installation and app behavior on the actual target device. For a standard APK, inspect supported ABIs with Android SDK tools if available. Do not claim Android 16 compatibility until installation and key workflows have been tested on Android 16.
