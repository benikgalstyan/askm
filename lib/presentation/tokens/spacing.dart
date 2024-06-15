import 'package:flutter/material.dart';

class Spacings {
  static const double xxxS = 2.0;
  static const double xxS = 4.0;
  static const double xS = 6.0;
  static const double S = 8.0;
  static const double M = 12.0;
  static const double L = 16.0;
  static const double xL = 20.0;
  static const double xxL = 24.0;
  static const double xxxL = 32.0;
  static const double xxxxL = 48.0;
  static const double xxxxxL = 56.0;
  static const double xxxxxxL = 64.0;

  static const spacer2 = SizedBox.square(dimension: xxxS);
  static const spacer4 = SizedBox.square(dimension: xxS);
  static const spacer6 = SizedBox.square(dimension: xS);
  static const spacer8 = SizedBox.square(dimension: S);
  static const spacer12 = SizedBox.square(dimension: M);
  static const spacer16 = SizedBox.square(dimension: L);
  static const spacer20 = SizedBox.square(dimension: xL);
  static const spacer24 = SizedBox.square(dimension: xxL);
  static const spacer32 = SizedBox.square(dimension: xxxL);
  static const spacer48 = SizedBox.square(dimension: xxxxL);
  static const spacer56 = SizedBox.square(dimension: xxxxxL);
  static const spacer64 = SizedBox.square(dimension: xxxxxxL);

  static const padding2 = EdgeInsets.all(xxxS);
  static const padding4 = EdgeInsets.all(xxS);
  static const padding6 = EdgeInsets.all(xS);
  static const padding8 = EdgeInsets.all(S);
  static const padding12 = EdgeInsets.all(M);
  static const padding16 = EdgeInsets.all(L);
  static const padding20 = EdgeInsets.all(xL);
  static const padding24 = EdgeInsets.all(xxL);
  static const padding32 = EdgeInsets.all(xxxL);

  static const paddingH4 = EdgeInsets.symmetric(horizontal: xxS);
  static const paddingH8 = EdgeInsets.symmetric(horizontal: S);
  static const paddingH12 = EdgeInsets.symmetric(horizontal: M);
  static const paddingH16 = EdgeInsets.symmetric(horizontal: L);
  static const paddingH20 = EdgeInsets.symmetric(horizontal: xL);
  static const paddingH24 = EdgeInsets.symmetric(horizontal: xxL);
  static const paddingH32 = EdgeInsets.symmetric(horizontal: xxxL);

  static const paddingV4 = EdgeInsets.symmetric(vertical: xxS);
  static const paddingV8 = EdgeInsets.symmetric(vertical: S);
  static const paddingV12 = EdgeInsets.symmetric(vertical: M);
  static const paddingV16 = EdgeInsets.symmetric(vertical: L);
  static const paddingV20 = EdgeInsets.symmetric(vertical: xL);
  static const paddingV24 = EdgeInsets.symmetric(vertical: xxL);
  static const paddingV32 = EdgeInsets.symmetric(vertical: xxxL);
}
