import 'build.config.dart';

/// Disable CORS
/// Android Studio add arguments run web (Additional run args)
/// --web-browser-flag "--disable-web-security" --web-port=3001
class BuildDebugConfig implements BuildConfig {
  @override
  bool get isDebug => true;

  @override
  String get baseUrl => 'http://localhost:3000/';
}
