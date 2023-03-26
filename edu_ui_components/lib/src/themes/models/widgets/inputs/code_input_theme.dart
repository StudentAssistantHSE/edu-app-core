import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_input_theme.freezed.dart';

@freezed
class CodeInputTheme with _$CodeInputTheme {
  const factory CodeInputTheme({
    required TextThemeReference codeTextStyle,
    required ColorSchemeReference codeTextColor,
    required ColorSchemeReference activePinColor,
    required ColorSchemeReference disabledPinColor,
    required ColorSchemeReference errorPinColor,
    required TransitionsThemeReference transition,
    required double pinWidth,
    required double pinHeight,
    required double pinSpace,
  }) = _CodeInputTheme;

  factory CodeInputTheme.lerp(CodeInputTheme before, CodeInputTheme after, double t) =>
      CodeInputTheme(
        codeTextStyle: t < 0.5 ? before.codeTextStyle : after.codeTextStyle,
        codeTextColor: t < 0.5 ? before.codeTextColor : after.codeTextColor,
        activePinColor: t < 0.5 ? before.activePinColor : after.activePinColor,
        disabledPinColor: t < 0.5 ? before.disabledPinColor : after.disabledPinColor,
        errorPinColor: t < 0.5 ? before.errorPinColor : after.errorPinColor,
        transition: t < 0.5 ? before.transition : after.transition,
        pinWidth: lerpDouble(before.pinWidth, after.pinWidth, t) ?? after.pinWidth,
        pinHeight: lerpDouble(before.pinHeight, after.pinHeight, t) ?? after.pinHeight,
        pinSpace: lerpDouble(before.pinSpace, after.pinSpace, t) ?? after.pinSpace,
      );
}