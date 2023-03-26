import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_indicator_theme.freezed.dart';

@freezed
class LoadingIndicatorTheme with _$LoadingIndicatorTheme {
  const factory LoadingIndicatorTheme({
    required ColorSchemeReference color,
    required Duration duration,
    required double iconSize,
    required double dotsSize,
  }) = _LoadingIndicatorTheme;

  factory LoadingIndicatorTheme.lerp(LoadingIndicatorTheme before, LoadingIndicatorTheme after, double t) =>
      LoadingIndicatorTheme(
        color: t < 0.5 ? before.color : after.color,
        duration: lerpDuration(before.duration, after.duration, t),
        iconSize: lerpDouble(before.iconSize, after.iconSize, t) ?? after.iconSize,
        dotsSize: lerpDouble(before.dotsSize, after.dotsSize, t) ?? after.dotsSize,
      );
}