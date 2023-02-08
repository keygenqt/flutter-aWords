import 'package:awords/src/app.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setHashUrlStrategy();
  // setPathUrlStrategy();
  runApp(const App());
}