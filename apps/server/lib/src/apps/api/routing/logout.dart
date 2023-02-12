import 'dart:io';

import 'package:server_awords/exports/apps/api.dart';

/// Route API REST for [Routes.logout]
class LogoutRoute implements Route {
  @override
  String path = Routes.logout.path;

  @override
  Future<void> run(HttpRequest request) async {}
}
