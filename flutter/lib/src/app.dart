// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:js' as JS;

import 'package:awords/src/extension/colors.dart';
import 'package:flutter/material.dart';

import 'routing.dart';
import 'screens/navigator.dart';
import 'dart:async';

Timer? timer;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final RouteState _routeState;
  late final SimpleRouterDelegate _routerDelegate;
  late final TemplateRouteParser _routeParser;

  ColorScheme _colorScheme = ThemeData().colorScheme;

  @override
  void initState() {
    JS.context['setColor'] = (String bgColor, String textColor) {
      setState(() {
        _colorScheme = _colorScheme.copyWith(primary: bgColor.toColor());
        Timer(
            const Duration(milliseconds: 1000),
                () => {
              _send('setColor', {
                'bgColor': bgColor,
                'textColor': textColor,
              })
            });
      });
    };
    _send('init');

    /// Configure the parser with all of the app's allowed path templates.
    _routeParser = TemplateRouteParser(
      allowedPaths: [
        '/auth',
        '/cards',
        '/cards/:cardId',
        '/cards/search',
        '/cards/create',
        '/cards/stats/:cardId',
      ],
      initialRoute: '/cards',
    );

    _routeState = RouteState(_routeParser);

    _routerDelegate = SimpleRouterDelegate(
      routeState: _routeState,
      navigatorKey: _navigatorKey,
      builder: (context) => AppNavigator(
        navigatorKey: _navigatorKey,
      ),
    );

    super.initState();
  }

  void _send(String action, [dynamic data]) {
    var event = CustomEvent('framescript:action',
        detail: {'action': action, 'data': data ?? {}});
    document.dispatchEvent(event);
  }

  @override
  Widget build(BuildContext context) => RouteStateScope(
        notifier: _routeState,
        child: MaterialApp.router(
          routerDelegate: _routerDelegate,
          routeInformationParser: _routeParser,
          // Revert back to pre-Flutter-2.5 transition behavior:
          // https://github.com/flutter/flutter/issues/82053
          theme: ThemeData(
            colorScheme: _colorScheme,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
              },
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _routeState.dispose();
    _routerDelegate.dispose();
    super.dispose();
  }
}
