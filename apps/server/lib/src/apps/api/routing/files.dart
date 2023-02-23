import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for Files
class FilesRoute implements Route {
  @override
  String path = Routes.images.path;

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      // get all items
      Method(
        role: [UserRole.user, UserRole.admin],
        path: path,
        func: (request) async {
          final fileName = request.getString();
          if (fileName.contains('.')) {
            final mime = fileName.getContentType();
            final path = mime.value.isImage() ? 'images' : 'files';
            final data = File('data/$path/$fileName');
            if (data.existsSync()) {
              final bites = await data.readAsBytes();
              request.response
                ..statusCode = HttpStatus.ok
                ..headers.contentType = mime
                ..contentLength = bites.lengthInBytes
                ..add(bites);
            }
          }
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
