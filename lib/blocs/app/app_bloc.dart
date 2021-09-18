import 'dart:async';

import 'package:sdk/flutter_sdk.dart';

import '../../enums.dart';
import '../../theme/theme.dart';
import 'app_state.dart';

class AppBloc extends BaseBloc<AppState> {
  AppBloc() {
    emit(AppState(
      appTheme: AppTheme.light.value,
      locale: LocaleBuilder.getLocale(state?.locale?.languageCode),
    ));
  }

  Future<void> init() async {
    emit(AppState(
      state: state,
      locale: LocaleBuilder.getLocale(Language.vi.value),
      appTheme: AppTheme.light.value,
    ));
  }

  Future<void> changeTheme(String theme) async {
//    final prefs = GetIt.I.get<SharedPreferences>();
//    await prefs.setString(SharedPreferencesKey.theme, theme);
//    emit(AppState(
//      appTheme: theme,
//      state: state,
//    ));
  }
}
