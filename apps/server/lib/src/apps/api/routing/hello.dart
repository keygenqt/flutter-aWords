import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/clickhouse/services/hello_service.dart';
import 'package:server_awords/src/clickhouse/models/hello.dart';

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
          // clear table
          _service.clear();
          // insert data
          _service.insert([
            HelloModel(
              userId: 101,
              message: 'Hello, ClickHouse!',
              timestamp: '2023-03-10 00:00:00',
              metric: -1.0,
            ),
            HelloModel(
              userId: 102,
              message: 'Insert a lot of rows per batch',
              timestamp: '2023-03-10 00:00:00',
              metric: 1.41421,
            ),
            HelloModel(
              userId: 102,
              message: 'Sort your data based on your commonly-used queries',
              timestamp: '2023-03-10 00:00:00',
              metric: 2.718,
            ),
            HelloModel(
              userId: 101,
              message: 'Granules are the smallest chunks of data read',
              timestamp: '2023-03-10 00:00:00',
              metric: 3.14159,
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
