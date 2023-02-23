import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/apps/api/routing.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';
import 'package:server_awords/src/exports/other/constants.dart';

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
    CardsRoute(),
    LoginRoute(),
    LogoutRoute(),
    RegistrationRoute(),
    UsersRoute(),
    FilesRoute(),
  ];

  Future<void> run() async {
    _logger.info('Start server...');

    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

    _logger.info('Server started: http://localhost:$port');

    await server.forEach((HttpRequest request) async {
      _logger.detail('Request path: ${request.uri.path}');
      try {
        if (request.uri.path.startsWith(apiPath)) {
          // set default status code
          request.response.statusCode = HttpStatus.badRequest;
          // run routes method
          await _routes
              .where((element) => request.uri.path.startsWith(
                  element.path.contains('{') ? element.path.substring(0, element.path.indexOf('{')) : element.path))
              .first
              .run(request);
          // check if method not found
          if (request.response.statusCode == HttpStatus.badRequest) {
            throw AppException.badRequest();
          }
          // close
          await request.response.close();
        } else {
          await HomeRoute(path).run(request);
        }
      } catch (e) {
        if (e is AppException) {
          if (e.validates == null) {
            request.writeJsonWithCode(e.code, {
              'code': e.code,
              'message': e.message,
            });
          } else {
            request.writeJsonWithCode(e.code, {
              'code': e.code,
              'message': e.message,
              'validates': e.validates,
            });
          }
        } else {
          request.writeJsonWithCode(HttpStatus.internalServerError, {
            'code': HttpStatus.internalServerError,
            'message': e.toString(),
          });
        }
        await request.response.close();
      }
    });
  }
}
