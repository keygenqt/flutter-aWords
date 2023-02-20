import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:validated/validated.dart' as validated;
import 'package:website/base/app_di.dart';
import 'package:website/extensions/error_ext.dart';
import 'package:website/http/request/sign_up_request.dart';
import 'package:website/http/services/auth_service.dart';

/// Model for [SignUpPage]
class SignUpModel extends Model {
  /// Get [ScopedModel]
  static SignUpModel of(BuildContext context) => ScopedModel.of<SignUpModel>(context);

  /// Get service users
  final AuthService service = getIt<AuthService>();

  /// Error response
  bool _loading = false;

  bool get loading => _loading;

  /// Error response common form
  Map<String, String> _error = {};

  String? get errorCommon => _error['form'];

  /// Success response
  bool _success = false;

  bool get success => _success;

  /// Get users
  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _error = {};
    _loading = true;
    _success = false;
    notifyListeners();
    try {
      // for animation
      await Future.delayed(const Duration(seconds: 1));
      // execute request
      await service.registration(SignUpRequest(
        name: name,
        email: email,
        password: password,
        uniqueKey: 'uniqueKey',
      ));
      _success = true;
    } catch (e) {
      _error = e.getErrors();
      print(_error);
      _loading = false;
    }
    notifyListeners();
    return _success;
  }

  /// Validate name change
  String? validateName(BuildContext context, String? value) {
    // validate client
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.signUp_validate_name_empty;
    }
    // validate from server
    return _error['name'];
  }

  /// Validate email change
  String? validateEmail(BuildContext context, String? value) {
    // validate client
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.signUp_validate_email_empty;
    } else if (!validated.isEmail(value)) {
      return AppLocalizations.of(context)!.signUp_validate_email_not_match;
    }
    // validate from server
    return _error['email'];
  }

  /// Validate password change
  String? validatePassword(BuildContext context, String? value) {
    // validate client
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.signUp_validate_password_empty;
    }
    // validate from server
    return _error['password'];
  }

  /// Clear server error
  void clearError() {
    _error.clear();
  }
}
