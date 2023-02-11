import 'dart:io';

import 'package:server_awords/di.dart';
import 'package:server_awords/src/api/base/export.dart';
import 'package:server_awords/src/utils/db/services/export.dart';
import 'package:server_awords/src/utils/extension/export.dart';

class UsersRoute implements Route {
  @override
  String path = '/api/users';

  UsersService get _service => getIt<UsersService>();

  @override
  Future<void> run(HttpRequest request) async {
    // read data
    final list = await _service.getAll();
    // write data
    request.writeJson(list);
    // close
    await request.response.close();
  }
}
