import 'dart:io';

import 'package:mason_logger/mason_logger.dart';
import 'package:server_awords/di.dart';

class WebServer {
  WebServer(this.path);

  final String path;

  Logger get _logger => getIt<Logger>();

  String getContentType(String path) {
    if (path.contains('.html')) {
      return 'text/html';
    }
    if (path.contains('.js')) {
      return 'text/javascript';
    }
    if (path.contains('.json')) {
      return 'application/json';
    }
    if (path.contains('.png')) {
      return 'image/png';
    }
    if (path.contains('.ico')) {
      return 'image/vnd.microsoft.icon';
    }
    if (path.contains('.otf')) {
      return 'font/otf';
    }
    if (path.contains('.ttf')) {
      return 'font/ttf';
    }
    _logger.err('Mime not found: $path');
    return 'application/unknown';
  }

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
                .set('Content-Type', getContentType(request.uri.path));
            request.response.headers.set('Content-Length', raw.length);
            request.response.add(raw);
            request.response.close();
          });
        }
      }
    });
  }
}
