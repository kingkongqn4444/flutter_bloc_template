import 'package:flutter/material.dart';
import 'package:sdk/flutter_sdk.dart';

import '../pages/pages.dart';
import '../router/router.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<Widget>(() => HomePage(),
        instanceName: Routes.homePage);
    injector.registerFactory<Widget>(() => const SplashPage(),
        instanceName: Routes.splashPage);
    injector.registerFactory<Widget>(() => const OnBroadPage(),
        instanceName: Routes.onBroadPage);
    injector.registerFactory<Widget>(() => const InfoProjectPage(),
        instanceName: Routes.infoProjectPage);
    injector.registerFactory<Widget>(() => const NeedToPage(),
        instanceName: Routes.needToPage);
    injector.registerFactory<Widget>(() => const NeedToBuyPage(),
        instanceName: Routes.needToBuyPage);
  }
}
