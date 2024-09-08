/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_bar_logo.svg
  String get appBarLogo => 'assets/images/app_bar_logo.svg';

  /// File path: assets/images/background_image.png
  AssetGenImage get backgroundImage =>
      const AssetGenImage('assets/images/background_image.png');

  /// File path: assets/images/bookmark_icon.svg
  String get bookmarkIcon => 'assets/images/bookmark_icon.svg';

  /// File path: assets/images/failure.svg
  String get failure => 'assets/images/failure.svg';

  /// File path: assets/images/food.svg
  String get food => 'assets/images/food.svg';

  /// File path: assets/images/gift.svg
  String get gift => 'assets/images/gift.svg';

  /// File path: assets/images/google_icon.svg
  String get googleIcon => 'assets/images/google_icon.svg';

  /// File path: assets/images/history_icon.svg
  String get historyIcon => 'assets/images/history_icon.svg';

  /// File path: assets/images/logo.svg
  String get logo => 'assets/images/logo.svg';

  /// File path: assets/images/mail.svg
  String get mail => 'assets/images/mail.svg';

  /// File path: assets/images/plant.svg
  String get plant => 'assets/images/plant.svg';

  /// File path: assets/images/refresh.svg
  String get refresh => 'assets/images/refresh.svg';

  /// File path: assets/images/test.png
  AssetGenImage get test => const AssetGenImage('assets/images/test.png');

  /// File path: assets/images/trade.svg
  String get trade => 'assets/images/trade.svg';

  /// List of all assets
  List<dynamic> get values => [
        appBarLogo,
        backgroundImage,
        bookmarkIcon,
        failure,
        food,
        gift,
        googleIcon,
        historyIcon,
        logo,
        mail,
        plant,
        refresh,
        test,
        trade
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
