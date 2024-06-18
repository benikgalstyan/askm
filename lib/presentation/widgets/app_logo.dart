import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:askm/generated/assets/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.images.logo);
  }
}
