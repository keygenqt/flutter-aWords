import 'dart:io';

import 'package:server_awords/src/api/base/exceptions.dart';
import 'package:server_awords/src/api/routing/export.dart';
import 'package:server_awords/src/utils/extension/export.dart';

mixin Route {
  late String path;

  Future<void> run(HttpRequest request);
}

class Routes {
  Routes(this.path);

  final _routes = <Route>[
    LoginRoute(),
    UsersRoute(),
  ];

  final String path;

  Future<void> request(HttpRequest request) async {
    try {
      if (request.uri.path.startsWith('/api')) {
        await _routes
            .where((element) => element.path == request.uri.path)
            .first
            .run(request);
      } else {
        await HomeRoute(path).run(request);
      }
    } catch (e) {
      if (e is AppException) {
        request.writeJsonWithCode(e.code, {
          'code': e.code,
          'message': e.message,
        });
      } else {
        request.writeJsonWithCode(HttpStatus.internalServerError, {
          'code': HttpStatus.internalServerError,
          'message': e.toString(),
        });
      }
      await request.response.close();
    }
  }
}
