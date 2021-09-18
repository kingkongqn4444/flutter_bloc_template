import 'dart:ui';

import '../enums.dart';

class LocaleBuilder {
  static Locale getLocale(String languageCode) {
    switch (languageCode) {
      case 'vi':
        return Locale(Language.vi.value, 'VN');
      case 'en':
        return Locale(Language.en.value, 'US');
      default:
        return Locale(Language.vi.value, 'VN');
    }
  }
}
