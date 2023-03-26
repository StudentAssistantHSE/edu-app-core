import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_row_theme.freezed.dart';

@freezed
class AvatarRowTheme with _$AvatarRowTheme {
  const factory AvatarRowTheme({
    required double avatarRadius,
    required double spacer,
    required TextThemeReference textStyle,
    required ColorSchemeReference foregroundColor,
  }) = _AvatarRowTheme;

  factory AvatarRowTheme.lerp(AvatarRowTheme before, AvatarRowTheme after, double t) =>
      AvatarRowTheme(
        avatarRadius: lerpDouble(before.avatarRadius, after.avatarRadius, t) ?? after.avatarRadius,
        spacer: lerpDouble(before.spacer, after.spacer, t) ?? after.spacer,
        textStyle: t < 0.5 ? before.textStyle : after.textStyle,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
      );
}