import 'dart:io';

import 'package:server_awords/exports/apps/api.dart';
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
        path: path,
        func: (request) async {
          request.writeJson(await _service.getAll());
        },
      ),
      // get one item
      Method(
        path: '$path/{id}',
        func: (request) async {
          // find model
          final model = await _service.findById(request.getID());
          // exception if user not found
          if (model == null) throw AppException.notFound();
          // write data
          request.writeJson(model);
        },
      ),
      // create item
      Method(
        method: Methods.post,
        path: path,
        func: (request) async {
          // create model
          final model = UserModel.fromJson(await request.getBody());
          // write data
          request.writeJson((await _service.insert([model])).first);
        },
      ),
      // update item
      Method(
        method: Methods.put,
        path: '$path/{id}',
        func: (request) async {
          // find model
          final model = await _service.findById(request.getID());
          // exception if user not found
          if (model == null) throw AppException.notFound();
          // clone model with update params
          final update = model.clone(await request.getBody());
          // write data
          request.writeJson((await _service.update([update])).first);
        },
      ),
      // update item
      Method(
        method: Methods.delete,
        path: '$path/{id}',
        func: (request) async {
          // invoke delete
          await _service.deleteItem(request.getID());
          // write data
          request.writeJson(SuccessResponse('User deleted successfully'));
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
