import 'package:dio/dio.dart';
import 'package:website/models/user.dart';

/// Http service API '/api/users'
class UsersService {
  UsersService(this.dio);

  final Dio dio;

  /// Get users
  Future<List<UserModel>> getList() async {
    // query
    final response = await dio.request('/api/users');
    // mapper
    return List<UserModel>.from(response.data.map((x) => UserModel.fromJson(x)));
  }
}
