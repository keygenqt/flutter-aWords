// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:awords/src/screens/card/card.dart';
import 'package:awords/src/screens/stats/stats.dart';
import 'package:flutter/material.dart';

import '../routing.dart';
import '../widgets/fade_transition_page.dart';
import 'scaffold.dart';

/// Builds the top-level navigator for the app. The pages to display are based
/// on the `routeState` that was parsed by the TemplateRouteParser.
class AppNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AppNavigator({
    required this.navigatorKey,
    super.key,
  });

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  final _scaffoldKey = const ValueKey('App scaffold');
  final _cardKey = const ValueKey('Card screen');
  final _statsKey = const ValueKey('Stats screen');

  @override
  Widget build(BuildContext context) {
    final routeState = RouteStateScope.of(context);
    final pathTemplate = routeState.route.pathTemplate;

    Map<String, dynamic>? selectedCard;
    if (pathTemplate == '/cards/:cardId') {
      selectedCard = {'id': routeState.route.parameters['cardId']};
    }

    Map<String, dynamic>? selectedStats;
    if (pathTemplate == '/cards/stats/:cardId') {
      selectedStats = {'id': routeState.route.parameters['statsId']};
    }

    return Navigator(
      key: widget.navigatorKey,
      onPopPage: (route, dynamic result) {
        // When a page that is stacked on top of the scaffold is popped, display
        // the /books or /authors tab in BookstoreScaffold.
        if (route.settings is Page &&
            (route.settings as Page).key == _cardKey) {
          routeState.go('/cards');
        }

        if (route.settings is Page &&
            (route.settings as Page).key == _statsKey) {
          routeState.go('/cards');
        }

        return route.didPop(result);
      },
      pages: [
        // Display the app
        FadeTransitionPage<void>(
          key: _scaffoldKey,
          child: const AppScaffold(),
        ),
        // Add an additional page to the stack if the user is viewing a book
        // or an author
        if (selectedCard != null)
          MaterialPage<void>(
            key: _cardKey,
            child: CardScreen(
              card: selectedCard,
            ),
          )
        else if (selectedStats != null)
          MaterialPage<void>(
            key: _statsKey,
            child: StatsScreen(
              stats: selectedStats,
            ),
          ),
      ],
    );
  }
}
