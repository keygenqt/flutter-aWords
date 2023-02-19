import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/model.dart';
import 'package:website/routes/routes.dart';
import 'package:website/theme/theme.dart';

/// Main app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: getIt<AppModel>(),
      child: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'aWords',
          theme: appTheme,
          initialRoute: AppRoutes.home,
          onGenerateRoute: (settings) => AppRoutes.generateRoute(settings, model.isLogin),
        ),
      ),
    );
  }
}
