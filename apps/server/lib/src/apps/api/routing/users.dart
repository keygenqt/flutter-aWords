import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/apps/api/validates.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for [Routes.users]
class UsersRoute implements Route {
  @override
  String path = Routes.users.path;

  UsersService get _service => getIt<UsersService>();

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      // get all items
      Method(
        role: [UserRole.user, UserRole.admin],
        path: path,
        func: (request) async {
          request.writeJson(await _service.getAll());
        },
      ),
      // get one item
      Method(
        role: [UserRole.admin],
        path: '$path/{id}',
        func: (request) async {
          // find model
          final model = await _service.findById(
            id: request.getInt(),
          );
          // exception if user not found
          if (model == null) throw AppException.notFound();
          // write data
          request.writeJson(model);
        },
      ),
      // create item
      Method(
        role: [UserRole.admin],
        method: Methods.post,
        path: path,
        func: (request) async {
          // get body
          final body = await request.getBody();
          // validate
          validateUser(body);
          // create model
          final model = UserModel.fromJson(body);
          // write data
          request.writeJson((await _service.insert([model])).first);
        },
      ),
      // update item
      Method(
        role: [UserRole.admin],
        method: Methods.put,
        path: '$path/{id}',
        func: (request) async {
          // get body
          final body = await request.getBody();
          // validate
          validateUser(body);
          // find model
          final model = await _service.findById(
            id: request.getInt(),
          );
          // exception if user not found
          if (model == null) throw AppException.notFound();
          // clone model with update params
          final update = model.copy(await body);
          // write data
          request.writeJson((await _service.update([update])).first);
        },
      ),
      // update item
      Method(
        role: [UserRole.admin],
        method: Methods.delete,
        path: '$path/{id}',
        func: (request) async {
          // invoke delete
          final count = await _service.deleteItem(
            id: request.getInt(),
          );
          // write data
          if (count == 0) {
            throw AppException.notFound();
          } else {
            request.writeJson(SuccessResponse('User deleted successfully'));
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
