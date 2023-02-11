import 'dart:io';

import 'package:server_awords/exports/apps/api.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for '/api/users'
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
