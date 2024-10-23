import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HistoryScreenShimmer extends StatelessWidget {
  HistoryScreenShimmer({super.key});

  static const _bodyHeight = 50.0;
  static const _bodyWidth = 320.0;
  static const _headerWidth = 186.0;
  static const _headerHeight = 20.0;
  final _highlightColor = Colors.grey.shade100;
  final _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
          padding: Spacings.paddingH16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildShimmerWidgets(),
          ),
        ),
      );

  List<Widget> _buildShimmerWidgets() {
    final List<Widget> shimmerWidgets = [];

    for (int i = 0; i < 2; i++) {
      shimmerWidgets.addAll([
        _buildShimmerHeader(),
        Spacings.spacer16,
        _buildShimmerBody(),
        Spacings.spacer20,
      ]);
    }

    return shimmerWidgets;
  }

  Widget _buildShimmerHeader() => _buildShimmerContainer(
        width: _headerWidth,
        height: _headerHeight,
        highlightColor: _highlightColor,
        baseColor: LightPalette.lightShimmerColor,
      );

  Widget _buildShimmerBody() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          3,
          (index) => Padding(
            padding: Spacings.paddingV4,
            child: _buildShimmerContainer(
              width: _bodyWidth,
              height: _bodyHeight,
              highlightColor: _highlightColor,
              baseColor: LightPalette.darkShimmerColor,
            ),
          ),
        ),
      );

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
