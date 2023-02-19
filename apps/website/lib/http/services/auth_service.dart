import 'package:dio/dio.dart';
import 'package:website/http/request/sign_in_request.dart';
import 'package:website/http/request/sign_up_request.dart';

/// Http service API
/// - '/api/login'
/// - '/api/registration'
/// - '/api/logout'
class AuthService {
  AuthService(this.dio);

  final Dio dio;

  /// Login user
  Future<void> login(SignInRequest request) async {
    await dio.post('/api/login', data: request.toJson());
  }

  /// Registration user
  Future<void> registration(SignUpRequest request) async {
    await dio.post('/api/registration', data: request.toJson());
  }

  /// Logout user
  Future<void> logout() async {
    await dio.delete('/api/logout');
  }
}
