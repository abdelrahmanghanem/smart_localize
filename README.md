# MainAppStrings Localization Package

MainAppStrings is a localization package for Flutter applications that provides easy and efficient handling of translations. It supports dynamic loading of language resources based on the app's locale, with robust fallback translations.

<p>
    <a href="https://github.com/abdelrahmanghanem/main_app_strings"><img src="https://img.shields.io/github/stars/abdelrahmanghanem/main_app_strings?style=social" alt="Repo stars"></a>
    <a href="https://github.com/abdelrahmanghanem/main_app_strings/commits/main"><img src="https://img.shields.io/github/last-commit/abdelrahmanghanem/main_app_strings/main?logo=git" alt="Last Commit"></a>
    <a href="https://github.com/abdelrahmanghanem/main_app_strings/pulls"><img src="https://img.shields.io/github/issues-pr/abdelrahmanghanem/main_app_strings" alt="Repo PRs"></a>
    <a href="https://github.com/abdelrahmanghanem/main_app_strings/issues?q=is%3Aissue+is%3Aopen"><img src="https://img.shields.io/github/issues/abdelrahmanghanem/main_app_strings" alt="Repo issues"></a>
    <a href="https://github.com/abdelrahmanghanem/main_app_strings/blob/main/LICENSE"><img src="https://badgen.net/github/license/abdelrahmanghanem/main_app_strings" alt="License"></a>
</p>

## Features

- **Easy setup** with Flutter's localization system.
- **Dynamic locale support** with the ability to load multiple languages.
- **Fallback translations** for robust error handling.
- **Singleton design pattern** for efficient resource management.
- **Customizable translation keys** and error logging for development debugging.

## Installation

1. Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  main_app_strings: <latest_version>
```


## Usage

### Example

```dart
  Text(
    AppStrings.company,
    style: const TextStyle(fontSize: 14),
  )
```

### Basic Usage

Here is an example of how to use the `MainAppStrings` widget in your Flutter application:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: const Locale('ar'),
      localeResolutionCallback: (locale, supportedLocales) =>
      supportedLocales.contains(locale) ? locale : const Locale('ar'),
      localizationsDelegates: const [
        MainAppStrings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppStrings.home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.company,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              AppStrings.confirmNewPassword,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              AppStrings.country,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              AppStrings.confirmAcceptCookies,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Localization

To enable validation message localization in the Factory Constructors, add `MainAppStrings.delegate` to your app's list of delegates:

```dart
  MaterialApp(
    localizationsDelegates: [
      MainAppStrings.delegate,
   
      // other delegates...
    ],
    // other app configurations...
  )
```
## Contributions
Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/abdelrahmanghanem/main_app_strings/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/abdelrahmanghanem/main_app_strings/pulls).

<a href="https://github.com/abdelrahmanghanem/main_app_strings/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=abdelrahmanghanem/main_app_strings"  alt=""/>
</a>

Made with [contrib.rocks](https://contrib.rocks).