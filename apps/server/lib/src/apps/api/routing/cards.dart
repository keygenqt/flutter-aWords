import 'dart:io';

import 'package:server_awords/exports/apps/api/app.dart';
import 'package:server_awords/exports/db/models.dart';
import 'package:server_awords/exports/db/services.dart';
import 'package:server_awords/exports/other/extensions.dart';
import 'package:server_awords/src/base/app_di.dart';

/// Route API REST for [Routes.cards]
class CardsRoute implements Route {
  @override
  String path = Routes.cards.path;

  CardsService get _service => getIt<CardsService>();

  @override
  Future<void> run(HttpRequest request) async {
    for (final method in [
      // get all items
      Method(
        role: [UserRole.user, UserRole.admin],
        path: path,
        func: (request) async {
          request.writeJson(await _service.getAll());
        },
      ),
    ]) {
      if (await request.route(method)) {
        return;
      }
    }
  }
}
