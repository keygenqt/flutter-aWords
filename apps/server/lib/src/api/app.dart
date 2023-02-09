import 'dart:io';

import 'package:mason_logger/mason_logger.dart';

class AppServer {
  AppServer({
    required Logger logger,
    required bool debug,
  }) : _logger = logger {
    logger.level = debug ? Level.debug : Level.info;
  }

  final Logger _logger;

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
