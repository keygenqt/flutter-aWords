import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/apps/api/validates.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for [Routes.login]
class LoginRoute implements Route {
  @override
  String path = Routes.login.path;

  UsersService get _serviceUsers => getIt<UsersService>();

  TokensService get _serviceTokens => getIt<TokensService>();

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
          // clear token by uniqueKey
          await _serviceTokens.deleteByKey(
            key: body['uniqueKey'].toString(),
          );
          // create new token
          final auth = await _serviceTokens.insert([
            TokenModel.create(
              userId: user.id!,
              token: user.generateToken(),
              uniqueKey: body['uniqueKey'].toString(),
              createAt: DateTime.now(),
            ),
          ]);

          // test cookies
          request.cookies.add(Cookie('session1', auth.first.token));
          request.response.cookies.add(Cookie('session2', auth.first.token));

          // write data
          request.writeJson(auth.first);
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
