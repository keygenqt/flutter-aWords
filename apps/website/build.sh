#!/bin/sh

## open root dir
cd ../../
## update git
git pull
## cd back
cd apps/website || exit
## localization convert
parse-hocon lib/l10n/app_en.conf > lib/l10n/app_en.arb
parse-hocon lib/l10n/app_ru.conf > lib/l10n/app_ru.arb
## run flutter
flutter clean
flutter pub get
flutter gen-l10n
# flutter run build_runner build
flutter build web
## fix flutter assets folder
mv build/web/assets/assets/* build/web/assets