import 'package:dio/dio.dart';
import 'package:website/entities/user.dart';

/// Http service API '/api/users'
class UsersService {
  UsersService(this.dio);

  final Dio dio;

  /// Get users
  Future<List<UserEntity>> getList() async {
    // query
    final response = await dio.request('/api/users');
    // mapper
    return List<UserEntity>.from(response.data.map((x) => UserEntity.fromJson(x)));
  }
}
