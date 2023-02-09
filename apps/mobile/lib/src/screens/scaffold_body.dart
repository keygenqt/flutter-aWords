// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:awords/src/screens/cards/cards.dart';
import 'package:awords/src/screens/create/create.dart';
import 'package:awords/src/screens/search/search.dart';
import 'package:flutter/material.dart';

import '../routing.dart';
import '../widgets/fade_transition_page.dart';
import 'scaffold.dart';

/// Displays the contents of the body of [AppScaffold]
class BookstoreScaffoldBody extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const BookstoreScaffoldBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var currentRoute = RouteStateScope.of(context).route;

    // A nested Router isn't necessary because the back button behavior doesn't
    // need to be customized.
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, dynamic result) => route.didPop(result),
      pages: [
        if (currentRoute.pathTemplate == '/cards')
          const FadeTransitionPage<void>(
            key: ValueKey('cards'),
            child: CardsScreen(),
          )
        else if (currentRoute.pathTemplate.startsWith('/cards/search'))
          const FadeTransitionPage<void>(
            key: ValueKey('cards/search'),
            child: SearchScreen(),
          )
        else if (currentRoute.pathTemplate.startsWith('/cards/create') ||
            currentRoute.pathTemplate == '/')
          const FadeTransitionPage<void>(
            key: ValueKey('cards/create'),
            child: CreateScreen(),
          )

        // Avoid building a Navigator with an empty `pages` list when the
        // RouteState is set to an unexpected path, such as /signin.
        //
        // Since RouteStateScope is an InheritedNotifier, any change to the
        // route will result in a call to this build method, even though this
        // widget isn't built when those routes are active.
        else
          FadeTransitionPage<void>(
            key: const ValueKey('empty'),
            child: Container(),
          ),
      ],
    );
  }
}
