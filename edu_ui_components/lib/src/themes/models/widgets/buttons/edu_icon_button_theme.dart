import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_opacity_theme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_icon_button_theme.freezed.dart';

@freezed
class EduIconButtonTheme with _$EduIconButtonTheme {
  const factory EduIconButtonTheme({
    required double iconSize,
    required ColorSchemeReference color,
    required OpacityThemeReference disabledOpacity,
    required EdgeInsets padding,
  }) = _EduIconButtonTheme;

  factory EduIconButtonTheme.lerp(EduIconButtonTheme before, EduIconButtonTheme after, double t) =>
      EduIconButtonTheme(
        iconSize: lerpDouble(before.iconSize, after.iconSize, t) ?? after.iconSize,
        color: t < 0.5 ? before.color : after.color,
        disabledOpacity: t < 0.5 ? before.disabledOpacity : after.disabledOpacity,
        padding: EdgeInsets.lerp(before.padding, after.padding, t) ?? after.padding,
      );
}