import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_input_theme.freezed.dart';

@freezed
class TextInputTheme with _$TextInputTheme {
  const factory TextInputTheme({
    required EdgeInsets padding,
    required double borderRadius,
    required double markerWidth,
    required TextThemeReference hintStyle,
    required TextThemeReference textStyle,
    required ColorSchemeReference backgroundColor,
    required ColorSchemeReference focusedBackgroundColor,
    required ColorSchemeReference errorBackgroundColor,
    required ColorSchemeReference foregroundColor,
    required ColorSchemeReference enteredForegroundColor,
    required ColorSchemeReference errorForegroundColor,
    required ColorSchemeReference disabledForegroundColor,
    required TransitionsThemeReference focusedTransition,
    required TransitionsThemeReference unfocusedTransition,
    required Duration timeoutDuration,
  }) = _TextInputTheme;

  factory TextInputTheme.lerp(TextInputTheme before, TextInputTheme after, double t) =>
      TextInputTheme(
        padding: EdgeInsets.lerp(before.padding, after.padding, t) ?? after.padding,
        borderRadius: lerpDouble(before.borderRadius, after.borderRadius, t) ?? after.borderRadius,
        markerWidth: lerpDouble(before.markerWidth, after.markerWidth, t) ?? after.markerWidth,
        hintStyle: t < 0.5 ? before.hintStyle : after.hintStyle,
        textStyle: t < 0.5 ? before.textStyle : after.textStyle,
        backgroundColor: t < 0.5 ? before.backgroundColor : after.backgroundColor,
        focusedBackgroundColor: t < 0.5 ? before.focusedBackgroundColor : after.focusedBackgroundColor,
        errorBackgroundColor: t < 0.5 ? before.errorBackgroundColor : after.errorBackgroundColor,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        enteredForegroundColor: t < 0.5 ? before.enteredForegroundColor : after.enteredForegroundColor,
        errorForegroundColor: t < 0.5 ? before.errorForegroundColor : after.errorForegroundColor,
        disabledForegroundColor: t < 0.5 ? before.disabledForegroundColor : after.disabledForegroundColor,
        focusedTransition: t < 0.5 ? before.focusedTransition : after.focusedTransition,
        unfocusedTransition: t < 0.5 ? before.unfocusedTransition : after.unfocusedTransition,
        timeoutDuration: lerpDuration(before.timeoutDuration, after.timeoutDuration, t),
      );
}