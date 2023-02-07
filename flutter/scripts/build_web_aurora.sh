#!/bin/bash

## Build web
flutter build web --base-href "/usr/share/com.keygenqt.aWords/qml/flutter/"

## Rm from aurora build dir
rm -rf ../aurora/aWords/qml/flutter

## Copy build web flutter to aurora
cp -r build/web ../aurora/aWords/qml/flutter