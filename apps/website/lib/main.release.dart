import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:website/app.dart';
import 'package:website/base/app_di.dart';

void main() {
  setupDI(true);
  setPathUrlStrategy();
  runApp(const MyApp());
}
