import 'package:askm/core/router/router.dart';
import 'package:askm/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AskmApp extends StatefulWidget {
  const AskmApp({super.key});

  @override
  State<AskmApp> createState() => _AskmAppState();
}

class _AskmAppState extends State<AskmApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ru'),
      // TODO(Benik): delete later ru localization
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.dark(),
      routerConfig: _router.config(),
    );
  }
}
