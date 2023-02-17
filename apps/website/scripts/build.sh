#!/bin/sh

cd ../

## localization convert
parse-hocon lib/l10n/app_en.conf > lib/l10n/app_en.arb
parse-hocon lib/l10n/app_ru.conf > lib/l10n/app_ru.arb

## flutter
flutter clean
flutter pub get

## gen localization run
flutter gen-l10n

## gen by annotation
flutter pub run build_runner build --delete-conflicting-outputs

## build web
flutter build web --web-renderer canvaskit

## fix flutter assets folder
mv build/web/assets/assets/* build/web/assets