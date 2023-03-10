Libraries
===

```yaml
name: server_awords
description: Server application aWords.
version: 0.0.1
publish_to: none

environment:
  sdk: ">=2.19.0 <3.0.0"

dependencies:
  # https://pub.dev/packages/args
  # Parses raw command-line arguments into a set of options and values.
  args: ^2.4.0
  # https://pub.dev/packages/drift
  # Drift is a reactive persistence library for Flutter and Dart, built on top of sqlite.
  drift: ^2.5.0
  # https://pub.dev/packages/encrypt
  # A set of high-level APIs over PointyCastle for two-way cryptography.
  encrypt: ^5.0.1
  # https://pub.dev/packages/get_it
  # This is a simple Service Locator for Dart and Flutter projects with some additional goodies 
  # highly inspired by Splat.
  get_it: ^7.2.0
  # https://pub.dev/packages/json_annotation
  # Defines the annotations used by json_serializable to create code for JSON serialization 
  # and deserialization.
  json_annotation: ^4.8.0
  # https://pub.dev/packages/mason_logger
  # A reusable logger used by the Mason CLI.
  mason_logger: ^0.2.4
  # https://pub.dev/packages/path
  # A comprehensive, cross-platform path manipulation library for Dart.
  path: ^1.8.3
  # https://pub.dev/packages/pointycastle
  # A Dart library for encryption and decryption. In this release, most of the classes are ports 
  # of Bouncy Castle from Java to Dart.
  pointycastle: ^3.6.2
  # https://pub.dev/packages/pub_updater
  # A Dart package which enables checking whether packages are up to date and supports 
  # updating them.
  pub_updater: ^0.2.4
  # https://pub.dev/packages/settings_yaml
  # Provide a very simple method to use yaml files for reading/writing an app's configuration.
  settings_yaml: ^5.0.0
  # https://pub.dev/packages/validated
  # The ultimate dart + flutter string validators.
  validated: ^2.0.0

dev_dependencies:
  # https://pub.dev/packages/build_runner
  # The build_runner package provides a concrete way of generating files using Dart code, 
  # outside of tools like pub.
  build_runner: ^2.3.3
  # https://pub.dev/packages/build_verify
  # Test utility to ensure generated Dart code within a package is up-to-date when 
  # using package:build.
  build_verify: ^3.0.0
  # https://pub.dev/packages/build_version
  # Include the version of your package in our source code.
  build_version: ^2.1.1
  # https://pub.dev/packages/drift_dev
  # This library contains the generator that turns your Table classes from drift 
  # into database code.
  drift_dev: ^2.5.2
  # https://pub.dev/packages/json_serializable
  # Provides Dart Build System builders for handling JSON.
  json_serializable: ^6.6.1
  # https://pub.dev/packages/mocktail
  # Mock library for Dart inspired by mockito.
  mocktail: ^0.3.0
  # https://pub.dev/packages/test
  # test provides a standard way of writing and running tests in Dart.
  test: ^1.19.2
  # https://pub.dev/packages/very_good_analysis
  # This package provides lint rules for Dart and Flutter which are used at Very Good Ventures.
  very_good_analysis: ^4.0.0+1
```