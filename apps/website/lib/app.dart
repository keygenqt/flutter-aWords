import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/layouts/app_layout.dart';
import 'package:website/model.dart';
import 'package:website/pages/errors/page.dart';
import 'package:website/pages/home/page.dart';
import 'package:website/pages/login/page.dart';
import 'package:website/pages/registration/page.dart';
import 'package:website/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: AppModel(),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'aWords',
        theme: appTheme,
        initialRoute: "/",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    page: HomePage(),
                  ));
            case '/login':
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: LoginPage(),
                  ));
            case '/registration':
              return _routeWithAnimation(
                  settings,
                  const AppLayout(
                    type: AppLayoutType.gray,
                    page: RegistrationPage(),
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
