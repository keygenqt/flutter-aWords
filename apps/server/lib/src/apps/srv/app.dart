import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Main class application server
class WebServer {
  WebServer(this.path);

  final String path;

  Logger get _logger => getIt<Logger>();

  Future<void> run() async {
    _logger.info('Start server...');

    const port = 3011;
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

    _logger.info('Server started: http://localhost:$port');

    await server.forEach((HttpRequest request) {
      _logger.detail(request.uri.path);
      if (request.uri.path == '/') {
        request.response
          ..headers.contentType = ContentType.html
          ..write(File('$path/index.html').readAsStringSync());
        request.response.close();
      } else if (request.uri.path.contains('.')) {
        final image = File('$path${request.uri.path}');
        if (image.existsSync()) {
          image.readAsBytes().then((raw) {
            request.response.headers
                .set('Content-Type', request.uri.path.getContentType());
            request.response.headers.set('Content-Length', raw.length);
            request.response.add(raw);
            request.response.close();
          });
        }
      }
    });
  }
}
