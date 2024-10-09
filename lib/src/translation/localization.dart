import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MainAppStrings {
  Translations? _translations, _fallbackTranslations;
  late Locale _locale;

  MainAppStrings();

  static MainAppStrings? _instance;
  static MainAppStrings get instance =>
      _instance ?? (_instance = MainAppStrings());

  static MainAppStrings? of(BuildContext context) =>
      Localizations.of<MainAppStrings>(context, MainAppStrings);

  static const LocalizationsDelegate<MainAppStrings> delegate =
      _MainAppStringsDelegate();

  static Future<Map<String, dynamic>> loadResources(Locale locale) async {
    String jsonString = await rootBundle.loadString(
        'packages/main_app_strings/src/translation/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    final translations = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return translations;
  }

  static Future<bool> load(
    Locale locale, {
    Translations? fallbackTranslations,
    bool useFallbackTranslationsForEmptyResources = false,
  }) async {
    instance._locale = locale;
    instance._translations =
        Translations(await loadResources(instance._locale));
    instance._fallbackTranslations = fallbackTranslations;
    return instance._translations == null ? false : true;
  }

  String tr(String key) {
    return _resolve(key);
  }

  String _resolve(String key, {bool logging = true, bool fallback = true}) {
    var resource = _translations?.get(key);
    if (resource == null || (resource.isEmpty)) {
      if (logging) {
        log('Localization key [$key] not found');
      }
      if (_fallbackTranslations == null || !fallback) {
        return key;
      } else {
        resource = _fallbackTranslations?.get(key);
        if (resource == null || (resource.isEmpty)) {
          if (logging) {
            log('Fallback localization key [$key] not found');
          }
          return key;
        }
      }
    }
    return resource;
  }
}

class Translations {
  final Map<String, dynamic>? _translations;

  Translations(this._translations);
  String? get(String key) {
    return _translations?[key];
  }
}

class _MainAppStringsDelegate extends LocalizationsDelegate<MainAppStrings> {
  const _MainAppStringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<MainAppStrings> load(Locale locale) async {
    await MainAppStrings.load(locale);
    return MainAppStrings.instance;
  }

  @override
  bool shouldReload(_MainAppStringsDelegate old) => false;
}
