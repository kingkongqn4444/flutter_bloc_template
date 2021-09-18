import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class AppLocalizations implements WidgetsLocalizations {
  static AppLocalizationsDelegate delegate = AppLocalizationsDelegate._();

  static Map<dynamic, dynamic> localizedValues = {};
  static Map<String, String> _cache = {};

  static Future<AppLocalizations> load(Locale locale) async {
    await setNewLanguage(locale.languageCode);
    return AppLocalizations(locale);
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final RegExp _replaceArgRegex = RegExp(r'{}');
  final Locale locale;

  static Future<Null> setNewLanguage([String localeName, bool saveInPrefs = false]) async {
    if (localeName == '') {
      localeName = LocaleCodes.vi;
    }

    String jsonContent = await rootBundle.loadString("assets/locale/i18n_$localeName.json");
    localizedValues = json.decode(jsonContent);
    _cache.clear();

    return null;
  }

  @override
  TextDirection get textDirection => TextDirection.ltr;

  AppLocalizations(this.locale);

  String text(String key, {List<dynamic> args}) {
    String string = '** $key not found';

    if (localizedValues != null) {
      if (_cache[key] != null && args == null) {
        string = _cache[key];
      } else {
        bool found = true;
        Map<dynamic, dynamic> _values = localizedValues;
        List<String> _keyParts = key.split('.');
        int _keyPartsLen = _keyParts.length;
        int index = 0;
        int lastIndex = _keyPartsLen - 1;

        while (index < _keyPartsLen && found) {
          var value = _values[_keyParts[index]];

          if (value == null) {
            found = false;
            break;
          }

          if (value is String && index == lastIndex) {
            string = value;

            _cache[key] = string;
            break;
          }

          _values = value;
          index++;
        }
      }
    }
    return _replaceNamedArgs(string, args);
  }

  String _replaceNamedArgs(String res, List<dynamic> args) {
    if (args == null || args.isEmpty) return res;
    args.forEach((value) => res = res.replaceFirst(_replaceArgRegex, '$value'));
    return res;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  AppLocalizationsDelegate._();

  List<Locale> get supportedLocales => _supportedLocales;

  List<Locale> _supportedLocales = [
    Locale('vi', 'VN'),
    Locale('en', 'US'),
  ];
  Locale _currentLocale;

  @override
  bool isSupported(Locale locale) => locale != null && supportedLocales.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) {
    _currentLocale = locale;

    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }

  void setSupportedLocales(List<Locale> locales) async {
    _supportedLocales = locales;

    await load(_currentLocale ?? _supportedLocales.first);
  }

  LocaleListResolutionCallback listResolution({Locale fallback}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supportedLocales.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final languageLocale = Locale(locale.languageCode, locale.countryCode);
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }
}
