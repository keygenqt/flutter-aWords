#!/bin/sh

dart pub get
dart run build_runner build
dart compile exe bin/main.dart -o bin/aWords
