import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Spacings.paddingH20,
        child: child,
      ),
    );
  }
}
