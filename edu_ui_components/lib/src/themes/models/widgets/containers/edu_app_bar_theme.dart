import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_app_bar_theme.freezed.dart';

@freezed
class EduAppBarTheme with _$EduAppBarTheme {
  const factory EduAppBarTheme({
    required double toolbarHeight,
    required double iconSize,
    required ColorSchemeReference backgroundColor,
    required ColorSchemeReference foregroundColor,
    required TextThemeReference titleTextStyle,
    required TextThemeReference toolbarTextStyle,
  }) = _EduAppBarTheme;

  factory EduAppBarTheme.lerp(EduAppBarTheme before, EduAppBarTheme after, double t) =>
      EduAppBarTheme(
        toolbarHeight: lerpDouble(before.toolbarHeight, after.toolbarHeight, t) ?? after.toolbarHeight,
        iconSize: lerpDouble(before.iconSize, after.iconSize, t) ?? after.iconSize,
        backgroundColor: t < 0.5 ? before.backgroundColor : after.backgroundColor,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        titleTextStyle: t < 0.5 ? before.titleTextStyle : after.titleTextStyle,
        toolbarTextStyle: t < 0.5 ? before.titleTextStyle : after.titleTextStyle,
      );
}