import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/clickhouse/services/hello_service.dart';

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
