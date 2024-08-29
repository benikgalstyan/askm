import 'package:askm/presentation/pages/main_screen/main_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const nameRoute = '/MainScreen';

  @override
  Widget build(BuildContext context) {
    return const MainLayout();
  }
}
