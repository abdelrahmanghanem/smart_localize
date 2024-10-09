import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This class handles the localization of validation messages based on the current locale.
///
/// The class loads the appropriate JSON file for the locale and provides methods
/// to retrieve localized validation messages.
///
/// - [locale]: The locale for which the localizations will be loaded.
class MainAppLocalizations {
  late Locale _locale;

  MainAppLocalizations();
  static MainAppLocalizations? _instance;

  static MainAppLocalizations get instance =>
      _instance ?? (_instance = MainAppLocalizations());

  static MainAppLocalizations? of(BuildContext context) {
    return Localizations.of<MainAppLocalizations>(
      context,
      MainAppLocalizations,
    );
  }

  static const LocalizationsDelegate<MainAppLocalizations> delegate =
      _MainAppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load(Locale locale) async {
    instance._locale = locale;
    String jsonString = await rootBundle.loadString(
        'packages/main_app_strings/src/translation/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? translate(String? key) {
    return _localizedStrings[key!];
  }
}

class _MainAppLocalizationsDelegate
    extends LocalizationsDelegate<MainAppLocalizations> {
  const _MainAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ar"].contains(locale.languageCode);
  }

  @override
  Future<MainAppLocalizations> load(Locale locale) async {
    MainAppLocalizations localizations = MainAppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MainAppLocalizationsDelegate old) => false;
}

/// This class represents a validation message, with support for localization.
///
/// - [key]: The key used to retrieve the localized message.
/// - [message]: The default message, which is used if no localized message is found.
