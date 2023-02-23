import 'package:website/base/app_di.dart';
import 'package:website/build/build.config.dart';

final BuildConfig config = getIt<BuildConfig>();

/// Extensions for [String]
extension ExtString on String {
  String getFileUrl() {
    if (config.isDebug) {
      return config.baseUrl.substring(0, config.baseUrl.length - 1) + this;
    } else {
      return this;
    }
  }
}
