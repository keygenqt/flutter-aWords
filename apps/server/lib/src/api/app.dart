import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/di.dart';

class AppServer {
  Logger get _logger => getIt<Logger>();

  Future<void> run() async {
    _logger.info('Start server...');

    const port = 3010;
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

    _logger.info('Server started: http://localhost:$port');

    await server.forEach((HttpRequest request) {
      _logger.detail('Request path: ${request.uri.path}');
      if (request.uri.path.startsWith('/student')) {
        request.response.write('Welcome student!');
      } else {
        request.response.write('Hello, world!');
      }
      request.response.close();
    });
  }
}
