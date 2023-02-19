import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/http/services/auth_service.dart';
import 'package:website/utils/locale.dart';

/// Global model for app
class AppModel extends Model {
  /// Get [ScopedModel]
  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

  /// Static check has cookie login
  static bool get checkIsLogin => document.cookie?.contains('isLogin=true') ?? false;

  /// Private value isLogin
  bool _isLogin = checkIsLogin;

  /// Get bool is user
  bool get isLogin => _isLogin;

  /// Get service auth
  final AuthService service = getIt<AuthService>();

  /// Private value locale
  AppLocale _locale = AppLocale.en;

  /// Get enum locale
  AppLocale get locale => _locale;

  /// Get platform locale
  Locale get platformLocale => Locale(_locale.name.toLowerCase());

  /// Change locale
  void toggleLocale() {
    _locale = _locale == AppLocale.en ? AppLocale.ru : AppLocale.en;
    notifyListeners();
  }

  /// Login user
  void login() {
    _isLogin = true;
    notifyListeners();
  }

  /// Logout user
  void logout() {
    service.logout();
    _isLogin = false;
    notifyListeners();
  }
}
