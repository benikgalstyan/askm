import 'package:askm/presentation/pages/sign_up_screen/sing_up_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const nameRoute = '/SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return const SignUpLayout();
  }
}
