import 'dart:ui';

import 'package:edu_ui_components/edu_ui_components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_progress_indicator_theme.freezed.dart';

@freezed
class EduProgressIndicatorTheme with _$EduProgressIndicatorTheme {
  const factory EduProgressIndicatorTheme({
    required ColorSchemeReference color,
    required double width,
  }) = _EduProgressIndicatorTheme;

  factory EduProgressIndicatorTheme.lerp(EduProgressIndicatorTheme before, EduProgressIndicatorTheme after, double t) =>
      EduProgressIndicatorTheme(
        color: t < 0.5 ? before.color : after.color,
        width: lerpDouble(before.width, after.width, t) ?? after.width,
      );
}