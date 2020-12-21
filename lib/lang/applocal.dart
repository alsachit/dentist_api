import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocal {
  Locale locale;

  AppLocal(this.locale);

  Map<String, String> _loadedLocalizedValues;

  static AppLocal of(BuildContext context) {
    return Localizations.of(context, AppLocal);
  }

  Future loadLang() async {
    String _langFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedLocalizedValues =
        _loadedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslated(String key) {
    return _loadedLocalizedValues[key];
  }

  static const LocalizationsDelegate<AppLocal> delegate = _AppLocaleDelegate();
}

class _AppLocaleDelegate extends LocalizationsDelegate<AppLocal> {
  const _AppLocaleDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocal> load(Locale locale) async {
    AppLocal appLocal = AppLocal(locale);
    await appLocal.loadLang();
    return appLocal;
  }

  @override
  bool shouldReload(_AppLocaleDelegate old) => false;
}
