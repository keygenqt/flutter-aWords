import 'package:dio/dio.dart';

/// Get [Dio]
Dio configureDio() => Dio(BaseOptions(
      baseUrl: 'https://awords-api.keygenqt.com/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));
