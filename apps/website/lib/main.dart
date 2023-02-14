import 'package:flutter/material.dart';
import 'package:regex_router/regex_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:website/pages/errors/error404.dart';
import 'package:website/pages/home/home.dart';

import 'layouts/app_layout.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = RegexRouter.create({
    "/": (context, _) => const AppLayout(page: HomePage()),
    "^.*\$": (context, _) => const AppLayout(page: Error404Page()),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aWords',
      theme: ThemeData(),
      initialRoute: "/",
      onGenerateRoute: router.generateRoute,
    );
  }
}
