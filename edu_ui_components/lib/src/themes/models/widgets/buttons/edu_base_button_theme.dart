import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_base_button_theme.freezed.dart';

@freezed
class EduBaseButtonTheme with _$EduBaseButtonTheme {
  const factory EduBaseButtonTheme({
    required double minimumSize,
    required EdgeInsets padding,
    required double borderRadius,
    required TransitionsThemeReference disableTransition,
    required TransitionsThemeReference enableTransition,
  }) = _EduBaseButtonTheme;

  factory EduBaseButtonTheme.lerp(EduBaseButtonTheme before, EduBaseButtonTheme after, double t) =>
      EduBaseButtonTheme(
        minimumSize: lerpDouble(before.minimumSize, after.minimumSize, t) ?? after.minimumSize,
        padding: EdgeInsets.lerp(before.padding, after.padding, t) ?? after.padding,
        borderRadius: lerpDouble(before.borderRadius, after.borderRadius, t) ?? after.borderRadius,
        disableTransition: t < 0.5 ? before.disableTransition : after.disableTransition,
        enableTransition: t < 0.5 ? before.enableTransition : after.enableTransition,
      );
}