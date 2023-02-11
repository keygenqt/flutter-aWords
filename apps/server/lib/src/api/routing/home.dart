import 'dart:io';

import 'package:server_awords/src/api/base/export.dart';
import 'package:server_awords/src/utils/extension/export.dart';

class HomeRoute implements Route {
  @override
  String path = '/';

  @override
  Future<void> run(HttpRequest request) async {
    if (request.uri.path.contains('.')) {
      final data = File('web${request.uri.path}');
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
          ..write(File('web/index.html').readAsStringSync());
      } else {
        request.response
          ..headers.contentType = ContentType.html
          ..write(File('web/error.html').readAsStringSync());
      }
      await request.response.close();
    }
  }
}
