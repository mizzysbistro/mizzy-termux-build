# Mizzy's Bistro POS — Termux Build Setup

This repository contains setup instructions and scripts for preparing Termux on Android to inspect and, where compatible, build the Mizzy's Bistro POS Flutter app locally.

## Goals
- Use free, on-device development tools wherever practical.
- Check device architecture and installed tools before building.
- Build and test a Flutter Android APK locally where compatible.
- Keep the POS source code separate until the build environment is verified.

## Guides
1. [Termux preparation](docs/TERMUX_SETUP.md)
2. [Flutter compatibility and setup](docs/FLUTTER_SETUP.md)
3. [APK build and verification](docs/APK_BUILD.md)
4. [Checksum verification notes](checksums/README.md)

## Scripts
- Read-only environment diagnostic: `bash scripts/check_environment.sh`
- Guarded APK build helper: `bash scripts/build_apk.sh /path/to/flutter-project debug`

Review scripts before running them. The build helper runs `flutter doctor -v`, `flutter pub get`, and `flutter analyze` before attempting an APK build.

## Important notes
Termux is not an officially supported Flutter/Android build host. Compatibility depends on the device, packages, Java, Android SDK, Flutter version, and project dependencies. Android 16 on the target device does not guarantee native builds will work in Termux.

## Security
Never commit passwords, access tokens, signing keys, `key.properties`, `.env` files, Supabase service-role keys, database exports, or customer data. This repository is for build tooling and documentation, not the private POS source.

## Status
Setup documentation and helper scripts have been committed. No APK has been built or verified yet.