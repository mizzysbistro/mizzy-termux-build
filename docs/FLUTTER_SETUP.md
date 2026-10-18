# Flutter on Termux: compatibility-first setup

## Important limitation
The standard Flutter Android build workflow is primarily documented for supported desktop host environments. Termux is not an officially supported Flutter/Android host, and native APK builds may fail because of host assumptions, Android SDK tools, emulator/host binaries, Gradle, NDK, or plugin requirements. Android 16 on the target device does not itself establish host-build compatibility.

## Before installing Flutter
1. Identify the actual app project and its Flutter version requirement (check `pubspec.yaml`, `android/gradle/wrapper/gradle-wrapper.properties`, and Android Gradle Plugin declarations).
2. Check the required Java version for the Gradle and Android Gradle Plugin versions used by the project.
3. Check current Flutter documentation and the selected Termux Flutter project's latest instructions. Prefer verifiable releases, pinned versions, and published checksums when available.
4. Do not run a downloaded script using `curl ... | bash`. Download it, inspect it, and verify its source first.

## Verify the SDK after installation
From the app project directory, run:
```sh
flutter --version
flutter doctor -v
flutter pub get
```

A warning or failure from `flutter doctor` is diagnostic information; do not bypass it blindly. Save the complete error output so the specific compatibility issue can be diagnosed.

## Alternative if native build fails
Use Termux to manage source code and run checks, then build on a trusted compatible computer or a free hosted build allowance if one is available. Do not enable paid billing without explicitly choosing to do so.
