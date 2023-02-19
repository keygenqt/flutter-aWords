import 'package:dio/dio.dart';
import 'package:website/http/request/sign_in_request.dart';
import 'package:website/http/request/sign_up_request.dart';
import 'package:website/http/response/auth_response.dart';

/// Http service API
/// - '/api/login'
/// - '/api/registration'
/// - '/api/logout'
class AuthService {
  AuthService(this.dio);

  final Dio dio;

  /// Login user
  Future<AuthResponse> login(SignInRequest request) async {
    // query
    final response = await dio.post('/api/login', data: request.toJson());
    // mapper
    return AuthResponse.fromJson(response.data);
  }

  /// Registration user
  Future<AuthResponse> registration(SignUpRequest request) async {
    // query
    final response = await dio.post('/api/registration', data: request.toJson());
    // mapper
    return AuthResponse.fromJson(response.data);
  }

  /// Logout user
  Future<void> logout() async {
    await dio.delete('/api/logout');
  }
}
