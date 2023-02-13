import 'package:settings_yaml/settings_yaml.dart';

/// Read file yaml with configuration app
class Configuration {
  Configuration()
      : data =
            SettingsYaml.load(pathToSettings: './configuration.yaml').valueMap;

  final Map<String, dynamic> data;
}
