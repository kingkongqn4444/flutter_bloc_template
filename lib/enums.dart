import 'constants.dart';

enum AppTheme { light, dark, system }

enum ImageSourceType { network, asset, local }

enum Environment { dev, testing, staging, prod, beta }

enum Language { vi, en }

extension EnvironmentExt on Environment {
  String get value => ['dev', 'test', 'stage', 'prod', 'beta'][index];

  String get str => [
        EnvironmentConstant.dev,
        EnvironmentConstant.test,
        EnvironmentConstant.staging,
        EnvironmentConstant.prod,
        EnvironmentConstant.beta,
      ][index];
}

extension AppThemeExt on AppTheme {
  String get value => ['light', 'dark', 'system'][index];
}

extension ImageSourceTypeExt on ImageSourceType {
  String get value => ['network', 'asset', 'local'][index];
}

extension LanguageExt on Language {
  String get value => ['vi', 'en'][index];
}
