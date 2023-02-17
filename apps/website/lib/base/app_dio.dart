import 'package:dio/dio.dart';

/// Get [Dio]
Dio configureDio({
  required String url,
}) =>
    Dio(BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));
