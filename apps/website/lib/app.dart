import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:website/layouts/app_layout.dart';
import 'package:website/layouts/empty_layout.dart';
import 'package:website/pages/errors/page.dart';
import 'package:website/pages/home/page.dart';
import 'package:website/pages/login/page.dart';
import 'package:website/pages/registration/page.dart';
import 'package:website/theme/theme.dart';

const locale = Locale('en');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'aWords',
      theme: appTheme,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _routeWithAnimation(settings, const AppLayout(
              page: HomePage(),
              locale: locale,
            ));
          case '/login':
            return _routeWithAnimation(settings, const EmptyLayout(
              page: LoginPage(),
              locale: locale,
            ));
          case '/registration':
            return _routeWithAnimation(settings, const EmptyLayout(
              page: RegistrationPage(),
              locale: locale,
            ));
          default:
            return _routeWithAnimation(settings, const AppLayout(
              type: AppLayoutType.gray,
              page: Error404Page(),
              locale: locale,
            ));
        }
      },
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
