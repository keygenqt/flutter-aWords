import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/clickhouse/services/hello_service.dart';
import 'package:server_awords/src/db/models/hello.dart';

/// Route API REST for [Routes.hello]
class HelloRoute implements Route {
  @override
  String path = Routes.hello.path;

  HelloService get _service => getIt<HelloService>();

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      // get all items
      Method(
        path: path,
        func: (request) async {

          _service.clear();

          _service.insert([
            HelloModel(
              userId: 100,
              message: 'Save model1',
              timestamp: '2023-03-10 00:00:00',
              metric: -1.0,
            ),
            HelloModel(
              userId: 102,
              message: 'Save model2',
              timestamp: '2023-03-10 00:00:00',
              metric: -1.0,
            ),
          ]);

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
