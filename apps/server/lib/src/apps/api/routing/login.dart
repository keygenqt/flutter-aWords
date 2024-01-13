import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/apps/api/validates.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for [Routes.login]
class LoginRoute implements Route {
  @override
  String path = Routes.login.path;

  UsersService get _serviceUsers => getIt<UsersService>();

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      Method(
        method: Methods.post,
        path: path,
        func: (request) async {
          // get body
          final body = await request.getBody();
          // validate
          validateLogin(body);
          // find user
          final user = await _serviceUsers.findByEmailAndPass(
            email: body['email'].toString(),
            password: body['password'].toString(),
          );
          // exception if user not found
          if (user == null) {
            throw AppException.unprocessableEntity([
              Validate(
                field: 'form',
                message: 'Wrong login or password',
              )
            ]);
          }
          // clear session
          request.removeSessionCookie();
          // set auth cookie
          request.setSessionCookie(user);
          // write data
          request.writeJson(SuccessResponse('Auth successfully'));
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
