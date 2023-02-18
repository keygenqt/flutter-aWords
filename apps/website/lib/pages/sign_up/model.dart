import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:validated/validated.dart' as validated;
import 'package:website/base/app_di.dart';
import 'package:website/extensions/error_ext.dart';
import 'package:website/http/request/sign_up_request.dart';
import 'package:website/http/response/auth_response.dart';
import 'package:website/http/services/auth_service.dart';

/// [SignUpPage] ViewModel
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

  /// Users response
  AuthResponse? _auth;

  AuthResponse? get auth => _auth;

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
      _auth = await service.registration(SignUpRequest(
        name: name,
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

  /// Validate name change
  String? validateName(String? value) {
    // validate client
    if (value == null || value.trim().isEmpty) {
      return 'Please enter name';
    }
    // validate from server
    final server = _error['name'];
    _error.remove('name');
    return server;
  }

  /// Validate email change
  String? validateEmail(value) {
    // validate client
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else if (!validated.isEmail(value)) {
      return 'Email is not match';
    }
    // validate from server
    final server = _error['email'];
    _error.remove('email');
    return server;
  }

  /// Validate password change
  String? validatePassword(value) {
    // validate client
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    // validate from server
    final server = _error['password'];
    _error.remove('password');
    return server;
  }
}
