import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';

/// Handling application errors
class AppException implements Exception {
  AppException(this.code, this.message);

  AppException.unprocessableEntity(
    this.validates, [
    this.message = 'Unprocessable Entity',
  ]) : code = HttpStatus.unprocessableEntity;

  AppException.badRequest([this.message = 'Bad Request'])
      : code = HttpStatus.badRequest;

  AppException.notFound([this.message = 'Not Found'])
      : code = HttpStatus.notFound;

  AppException.forbidden([this.message = 'Forbidden'])
      : code = HttpStatus.forbidden;

  AppException.unauthorized([this.message = 'Unauthorized'])
      : code = HttpStatus.unauthorized;

  AppException.methodNotAllowed([this.message = 'Method Not Allowed'])
      : code = HttpStatus.methodNotAllowed;

  List<Validate>? validates;
  String message;
  int code;
}
