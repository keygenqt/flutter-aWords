import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Main class app API for run [HttpServer]
class AppServer {
  AppServer({
    required this.path,
    required this.port,
  });

  final String path;
  final int port;

  Logger get _logger => getIt<Logger>();

  final _routes = <Route>[
    LoginRoute(),
    UsersRoute(),
  ];

  Future<void> run() async {
    _logger.info('Start server...');

    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

    _logger.info('Server started: http://localhost:$port');

    await server.forEach((HttpRequest request) {
      _logger.detail('Request path: ${request.uri.path}');
      try {
        if (request.uri.path.startsWith('/api')) {
          _routes
              .where((element) => element.path == request.uri.path)
              .first
              .run(request);
        } else {
          HomeRoute(path).run(request);
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
        request.response.close();
      }
    });
  }
}
