import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sdk/flutter_sdk.dart';

import 'blocs/blocs.dart';
import 'enums.dart';
import 'router/router.dart';
import 'theme/theme.dart';

final navigationKey = GlobalKey<NavigatorState>();
bool isLogout = false;
Environment environment = Environment.dev;

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appBloc = AppBloc();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    appBloc?.listenerStream?.listen((state) {
      if (state != null && state is bool && state) {
        navigationKey?.currentState?.pushNamedAndRemoveUntil(Routes.homePage, (route) => false);
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: appBloc..init()),
      ],
      child: Consumer<AppBloc>(
        builder: (_, bloc) => StreamBuilder<AppState>(
          stream: bloc.stateStream,
          builder: (context, snapshot) => _buildApp(snapshot?.data),
        ),
      ),
    );
  }

  Widget _buildApp(AppState state) {
    return MaterialApp(
      navigatorKey: navigationKey,
      title: 'Value Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeBuilder.build(context, AppTheme.light.value, fontFamily: 'MyFont'),
      darkTheme: ThemeBuilder.build(context, AppTheme.dark.value, fontFamily: 'MyFont'),
      themeMode: ThemeBuilder.themeMode(state?.appTheme),
      initialRoute: Routes.splashPage,
      onGenerateRoute: (settings) => Routes.getRoute(settings),
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: state?.locale,
      localeResolutionCallback: AppLocalizations.delegate.resolution(
        fallback: AppLocalizations.delegate.supportedLocales.first,
      ),
    );
  }
}
