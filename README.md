# Mizzy's Bistro POS — Termux Build Setup

This repository contains setup instructions and scripts for preparing Termux on Android 16 ARM64 to build the Mizzy's Bistro POS app locally.

## Goals
- Use free, on-device development tools wherever practical.
- Check device architecture and installed tools before building.
- Build and test the Flutter Android APK locally where compatible.
- Keep the POS source code separate until the build environment is verified.

## Important notes
Termux is not an officially supported Flutter/Android build host. Compatibility depends on the device, packages, Java, Android SDK, Flutter version, and project dependencies. An APK is not considered ready until a build succeeds and tests have been checked.

## Security
Never commit passwords, access tokens, signing keys, .env files, Supabase service-role keys, or customer data.

## Status
Initial setup stage. No APK has been built or verified yet.