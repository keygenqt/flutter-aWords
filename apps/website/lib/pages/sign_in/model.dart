import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:validated/validated.dart' as validated;
import 'package:website/base/app_di.dart';
import 'package:website/extensions/error_ext.dart';
import 'package:website/http/request/sign_in_request.dart';
import 'package:website/http/services/auth_service.dart';

/// Model for [SignInPage]
class SignInModel extends Model {
  /// Get [ScopedModel]
  static SignInModel of(BuildContext context) => ScopedModel.of<SignInModel>(context);

  /// Get service auth
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
  Future<bool> signIn({
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
      await service.login(SignInRequest(
        email: email,
        password: password,
        uniqueKey: await Ipify.ipv64(),
      ));
      _success = true;
    } catch (e) {
      _error = e.getErrors();
      _loading = false;
    }
    notifyListeners();
    return _success;
  }

  /// Validate email change
  String? validateEmail(BuildContext context, String? value) {
    // validate client
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.signIn_validate_email_empty;
    } else if (!validated.isEmail(value)) {
      return AppLocalizations.of(context)!.signIn_validate_email_not_match;
    }
    // validate from server
    final server = _error['email'];
    _error.remove('email');
    return server;
  }

  /// Validate password change
  String? validatePassword(BuildContext context, String? value) {
    // validate client
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.signIn_validate_password_empty;
    }
    // validate from server
    final server = _error['password'];
    _error.remove('password');
    return server;
  }
}
