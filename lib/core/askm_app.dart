import 'package:askm/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData.dark(),
      home: const MainScreen(),
      builder: (context, widget) => SafeArea(child: widget ?? const SizedBox()),
    );
  }
}
