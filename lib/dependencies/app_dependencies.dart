import 'package:sdk/flutter_sdk.dart';

import '../app.dart';
import '../utils/utils.dart';
import 'dependencies.dart';

class AppDependencies {
  static GetIt get injector => GetIt.I;

  static Future<void> init() async {
//    Log.init();
//    injector.registerLazySingleton<SharedPreferences>(() => SharedPreferences());
//
//    final prefs = injector.get<SharedPreferences>();
//    final firstRun = await prefs.firstRun;
//    if (firstRun) {
//      await prefs.cleanUp();
//      await prefs.setFirstRun(false);
//    } else {
//      final env = await prefs.env;
//      if (env.isNotNullOrEmpty) {
//        environment = EnvironmentHelper.getCode(env);
//        await prefs.setEnv(env);
//      }
//    }
//
    await setup();
  }

  static Future<void> setup() async {
    await AppConfig.instance.loadConfig(env: environment);
    Log.d('Env: $environment - BaseUrl: ${AppConfig.instance.apiEndpoint}');
    await BusinessDependencies.setup(injector);
    await BlocDependencies.setup(injector);
    await PageDependencies.setup(injector);
  }

  static Future<void> reset() async {
//    await injector.reset();
//    injector.registerLazySingleton<SharedPreferences>(() => SharedPreferences());
//    await setup();
  }
}
