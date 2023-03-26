import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_gradients_theme.freezed.dart';

@freezed
class EduGradientsTheme with _$EduGradientsTheme {
  const factory EduGradientsTheme({
    required Gradient primary,
  }) = _EduGradientsTheme;

  factory EduGradientsTheme.lerp(EduGradientsTheme before, EduGradientsTheme after, double t) =>
      EduGradientsTheme(
        primary: Gradient.lerp(before.primary, after.primary, t) ?? after.primary,
      );
}

enum GradientsThemeReference {
  primary,
}

extension GradientsThemeReferenceResolver on GradientsThemeReference {
  Gradient resolveGradientsTheme(EduGradientsTheme gradientsTheme) {
    switch (this) {
      case GradientsThemeReference.primary:
        return gradientsTheme.primary;
    }
  }
}