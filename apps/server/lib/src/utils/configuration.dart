import 'package:settings_yaml/settings_yaml.dart';

class Configuration {
  Configuration()
      : data =
            SettingsYaml.load(pathToSettings: './configuration.yaml').valueMap;

  final Map<String, dynamic> data;
}
