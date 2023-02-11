import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/di.dart';
import 'package:server_awords/src/api/base/export.dart';

class AppServer {
  Logger get _logger => getIt<Logger>();

  Future<void> run() async {
    _logger.info('Start server...');

    final route = Routes();
    const port = 3010;
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

    _logger.info('Server started: http://localhost:$port');

    await server.forEach((HttpRequest request) {
      _logger.detail('Request path: ${request.uri.path}');
      route.request(request);
    });
  }
}
