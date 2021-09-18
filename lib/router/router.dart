import 'package:flutter/material.dart';
import 'package:sdk/flutter_sdk.dart';

class Routes {
  static String get homePage => '/homePage';
  static String get splashPage => '/splashPage';
  static String get onBroadPage => '/onBroadPage';
  static String get infoProjectPage => '/infoProjectPage';
  static String get needToPage => '/needToPage';
  static String get needToBuyPage => '/needToBuyPage';

  static getRoute(RouteSettings settings) {
    Widget widget;
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Page not found')),
      );
    }
    return NoAnimationMaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(builder: builder, maintainState: maintainState, settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
