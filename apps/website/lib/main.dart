import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:website/app.dart';
import 'package:website/base/app_di.dart';
import 'package:website/build/build.debug.dart';

void main() {
  setPathUrlStrategy();
  setupDI(BuildDebugConfig());
  runApp(const MyApp());
}
