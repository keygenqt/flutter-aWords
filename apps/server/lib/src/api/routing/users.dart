import 'dart:convert';
import 'dart:io';

import 'package:server_awords/di.dart';
import 'package:server_awords/src/api/base/export.dart';
import 'package:server_awords/src/utils/db/services/export.dart';
import 'package:server_awords/src/utils/helper.dart';

class UsersRoute implements Route {
  @override
  String path = '/api/users';

  UsersService get _service => getIt<UsersService>();

  @override
  Future<void> run(HttpRequest request) async {
    // read data
    final list = await _service.getAll();
    final json = jsonPrettyEncode(list);

    // set data
    request.response
      ..headers.contentType = ContentType.json
      ..contentLength = utf8.encode(json).length
      ..write(json);

    // close
    await request.response.close();
  }
}
