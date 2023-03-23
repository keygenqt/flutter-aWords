import 'package:flutter/material.dart';
import 'package:website/layouts/app_layout.dart';
import 'package:website/pages/card/page.dart';
import 'package:website/pages/cards/page.dart';
import 'package:website/pages/errors/page.dart';
import 'package:website/pages/friends/page.dart';
import 'package:website/pages/home/page.dart';
import 'package:website/pages/sign_in/page.dart';
import 'package:website/pages/sign_up/page.dart';
import 'package:website/pages/stats/page.dart';
import 'package:website/routes/route.dart';

/// Routes app
class AppRoutes {
  static const String home = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String card = '/card';
  static const String cards = '/cards';
  static const String stats = '/stats';
  static const String friends = '/friends';

  /// Route after login
  static String? _redirect;

  static String get redirect => _redirect ?? home;

  /// Route after login
  static String? _current;

  static String get current => _current ?? home;

  /// Pages routing
  static List<AppRoute> routes = [
    AppRoute(
        route: home,
        widget: (arguments) => const AppLayout(
              type: AppLayoutType.white,
              page: HomePage(),
            )),
    AppRoute(
        user: false,
        route: signIn,
        widget: (arguments) => const AppLayout(
              page: SignInPage(),
            )),
    AppRoute(
        user: false,
        route: signUp,
        widget: (arguments) => const AppLayout(
              page: SignUpPage(),
            )),
    AppRoute(
        user: true,
        route: card,
        // @todo path argument route for web
        widget: (arguments) => AppLayout(
              page: CardPage(id: 12),
            )),
    AppRoute(
        user: true,
        route: cards,
        widget: (arguments) => const AppLayout(
              page: CardsPage(),
            )),
    AppRoute(
        user: true,
        route: stats,
        widget: (arguments) => const AppLayout(
              page: StatsPage(),
            )),
    AppRoute(
        user: true,
        route: friends,
        widget: (arguments) => const AppLayout(
              page: FriendsPage(),
            )),
  ];

  /// Generate [PageRouteBuilder]
  static PageRouteBuilder generateRoute(RouteSettings settings, bool user) {
    // clear redirect
    _redirect = null;
    // find route
    for (var route in routes) {
      if (settings.name == route.route) {
        if (route.user == null || route.user == user) {
          // set current page
          _current = settings.name;
          // show page
          return _routeWithAnimation(settings, route.widget(settings.arguments));
        } else if (route.user == true) {
          // set redirect after login
          _redirect = settings.name;
          // show page Sing In
          return _routeWithAnimation(
            const RouteSettings(name: AppRoutes.signIn),
            routes.firstWhere((element) => element.route == AppRoutes.signIn).widget(settings.arguments),
          );
        }
        break;
      }
    }
    return _routeWithAnimation(
        settings,
        const AppLayout(
          page: Error404Page(),
        ));
  }

  /// Route animate
  static PageRouteBuilder _routeWithAnimation(
    RouteSettings settings,
    Widget widget,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return widget;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
