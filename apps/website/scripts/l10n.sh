#!/bin/sh

cd ../

## localization convert
parse-hocon lib/l10n/app_en.conf > lib/l10n/app_en.arb
parse-hocon lib/l10n/app_ru.conf > lib/l10n/app_ru.arb

## gen localization run
flutter gen-l10n

cd scripts || exit
