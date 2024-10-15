# Smart Localize Package

SmartLocalize is a Flutter localization package that efficiently handles translations by dynamically loading language resources based on the app's locale, with robust fallback support.

<p>
    <a href="https://github.com/abdelrahmanghanem/smart_localize"><img src="https://img.shields.io/github/stars/abdelrahmanghanem/smart_localize?style=social" alt="Repo stars"></a>
    <a href="https://github.com/abdelrahmanghanem/smart_localize/commits/main"><img src="https://img.shields.io/github/last-commit/abdelrahmanghanem/smart_localize/main?logo=git" alt="Last Commit"></a>
    <a href="https://github.com/abdelrahmanghanem/smart_localize/pulls"><img src="https://img.shields.io/github/issues-pr/abdelrahmanghanem/smart_localize" alt="Repo PRs"></a>
    <a href="https://github.com/abdelrahmanghanem/smart_localize/issues?q=is%3Aissue+is%3Aopen"><img src="https://img.shields.io/github/issues/abdelrahmanghanem/smart_localize" alt="Repo issues"></a>
    <a href="https://github.com/abdelrahmanghanem/smart_localize/blob/main/LICENSE"><img src="https://badgen.net/github/license/abdelrahmanghanem/smart_localize" alt="License"></a>
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
  smart_localize: <latest_version>
```


## Usage

### Example

```dart
  Text(
    SmartLocalize.company,
    style: const TextStyle(fontSize: 14),
  )
```

### Basic Usage

Here is an example of how to use the `SmartLocalize` widget in your Flutter application:

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
      localizationsDelegates: context.smartLocalizeDelegates,
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
        title: Text(SmartLocalize.home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              SmartLocalize.company,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              SmartLocalizeValidation.passwordLowercase,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              SmartLocalizeConfirmation.addToCart,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              SmartLocalizePlaceholder.enterEmail,
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

To enable validation message localization in the Factory Constructors, add `LocalizeDelegate.delegate` to your app's list of delegates:

```dart
  MaterialApp(
    localizationsDelegates: context.smartLocalizeDelegates,
    // other app configurations...
  )
```
## Contributions
Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/abdelrahmanghanem/smart_localize/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/abdelrahmanghanem/smart_localize/pulls).

<a href="https://github.com/abdelrahmanghanem/smart_localize/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=abdelrahmanghanem/smart_localize"  alt=""/>
</a>

Made with [contrib.rocks](https://contrib.rocks).