import 'package:askm/core/logger/composite_logger_holder.dart';
import 'package:askm/core/router/app_router_holder.dart';
import 'package:askm/core/router/router.dart';
import 'package:askm/generated/l10n.dart';
import 'package:askm/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AskmApp extends StatelessWidget {
  AskmApp({super.key});

  final _router = AppRouter(secureStorageService: getSecureStorage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.light(),
      routerConfig: _router.config(),
      builder: (context, router) {
        return AppRouterHolder(
          router: _router,
          child: CompositeLoggerHolder(
            compositeLogger: getLogger,
            child: router!,
          ),
        );
      },
    );
  }
}
