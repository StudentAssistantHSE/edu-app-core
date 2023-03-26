import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_shimmer_theme.freezed.dart';

@freezed
class LoadingShimmerTheme with _$LoadingShimmerTheme {
  const factory LoadingShimmerTheme({
    required Duration duration,
    required ColorSchemeReference baseColor,
    required ColorSchemeReference highlightColor,
  }) = _LoadingShimmerTheme;

  factory LoadingShimmerTheme.lerp(LoadingShimmerTheme before, LoadingShimmerTheme after, double t) =>
      LoadingShimmerTheme(
        duration: lerpDuration(before.duration, after.duration, t),
        baseColor: t < 0.5 ? before.baseColor : after.baseColor,
        highlightColor: t < 0.5 ? before.highlightColor : after.highlightColor,
      );
}