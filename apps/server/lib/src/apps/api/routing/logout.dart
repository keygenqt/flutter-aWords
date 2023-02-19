import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for [Routes.logout]
class LogoutRoute implements Route {
  @override
  String path = Routes.logout.path;

  TokensService get _serviceTokens => getIt<TokensService>();

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      Method(
        role: [UserRole.user, UserRole.admin],
        method: Methods.delete,
        path: path,
        func: (request) async {
          // clear session
          final basic = request.removeSessionCookie() ?? request.headers.value('authorization').toString();
          // get hash
          final hash = basic.substring(6, basic.length);
          // invoke delete
          final count = await _serviceTokens.deleteByToken(
            token: hash,
          );
          // write data
          if (count == 0) {
            throw AppException.notFound();
          } else {
            // response success
            request.writeJson(SuccessResponse('Token deleted successfully'));
          }
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
