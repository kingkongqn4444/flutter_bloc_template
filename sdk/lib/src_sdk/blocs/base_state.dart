import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_localizations/app_localizations.dart';
import '../utility/log.dart';
import 'base_bloc.dart';
import 'loading_dialog.dart';
import 'loading_widget.dart';

abstract class BaseState<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> with WidgetsBindingObserver {
  final spinKitSize = 20.0;

  B get bloc;

  AppLocalizations localizations;

  ThemeData themeData;

  bool get isContentLayout => false;

  bool isFirstInit = true;

  bool _isDispose = false;

  void onNavigateAsync(Object payload) {}

  void loadData() {}

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    bloc?.waitingStream?.listen((loading) {
      if (loading) {
        LoadingDialog.show(context);
      } else {
        LoadingDialog.close(context);
      }
    });

    bloc?.listenerStream?.listen((state) => blocListener(state));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizations ??= AppLocalizations.of(context);
    themeData ??= Theme.of(context);
    if (isFirstInit) {
      if (mounted) {
        final args = ModalRoute.of(context)?.settings?.arguments;
        onNavigateAsync(args);
      }

      loadData();
      isFirstInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _body;
    _body = (bloc != null)
        ? StreamBuilder<bool>(
            stream: bloc.loadingStream,
            builder: (context, snapShot) {
              if (snapShot?.data == true) {
                return buildLoading(context);
              }
              return buildContent(context);
            },
          )
        : buildContent(context);

    return isContentLayout == false
        ? GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              body: _body,
            ),
          )
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
              appBar: buildAppBar(context),
              body: SafeArea(
                child: _body,
              ),
              drawer: buildDrawer(context),
              floatingActionButton: buildFloatButton(context),
            ),
          );
  }

  Widget buildContent(BuildContext context) => Container();

  Widget buildAppBar(BuildContext context) => null;

  Widget buildLoading(BuildContext context) => LoadingWidget();

  Widget buildDrawer(BuildContext context) => null;

  Widget buildFloatButton(BuildContext context) => null;

  void blocListener(dynamic state) {}

  void nextPageBottomToTop(Widget widget) async {
    await Navigator.of(context).push(_createRoute(widget));
  }

  @override
  void dispose() {
    Log.d('$widget onDispose');
    bloc?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _isDispose = true;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !isFirstInit) {
      onResume();
    } else if (state == AppLifecycleState.paused) {
      onPause();
    } else if (state == AppLifecycleState.detached) {
      onDetach();
    } else if (state == AppLifecycleState.inactive) {
      onInactive();
    }
  }

  @mustCallSuper
  void onResume() {
    if (!_isDispose) {
      Log.d('$widget onResume');
      bloc?.onResume();
    }
  }

  @mustCallSuper
  void onPause() {
    if (!_isDispose) {
      Log.d('$widget onPause');
      bloc?.onPause();
    }
  }

  @mustCallSuper
  void onDetach() {
    if (!_isDispose) {
      Log.d('$widget onDetach');
      bloc?.onDetach();
    }
  }

  @mustCallSuper
  void onInactive() {
    if (!_isDispose) {
      Log.d('$widget onInactive');
      bloc?.onInactive();
    }
  }
}

Route _createRoute(Widget nextPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionDuration:const Duration(milliseconds: 1000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
