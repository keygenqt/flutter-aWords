import 'package:flutter/material.dart';
import 'package:regex_router/regex_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:website/layouts/empty_layout.dart';
import 'package:website/pages/errors/page.dart';
import 'package:website/pages/home/page.dart';
import 'package:website/pages/login/page.dart';
import 'package:website/pages/registration/page.dart';

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
    "/login": (context, _) => const EmptyLayout(page: LoginPage()),
    "/registration": (context, _) => const EmptyLayout(page: RegistrationPage()),
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
