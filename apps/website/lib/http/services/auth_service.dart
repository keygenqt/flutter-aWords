import 'package:dio/dio.dart';
import 'package:website/http/request/auth_request.dart';
import 'package:website/http/response/auth_response.dart';

/// Http service API
/// - '/api/login'
/// - '/api/registration'
/// - '/api/logout'
class AuthService {
  AuthService(this.dio);

  final Dio dio;

  /// Get users
  Future<AuthResponse> login(AuthRequest request) async {
    // query
    final response = await dio.post('/api/login', data: request.toJson());
    // mapper
    return AuthResponse.fromJson(response.data);
  }
}
