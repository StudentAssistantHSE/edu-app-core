import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_divider_theme.freezed.dart';

@freezed
class EduDividerTheme with _$EduDividerTheme {
  const factory EduDividerTheme({
    required double height,
    required ColorSchemeReference color,
  }) = _EduDividerTheme;

  factory EduDividerTheme.lerp(EduDividerTheme before, EduDividerTheme after, double t) =>
      EduDividerTheme(
        height: lerpDouble(before.height, after.height, t) ?? after.height,
        color: t < 0.5 ? before.color : after.color,
      );
}