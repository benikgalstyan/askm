import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MainScreenShimmer extends StatelessWidget {
  MainScreenShimmer({super.key});

  final _headerWidth = 320.0;
  final _headerHeight = 40.0;
  final _bodyHeight = 72.0;
  final _highlightColor = Colors.grey.shade100;
  final BorderRadius _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShimmerHeader(),
            Spacings.spacer12,
            _buildShimmerBody(),
          ],
        ),
      );

  Widget _buildShimmerHeader() => _buildShimmerContainer(
        width: _headerWidth,
        height: _headerHeight,
        highlightColor: _highlightColor,
        baseColor: LightPalette.lightShimmerColor,
      );

  Widget _buildShimmerBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(4, (index) {
          return Padding(
            padding: Spacings.paddingV4,
            child: _buildShimmerContainer(
              height: _bodyHeight,
              width: _getBodyWidth(index),
              highlightColor: _highlightColor,
              baseColor: LightPalette.darkShimmerColor,
            ),
          );
        }),
      );

  double _getBodyWidth(int index) {
    switch (index) {
      case 0:
        return 294.0;
      case 1:
        return 233.0;
      case 2:
        return 258.0;
      case 3:
        return 282.0;
      default:
        return _headerWidth;
    }
  }

  Widget _buildShimmerContainer({
    required double width,
    required double height,
    required Color baseColor,
    required Color highlightColor,
  }) =>
      Shimmer.fromColors(
        enabled: true,
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: _borderRadius,
          ),
        ),
      );
}
