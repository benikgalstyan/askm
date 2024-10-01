import 'package:askm/presentation/pages/sign_in_screen/sign_in_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const nameRoute = '/SignInScreen';

  @override
  Widget build(BuildContext context) {
    return const SignInLayout();
  }
}
