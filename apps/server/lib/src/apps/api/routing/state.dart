import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/clickhouse/services/state_service.dart';
import 'package:server_awords/src/clickhouse/models/state.dart';

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
        path: path,
        func: (request) async {
          // clear table
          _service.clear();
          // insert data
          _service.insert([
            StateModel(
              word: 'cat',
              state: true,
              userId: 100,
              timestamp: DateTime.now().microsecondsSinceEpoch,
            ),
            StateModel(
              word: 'dog',
              state: false,
              userId: 100,
              timestamp: DateTime.now().microsecondsSinceEpoch,
            ),
          ]);
          // get data
          request.writeJson(await _service.getAll());
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
