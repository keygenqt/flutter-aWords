import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/utils/locale.dart';

/// Global model for app
class AppModel extends Model {
  /// Get [ScopedModel]
  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

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
}
