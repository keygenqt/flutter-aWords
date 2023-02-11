import 'dart:io';

/// Interface Route classes
mixin Route {
  late String path;

  Future<void> run(HttpRequest request);
}
