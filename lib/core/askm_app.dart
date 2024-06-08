import 'package:askm/generated/l10n.dart';
import 'package:askm/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AskmApp extends StatefulWidget {
  const AskmApp({super.key});

  @override
  State<AskmApp> createState() => _AskmAppState();
}

class _AskmAppState extends State<AskmApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.dark(),
      home: const MainScreen(),
      builder: (context, widget) => SafeArea(child: widget ?? const SizedBox()),
    );
  }
}
