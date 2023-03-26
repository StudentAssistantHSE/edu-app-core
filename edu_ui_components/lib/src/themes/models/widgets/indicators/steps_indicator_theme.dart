import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'steps_indicator_theme.freezed.dart';

@freezed
class StepsIndicatorTheme with _$StepsIndicatorTheme {
  const factory StepsIndicatorTheme({
    required TransitionsThemeReference activeTransition,
    required TransitionsThemeReference inactiveTransition,
    required double stepSize,
    required double stepSpace,
    required ColorSchemeReference activeColor,
    required ColorSchemeReference inactiveBorderColor,
  }) = _StepsIndicatorTheme;

  factory StepsIndicatorTheme.lerp(StepsIndicatorTheme before, StepsIndicatorTheme after, double t) =>
      StepsIndicatorTheme(
        activeTransition: t < 0.5 ? before.activeTransition : after.activeTransition,
        inactiveTransition: t < 0.5 ? before.inactiveTransition : after.inactiveTransition,
        stepSize: lerpDouble(before.stepSize, after.stepSize, t) ?? after.stepSize,
        stepSpace: lerpDouble(before.stepSpace, after.stepSpace, t) ?? after.stepSpace,
        activeColor: t < 0.5 ? before.activeColor : after.activeColor,
        inactiveBorderColor: t < 0.5 ? before.inactiveBorderColor : after.inactiveBorderColor,
      );
}