import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_shadows_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_bottom_navigation_bar_theme.freezed.dart';

@freezed
class EduBottomNavigationBarTheme with _$EduBottomNavigationBarTheme {
  const factory EduBottomNavigationBarTheme({
    required double height,
    required ShadowsThemeReference shadow,
    required ColorSchemeReference backgroundColor,
    required ColorSchemeReference activeBackgroundColor,
    required double iconSize,
    required TextThemeReference labelStyle,
    required ColorSchemeReference foregroundColor,
    required ColorSchemeReference activeForegroundColor,
    required ColorSchemeReference indicatorColor,
    required double indicatorHeight,
  }) = _EduBottomNavigationBarTheme;

  factory EduBottomNavigationBarTheme.lerp(
    EduBottomNavigationBarTheme before,
    EduBottomNavigationBarTheme after,
    double t,
  ) =>
      EduBottomNavigationBarTheme(
        height: lerpDouble(before.height, after.height, t) ?? after.height,
        shadow: t < 0.5 ? before.shadow : after.shadow,
        backgroundColor: t < 0.5 ? before.backgroundColor : after.backgroundColor,
        activeBackgroundColor: t < 0.5 ? before.activeBackgroundColor : after.activeBackgroundColor,
        iconSize: lerpDouble(before.iconSize, after.iconSize, t) ?? after.iconSize,
        labelStyle: t < 0.5 ? before.labelStyle : after.labelStyle,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        activeForegroundColor: t < 0.5 ? before.activeForegroundColor : after.activeForegroundColor,
        indicatorColor: t < 0.5 ? before.indicatorColor : after.indicatorColor,
        indicatorHeight: lerpDouble(before.indicatorHeight, after.indicatorHeight, t) ?? after.indicatorHeight,
      );
}