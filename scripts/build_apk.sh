#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail

usage() {
  printf 'Usage: bash scripts/build_apk.sh /path/to/flutter-project [debug|release]\n'
}

if [[ "${1:-}" == "" || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

PROJECT_DIR="$1"
BUILD_MODE="${2:-debug}"

case "$BUILD_MODE" in
  debug|release) ;;
  *) echo "ERROR: build mode must be debug or release." >&2; usage; exit 2 ;;
esac

if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "ERROR: project directory does not exist: $PROJECT_DIR" >&2
  exit 2
fi

PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"
if [[ ! -f "$PROJECT_DIR/pubspec.yaml" || ! -d "$PROJECT_DIR/android" ]]; then
  echo "ERROR: expected a Flutter project containing pubspec.yaml and android/." >&2
  exit 2
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "ERROR: flutter is not on PATH. Review docs/FLUTTER_SETUP.md first." >&2
  exit 127
fi

echo "Project: $PROJECT_DIR"
echo "Mode: $BUILD_MODE"
echo "Checking Flutter version and doctor output..."
flutter --version
flutter doctor -v

cd "$PROJECT_DIR"
echo "Fetching dependencies..."
flutter pub get

echo "Running static analysis..."
flutter analyze

if [[ "$BUILD_MODE" == "debug" ]]; then
  flutter build apk --debug
  APK="$PROJECT_DIR/build/app/outputs/flutter-apk/app-debug.apk"
else
  flutter build apk --release
  APK="$PROJECT_DIR/build/app/outputs/flutter-apk/app-release.apk"
fi

if [[ ! -s "$APK" ]]; then
  echo "ERROR: build command finished but expected APK was not found: $APK" >&2
  exit 1
fi

echo "Build artifact found: $APK"
if command -v sha256sum >/dev/null 2>&1; then
  sha256sum "$APK"
fi
echo "Build command succeeded. Install and test the APK on the target Android device before calling it verified."
