import 'dart:convert';
import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/apps/api/validates/state.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/clickhouse/services/state_service.dart';

/// Route API REST for [Routes.state]
class StateRoute implements Route {
  @override
  String path = Routes.state.path;

  StateService get _service => getIt<StateService>();

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      // get all items
      Method(
        role: [UserRole.admin],
        path: path,
        func: (request) async {
          request.writeJson(await _service.getAll());
        },
      ),
      // create item
      Method(
        role: [UserRole.user, UserRole.admin],
        method: Methods.post,
        path: path,
        func: (request) async {
          // get body
          final body = await request.getBody();
          // add params
          final finalBody = {
            ...body,
            ...{
              'state': body['state'] == 'true',
              'userId': (await request.findToken())!.userId,
              'timestamp': DateTime.now().microsecondsSinceEpoch,
            }
          };
          // validate
          validateState(finalBody);
          // create model
          final model = StateModel.fromJson(finalBody);
          // write data
          _service.insert([model]);
          // send data
          request.writeJson(model);
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
