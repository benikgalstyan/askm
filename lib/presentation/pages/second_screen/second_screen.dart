import 'package:askm/presentation/pages/second_screen/second_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  static const nameRoute = '/SecondScreen';

  @override
  Widget build(BuildContext context) {
    return const SecondLayout();
  }
}
