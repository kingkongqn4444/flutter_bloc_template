import 'package:flutter/material.dart';
import 'package:sdk/flutter_sdk.dart';

import '../router/router.dart';
import '../pages/pages.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<Widget>(() => HomePage(),
        instanceName: Routes.homePage);
    // ignore: cascade_invocations
    injector.registerFactory<Widget>(() => const SplashPage(),
        instanceName: Routes.splashPage);
    injector.registerFactory<Widget>(() => OnBroadPage(),
        instanceName: Routes.onBroadPage);
    injector.registerFactory<Widget>(() => InfoProjectPage(),
        instanceName: Routes.infoProjectPage);
    injector.registerFactory<Widget>(() => NeedToPage(),
        instanceName: Routes.needToPage);
    injector.registerFactory<Widget>(() => NeedToBuyPage(),
        instanceName: Routes.needToBuyPage);
  }
}
