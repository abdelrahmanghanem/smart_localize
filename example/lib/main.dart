import 'package:flutter/material.dart';
import 'package:smart_localize/smart_localize.dart';

void main() {
  runApp(const MyApp());
}

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
          supportedLocales.contains(locale) ? locale : const Locale('en'),
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
              SmartLocalize.confirmNewPassword,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              SmartLocalize.country,
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              SmartLocalize.confirmNewPassword,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
