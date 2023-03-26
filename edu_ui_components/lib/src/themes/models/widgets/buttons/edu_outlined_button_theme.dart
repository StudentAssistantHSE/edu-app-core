import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_opacity_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_outlined_button_theme.freezed.dart';

@freezed
class EduOutlinedButtonTheme with _$EduOutlinedButtonTheme {
  const factory EduOutlinedButtonTheme({
    required ColorSchemeReference outlineColor,
    required TextThemeReference textStyle,
    required OpacityThemeReference disabledOpacity,
    required double borderWidth,
  }) = _EduOutlinedButtonTheme;

  factory EduOutlinedButtonTheme.lerp(EduOutlinedButtonTheme before, EduOutlinedButtonTheme after, double t) =>
      EduOutlinedButtonTheme(
        outlineColor: t < 0.5 ? before.outlineColor : after.outlineColor,
        textStyle: t < 0.5 ? before.textStyle : after.textStyle,
        disabledOpacity: t < 0.5 ? before.disabledOpacity : after.disabledOpacity,
        borderWidth: lerpDouble(before.borderWidth, after.borderWidth, t) ?? after.borderWidth,
      );
}