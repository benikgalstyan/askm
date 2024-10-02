import 'package:askm/presentation/pages/history_screen/history_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const nameRoute = '/HistoryScreen';

  @override
  Widget build(BuildContext context) => const HistoryLayout();
}
