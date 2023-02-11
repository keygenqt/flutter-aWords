import 'dart:io';

import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for '/api/login'
class LoginRoute implements Route {
  @override
  String path = '/api/login';

  UsersService get _service => getIt<UsersService>();

  @override
  Future<void> run(HttpRequest request) async {
    switch (request.method) {
      case 'POST':
        {
          // load body
          final content = await request.getBody();
          // write data
          request.writeJson(content);
        }
        break;
      default:
        throw AppException.badRequest();
    }
    // close
    await request.response.close();
  }
}
