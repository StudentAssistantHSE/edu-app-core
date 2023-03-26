import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_card_theme.freezed.dart';

@freezed
class EduCardTheme with _$EduCardTheme {
  const factory EduCardTheme({
    required ColorSchemeReference backgroundColor,
    required double borderRadius,
    required ColorSchemeReference borderColor,
  }) = _EduCardTheme;

  factory EduCardTheme.lerp(EduCardTheme before, EduCardTheme after, double t) =>
      EduCardTheme(
        backgroundColor: t < 0.5 ? before.backgroundColor : after.backgroundColor,
        borderRadius: lerpDouble(before.borderRadius, after.borderRadius, t) ?? after.borderRadius,
        borderColor: t < 0.5 ? before.borderColor : after.borderColor,
      );
}