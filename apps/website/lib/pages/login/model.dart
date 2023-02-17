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

  /// Error response
  String? _error;

  String? get error => _error;

  /// Users response
  AuthResponse? _auth;

  AuthResponse? get auth => _auth;

  /// Get users
  Future<void> login({
    required String email,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();
    try {
      // for animation
      await Future.delayed(const Duration(seconds: 5));
      // execute request
      _auth = await service.login(AuthRequest(
        email: email,
        password: password,
        uniqueKey: 'uniqueKey',
      ));
      print(_auth);
    } catch (e) {
      _error = e.getMessage();
      print(_error);
    }
    _loading = false;
    notifyListeners();
  }
}
