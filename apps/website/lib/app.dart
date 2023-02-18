import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/layouts/app_layout.dart';
import 'package:website/model.dart';
import 'package:website/pages/cards/page.dart';
import 'package:website/pages/errors/page.dart';
import 'package:website/pages/friends/page.dart';
import 'package:website/pages/home/page.dart';
import 'package:website/pages/sign_in/page.dart';
import 'package:website/pages/sign_up/page.dart';
import 'package:website/pages/stats/page.dart';
import 'package:website/theme/theme.dart';

/// Routes app
class AppRoutes {
  static const String home = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String cards = '/cards';
  static const String stats = '/stats';
  static const String friends = '/friends';
}

/// Main app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: getIt<AppModel>(),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'aWords',
        theme: appTheme,
        initialRoute: "/",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    page: HomePage(),
                  ));
            case AppRoutes.signIn:
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: SignInPage(),
                  ));
            case AppRoutes.signUp:
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: SignUpPage(),
                  ));
            case AppRoutes.cards:
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: CardsPage(),
                  ));
            case AppRoutes.stats:
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: StatsPage(),
                  ));
            case AppRoutes.friends:
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: FriendsPage(),
                  ));
            default:
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: Error404Page(),
                  ));
          }
        },
      ),
    );
  }

  PageRouteBuilder _routeWithAnimation(
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
