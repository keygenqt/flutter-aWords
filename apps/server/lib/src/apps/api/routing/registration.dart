import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/apps/api/validates.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for [Routes.registration]
class RegistrationRoute implements Route {
  @override
  String path = Routes.registration.path;

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
          validateRegistration(body);
          // find user
          final user = await _serviceUsers.findByEmail(
            email: body['email'].toString(),
          );
          // exception if user found
          if (user != null) {
            throw AppException.unprocessableEntity([
              Validate(
                field: 'email',
                message: 'User with email "${body['email']}" exists',
              )
            ]);
          }
          // create model
          final model = (await _serviceUsers.insert([UserModel.fromJson(body)])).first;
          // set auth cookie
          request.setSessionCookie(model);
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
