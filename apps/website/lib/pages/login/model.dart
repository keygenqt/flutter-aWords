import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/extensions/error_ext.dart';
import 'package:website/http/request/auth_request.dart';
import 'package:website/http/response/auth_response.dart';
import 'package:website/http/services/auth_service.dart';

/// [LoginPage] ViewModel
class LoginModel extends Model {
  /// Get [ScopedModel]
  static LoginModel of(BuildContext context) => ScopedModel.of<LoginModel>(context);

  /// Get service users
  final AuthService service = getIt<AuthService>();

  /// Error response
  bool _loading = false;

  bool get loading => _loading;

  /// Error response common form
  Map<String, String> _error = {};

  Map<String, String> get error => _error;

  /// Success response
  bool _success = false;

  bool get success => _success;

  /// Users response
  AuthResponse? _auth;

  AuthResponse? get auth => _auth;

  /// Get users
  Future<bool> login({
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
      _auth = await service.login(AuthRequest(
        email: email,
        password: password,
        uniqueKey: 'uniqueKey',
      ));
      _success = true;
    } catch (e) {
      _error = e.getErrors();
    }
    _loading = false;
    notifyListeners();
    return _success;
  }

  /// Clear error field change
  void clear(field) {
    _error.remove(field);
    notifyListeners();
  }
}
