import 'dart:io';

import 'package:server_awords/exports/apps/api.dart';

/// Route API REST for [Routes.cards]
class CardsRoute implements Route {
  @override
  String path = Routes.cards.path;

  @override
  Future<void> run(HttpRequest request) async {}
}
