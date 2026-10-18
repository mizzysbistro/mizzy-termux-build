# Termux preparation

This guide prepares Termux; it does not promise that a complete Android SDK build will work natively on every device.

## 1. Install safely
- Install Termux from one trusted source (F-Droid or the official Termux GitHub releases) and keep updates from that same source. Do not mix APK sources because signing keys can differ.
- Avoid unofficial APK mirrors and scripts that run remote code directly.

## 2. Update packages
In Termux:

```sh
pkg update
pkg upgrade
```

Review package changes before confirming.

## 3. Install basic tools
```sh
pkg install git bash coreutils findutils grep sed file curl wget unzip zip nano
```

Java may be available as a Termux package, but Android Gradle Plugin and project versions have specific JDK requirements. Install a JDK only after checking the project’s Gradle and Android Gradle Plugin versions.

## 4. Allow shared-storage access (optional)
```sh
termux-setup-storage
```

Approve Android's permission prompt if you want Termux to access shared storage. Keep source code in Termux's private home directory (for example, `~/projects`) when possible; shared storage has filesystem limitations.

## 5. Check the device
```sh
uname -m
getprop ro.build.version.release
getprop ro.build.version.sdk
```

For a 64-bit ARM device, `uname -m` normally prints `aarch64`. Android 16 normally reports SDK level 36. These checks do not prove that Flutter, Gradle, or Android SDK tooling is compatible.

## 6. Clone this repository
```sh
mkdir -p ~/projects
cd ~/projects
git clone https://github.com/mizzysbistro/mizzy-termux-build.git
cd mizzy-termux-build
bash scripts/check_environment.sh
```

## Safety
Do not paste credentials into terminal commands that may be saved in shell history. Never commit access tokens, keystores, `key.properties`, `.env`, Supabase service-role keys, database exports, or customer records.
