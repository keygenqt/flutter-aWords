import 'dart:io';

import 'package:server_awords/di.dart';
import 'package:server_awords/src/api/base/export.dart';
import 'package:server_awords/src/utils/db/services/export.dart';
import 'package:server_awords/src/utils/extension/export.dart';

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
