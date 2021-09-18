import 'package:global_configuration/global_configuration.dart';

import '../enums.dart';

class AppConfig {
  GlobalConfiguration get globalConfiguration => GlobalConfiguration();

  static AppConfig _singleton = AppConfig._internal();

  static AppConfig get instance => _singleton;

  AppConfig._internal();

  Future loadConfig({Environment env = Environment.dev}) async {
    var appEnv = env.value;
    await GlobalConfiguration().loadFromAsset('app_config_$appEnv');
  }

  String get apiEndpoint => globalConfiguration.get('apiEndpoint');

  String get apiEndpointAuth => globalConfiguration.get('apiEndpointAuth');

  String get userApiEndpoint => globalConfiguration.get('userApiEndpoint');

  String get customerApiEndpoint => globalConfiguration.get('customerApiEndpoint');

  String get notificationApiEndpoint => globalConfiguration.get('notificationApiEndpoint');

  String get clientId => globalConfiguration.get('clientId');

  String get grantType => globalConfiguration.get('grantType');

  String get scope => globalConfiguration.get('scope');

  int get connectTimeout => globalConfiguration.getValue<int>('connectTimeout');

  int get receiveTimeout => globalConfiguration.getValue<int>('receiveTimeout');

  String get authContentType => globalConfiguration.get('authContentType');

  String fcmToken = '';
}
