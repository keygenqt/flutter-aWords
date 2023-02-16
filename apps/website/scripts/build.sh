#!/bin/sh

## flutter
flutter clean
flutter pub get

## build localization
sh ./l10n.sh

## build web
flutter build web

## fix flutter assets folder
mv build/web/assets/assets/* build/web/assets