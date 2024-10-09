import 'dart:developer';

import 'package:flutter/widgets.dart';

class Localization {
  Translations? _translations, _fallbackTranslations;
  late Locale _locale;

  bool _useFallbackTranslationsForEmptyResources = false;

  Localization();

  static Localization? _instance;
  static Localization get instance => _instance ?? (_instance = Localization());

  static Localization? of(BuildContext context) =>
      Localizations.of<Localization>(context, Localization);

  static const LocalizationsDelegate<Localization> delegate =
      _MainAppLocalizationsDelegate();

  static bool load(
    Locale locale, {
    Translations? translations,
    Translations? fallbackTranslations,
    bool useFallbackTranslationsForEmptyResources = false,
    bool ignorePluralRules = true,
  }) {
    instance._locale = locale;
    instance._translations = translations;
    instance._fallbackTranslations = fallbackTranslations;
    instance._useFallbackTranslationsForEmptyResources =
        useFallbackTranslationsForEmptyResources;
    return translations == null ? false : true;
  }

  String tr(String key) {
    return _resolve(key);
  }

  String _resolve(String key, {bool logging = true, bool fallback = true}) {
    var resource = _translations?.get(key);
    if (resource == null ||
        (_useFallbackTranslationsForEmptyResources && resource.isEmpty)) {
      if (logging) {
        log('Localization key [$key] not found');
      }
      if (_fallbackTranslations == null || !fallback) {
        return key;
      } else {
        resource = _fallbackTranslations?.get(key);
        if (resource == null ||
            (_useFallbackTranslationsForEmptyResources && resource.isEmpty)) {
          if (logging) {
            log('Fallback localization key [$key] not found');
          }
          return key;
        }
      }
    }
    return resource;
  }

  bool exists(String key) {
    return _translations?.get(key) != null;
  }
}

class Translations {
  final Map<String, dynamic>? _translations;

  Translations(this._translations);
  String? get(String key) {
    return _translations?[key];
  }
}

class MainAppMessage {
  final String? key;
  String? message;

  MainAppMessage({
    this.key,
    this.message,
  });

  /// Localizes the validation message by looking up the key in the localizations.
  ///
  /// If the key is found, the localized message will be returned. If no localization is found,
  /// the default message is used instead.
  ///
  /// - Parameters:
  ///   - [context]: The current BuildContext used for localization.
  ///
  /// - Returns: The localized message or the default message if localization is not found.
  String? localize(BuildContext context) {
    message = Localization().of(context)?.translate(key) ?? message;
    return message;
  }
}

class _MainAppLocalizationsDelegate
    extends LocalizationsDelegate<Localization> {
  const _MainAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) async {
    Localization localizations = Localization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MainAppLocalizationsDelegate old) => false;
}
