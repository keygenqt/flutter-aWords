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
