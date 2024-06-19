import 'package:askm/presentation/pages/social_sign_up_screen/social_sign_up_layout.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SocialSignUpScreen extends StatelessWidget {
  const SocialSignUpScreen({super.key});

  static const nameRoute = '/SocialScreen';

  @override
  Widget build(BuildContext context) {
    return const SocialSignUpLayout();
  }
}
