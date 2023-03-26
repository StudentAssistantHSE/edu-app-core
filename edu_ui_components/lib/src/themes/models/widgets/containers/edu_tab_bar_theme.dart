import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_tab_bar_theme.freezed.dart';

@freezed
class EduTabBarTheme with _$EduTabBarTheme {
  const factory EduTabBarTheme({
    required ColorSchemeReference indicatorColor,
    required TextThemeReference labelStyle,
    required ColorSchemeReference foregroundColor,
    required ColorSchemeReference activeForegroundColor,
    required EdgeInsets labelPadding,
  }) = _EduTabBarTheme;

  factory EduTabBarTheme.lerp(EduTabBarTheme before, EduTabBarTheme after, double t) =>
      EduTabBarTheme(
        indicatorColor: t < 0.5 ? before.indicatorColor : after.indicatorColor,
        labelStyle: t < 0.5 ? before.labelStyle : after.labelStyle,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        activeForegroundColor: t < 0.5 ? before.activeForegroundColor : after.activeForegroundColor,
        labelPadding: EdgeInsets.lerp(before.labelPadding, after.labelPadding, t) ?? after.labelPadding,
      );
}