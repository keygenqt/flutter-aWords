import 'package:website/base/app_di.dart';
import 'package:website/build/build.config.dart';

final BuildConfig config = getIt<BuildConfig>();

/// Extensions for [String]
extension ExtString on String {
  String getFileUrl() {
    return this;
  }

  String pushArguments(Map<String, dynamic> arguments) {
    final List<String> route = [];
    split('/').forEach((element) {
      if (element.isEmpty || !element.contains('{')) {
        route.add(element);
      } else {
        final key = element.replaceAll(RegExp(r'[{}]+'), "");
        if (arguments.containsKey(key)) {
          route.add(arguments[key].toString());
        }
      }
    });
    return route.join('/');
  }

  bool equalsRoute(String route) {
    // get mod path request
    final uriPath = split('/')
        .map(
          (e) => e.replaceFirst(
            // 2b03f6be-c963-4493-8203-7928e195cc12 || 12
            RegExp(r'([a-z\d]+\-[a-z\d]+\-[a-z\d]+\-[a-z\d]+\-[a-z\d]+)|(\d+)'),
            '___',
          ),
        )
        .join('/');

    // path route
    final routePath = route
        .split('/')
        .map(
          (e) => e.replaceFirst(RegExp(r'\{[a-z]+\}'), '___'),
        )
        .join('/');

    return uriPath == routePath;
  }

  Map<String, dynamic> parametersRoute(String route) {
    final Map<String, dynamic> parameters = {};
    final path = split('/');
    route.split('/').asMap().forEach((index, element) {
      if (element.isNotEmpty && element.contains('{')) {
        final key = element.replaceAll(RegExp(r'[{}]+'), "");
        parameters[key] = path[index];
      }
    });
    return parameters;
  }
}
