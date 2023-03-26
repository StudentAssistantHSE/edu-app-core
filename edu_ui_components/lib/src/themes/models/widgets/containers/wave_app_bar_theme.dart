import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_gradients_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wave_app_bar_theme.freezed.dart';

@freezed
class WaveAppBarTheme with _$WaveAppBarTheme {
  const factory WaveAppBarTheme({
    required double keyboardCollapsedSize,
    required double keyboardOpenedHeight,
    required double logoSize,
    required GradientsThemeReference gradient,
    required TransitionsThemeReference keyboardCollapsedTransition,
    required TransitionsThemeReference keyboardOpenedTransition,
  }) = _WaveAppBarTheme;

  factory WaveAppBarTheme.lerp(WaveAppBarTheme before, WaveAppBarTheme after, double t) =>
      WaveAppBarTheme(
        keyboardCollapsedSize: lerpDouble(before.keyboardCollapsedSize, after.keyboardCollapsedSize, t) ?? after.keyboardCollapsedSize,
        keyboardOpenedHeight: lerpDouble(before.keyboardOpenedHeight, after.keyboardOpenedHeight, t) ?? after.keyboardOpenedHeight,
        logoSize: lerpDouble(before.logoSize, after.logoSize, t) ?? after.logoSize,
        gradient: t < 0.5 ? before.gradient : after.gradient,
        keyboardCollapsedTransition: t < 0.5 ? before.keyboardCollapsedTransition : after.keyboardCollapsedTransition,
        keyboardOpenedTransition: t < 0.5 ? before.keyboardOpenedTransition : after.keyboardOpenedTransition,
      );
}