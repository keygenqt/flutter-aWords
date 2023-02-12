import 'dart:io';

import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:uuid/uuid.dart';

/// Route API REST for [Routes.registration]
class RegistrationRoute implements Route {
  @override
  String path = Routes.registration.path;

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
          final model =
              (await _serviceUsers.insert([UserModel.fromJson(body)])).first;
          // clear token by uniqueKey
          await _serviceTokens.deleteByKey(
            key: body['uniqueKey'].toString(),
          );
          // create new token
          final auth = await _serviceTokens.insert([
            TokenModel.create(
              userId: model.id!,
              token: const Uuid().v4(),
              uniqueKey: body['uniqueKey'].toString(),
              createAt: DateTime.now(),
            ),
          ]);
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
