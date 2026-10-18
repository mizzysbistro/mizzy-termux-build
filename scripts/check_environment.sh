#!/data/data/com.termux/files/usr/bin/bash
set -u

printf '%s\n' "Mizzy Termux build environment check"
printf '%s\n' "This script only reads environment information; it does not install or modify packages."
printf '\n'

show_command() {
  name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    printf '[OK] %s: ' "$name"
    command -v "$name"
  else
    printf '[MISSING] %s\n' "$name"
  fi
}

printf 'Architecture: '
uname -m 2>/dev/null || printf '%s\n' 'unknown'
printf 'Android release: '
getprop ro.build.version.release 2>/dev/null || printf '%s\n' 'unavailable'
printf 'Android SDK level: '
getprop ro.build.version.sdk 2>/dev/null || printf '%s\n' 'unavailable'
printf 'Termux prefix: %s\n' "${PREFIX:-not set}"
printf 'Home directory: %s\n' "${HOME:-not set}"
printf '\n'

for tool in git bash curl wget unzip zip java flutter dart adb sdkmanager; do
  show_command "$tool"
done

if command -v java >/dev/null 2>&1; then
  printf '\nJava version details:\n'
  java -version 2>&1 | head -n 3
fi

if command -v flutter >/dev/null 2>&1; then
  printf '\nFlutter version:\n'
  flutter --version 2>&1 | head -n 5
fi

printf '\nNext: read docs/TERMUX_SETUP.md and docs/FLUTTER_SETUP.md. Aarch64 alone does not guarantee native APK build compatibility.\n'
