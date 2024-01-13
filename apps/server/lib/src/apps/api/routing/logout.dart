import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/other/extensions.dart';

/// Route API REST for [Routes.logout]
class LogoutRoute implements Route {
  @override
  String path = Routes.logout.path;

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      Method(
        method: Methods.delete,
        path: path,
        func: (request) async {
          // clear session
          request.removeSessionCookie();
          // write data
          request.writeJson(SuccessResponse('Logout successfully'));
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
