import 'dart:io';

import 'package:server_awords/exports/other/extensions.dart';

/// Route API home html page
class RouteHome {
  RouteHome(this.path);

  final String path;

  Future<void> run(HttpRequest request) async {
    if (request.uri.path.contains('.')) {
      final data = File('$path${request.uri.path}');
      if (data.existsSync()) {
        final bites = await data.readAsBytes();
        request.response
          ..headers.contentType = request.uri.path.getContentType()
          ..contentLength = bites.lengthInBytes
          ..add(bites);
        await request.response.close();
      }
    } else {
      if (request.uri.path == '/') {
        request.response
          ..headers.contentType = ContentType.html
          ..write(File('$path/index.html').readAsStringSync());
      } else {
        request.response
          ..headers.contentType = ContentType.html
          ..write(File('$path/error.html').readAsStringSync());
      }
      await request.response.close();
    }
  }
}
