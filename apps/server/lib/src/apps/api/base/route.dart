import 'dart:io';

import 'package:server_awords/src/exports/other/constants.dart';

/// Interface Route classes
mixin Route {
  late String path;

  Future<void> run(HttpRequest request);
}

/// Enum links api path's
enum Routes {
  login('$apiPath/login'),
  logout('$apiPath/logout'),
  registration('$apiPath/registration'),
  cards('$apiPath/cards'),
  users('$apiPath/users');

  const Routes(this.path);

  final String path;
}

/// Enum methods
enum Methods {
  get,
  post,
  put,
  delete;
}

/// API method
class Method {
  Method({
    required this.path,
    required this.func,
    this.method = Methods.get,
  });

  final String path;
  final Methods method;
  final Future<void> Function(HttpRequest request) func;
}
