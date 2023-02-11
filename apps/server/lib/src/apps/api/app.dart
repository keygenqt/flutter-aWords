import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/src/base/app_di.dart';

class AppServer {
  AppServer({
    required this.path,
    required this.port,
  });

  final String path;
  final int port;

  Logger get _logger => getIt<Logger>();

  Future<void> run() async {
    _logger.info('Start server...');

    final route = Routes(path);
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

    _logger.info('Server started: http://localhost:$port');

    await server.forEach((HttpRequest request) {
      _logger.detail('Request path: ${request.uri.path}');
      route.request(request);
    });
  }
}
