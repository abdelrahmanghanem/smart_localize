import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

extension StringExtension on BuildContext {
  List<LocalizationsDelegate> get smartLocalizeDelegates =>
      LocalizeDelegate.of(this)?.delegates ??
      LocalizeDelegate.instance.delegates;
}

class LocalizeDelegate {
  Translations? _translations;
  Translations? _fallbackTranslations;
  late Locale _locale;

  LocalizeDelegate._(); // Private constructor for Singleton

  static LocalizeDelegate? _instance;

  // Singleton instance accessor
  static LocalizeDelegate get instance => _instance ??= LocalizeDelegate._();

  // Localization delegate for use in Flutter's localization system
  static const LocalizationsDelegate<LocalizeDelegate> delegate =
      _LocalizationsDelegate();

  List<LocalizationsDelegate> get delegates => [
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static LocalizeDelegate? of(BuildContext context) =>
      Localizations.of<LocalizeDelegate>(context, LocalizeDelegate);

  // Method to load resources for a specific locale
  static Future<Map<String, dynamic>> loadResources(Locale locale) async {
    const String basePath = 'packages/smart_localize/assets/translation';
    final List<String> resourceFiles = [
      'button',
      'confirmation',
      'date',
      'footer',
      'label',
      'placeholder'
    ];
    Map<String, dynamic> combinedMap = {};

    for (final fileName in resourceFiles) {
      final filePath =
          '$basePath/${locale.languageCode}/${fileName}_${locale.languageCode}.json';
      try {
        final fileContent = await rootBundle.loadString(filePath);
        final decodedMap = json.decode(fileContent) as Map<String, dynamic>;
        combinedMap.addAll(decodedMap);
      } catch (e) {
        debugPrint('Error loading file $filePath: $e');
      }
    }

    return combinedMap;
  }

  // Load translations and fallback translations
  static Future<bool> load(
    Locale locale, {
    Translations? fallbackTranslations,
    bool useFallbackTranslationsForEmptyResources = false,
  }) async {
    instance._locale = locale;
    final resources = await loadResources(locale);

    instance._translations = Translations(resources);
    instance._fallbackTranslations = fallbackTranslations;

    return resources.isNotEmpty;
  }

  // Translate a key using the main or fallback translations
  String tr(String key) => _resolve(key);

  // Helper method to resolve translations with fallback support
  String _resolve(String key, {bool logging = true}) {
    String? resource = _translations?.get(key);

    if (resource == null || resource.isEmpty) {
      if (logging) {
        debugPrint(
            'Localization key [$key] not found for locale ${_locale.languageCode}');
      }

      resource = _fallbackTranslations?.get(key);

      if ((resource == null || resource.isEmpty) && logging) {
        debugPrint('Fallback localization key [$key] not found');
      }

      // Return the key itself as a fallback when no translation is found
      return resource ?? key;
    }

    return resource;
  }
}

class Translations {
  final Map<String, dynamic> _translations;

  Translations(this._translations);

  String? get(String key) {
    return _translations[key]?.toString();
  }
}

// Delegate class to handle localization loading
class _LocalizationsDelegate extends LocalizationsDelegate<LocalizeDelegate> {
  const _LocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<LocalizeDelegate> load(Locale locale) async {
    await LocalizeDelegate.load(locale);
    return LocalizeDelegate.instance;
  }

  @override
  bool shouldReload(_LocalizationsDelegate old) => false;
}
