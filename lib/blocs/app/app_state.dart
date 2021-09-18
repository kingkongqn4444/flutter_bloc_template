import 'dart:ui';

import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final String appTheme;
  final String fontFamily;
  final Locale locale;
  final bool success;
  final String error;

  AppState({
    AppState state,
    String appTheme,
    String fontFamily,
    bool success,
    String error,
    Locale locale,
  })  : appTheme = appTheme ?? state?.appTheme,
        fontFamily = fontFamily ?? state?.fontFamily,
        locale = locale ?? state?.locale,
        success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object> get props => [appTheme, locale, fontFamily, success, error];
}
