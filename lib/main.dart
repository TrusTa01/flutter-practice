import 'package:flutter/material.dart';
import 'package:flutter_application_default/l10n/gen/app_localizations.dart';
import 'package:flutter_application_default/screens/app_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_application_default/extensions/context_ext.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatefulWidget {
  DemoApp({super.key});

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  Locale _locale = const Locale('en');

  void _toggleLocale() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('ru')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => context.l10n.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      home: DemoAppScreen(onLocaleToggle: _toggleLocale),
    );
  }
}
