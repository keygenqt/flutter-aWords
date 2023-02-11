import 'dart:io';

/// Handling application errors
class AppException implements Exception {
  AppException(this.code, this.message);

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

  String message;
  int code;
}
