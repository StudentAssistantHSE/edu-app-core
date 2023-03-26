import 'dart:ui';

import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_with_placeholder_theme.freezed.dart';

@freezed
class AvatarWithPlaceholderTheme with _$AvatarWithPlaceholderTheme {
  const factory AvatarWithPlaceholderTheme({
    required double radius,
    required double minRadius,
    required double maxRadius,
    required TransitionsThemeReference fadeInTransition,
    required List<Pair<ColorSchemeReference, ColorSchemeReference>> colors,
    required ColorSchemeReference backgroundColor,
    required TextThemeReference letterStyle,
  }) = _AvatarWithPlaceholderTheme;

  factory AvatarWithPlaceholderTheme.lerp(AvatarWithPlaceholderTheme before, AvatarWithPlaceholderTheme after, double t) =>
      AvatarWithPlaceholderTheme(
        radius: lerpDouble(before.radius, after.radius, t) ?? after.radius,
        minRadius: lerpDouble(before.minRadius, after.minRadius, t) ?? after.minRadius,
        maxRadius: lerpDouble(before.maxRadius, after.maxRadius, t) ?? after.maxRadius,
        fadeInTransition: t < 0.5 ? before.fadeInTransition : after.fadeInTransition,
        colors: _lerpColors(before.colors, after.colors, t),
        backgroundColor: t < 0.5 ? before.backgroundColor : after.backgroundColor,
        letterStyle: t < 0.5 ? before.letterStyle : after.letterStyle,
      );

  static List<Pair<ColorSchemeReference, ColorSchemeReference>> _lerpColors(
    List<Pair<ColorSchemeReference, ColorSchemeReference>> before,
    List<Pair<ColorSchemeReference, ColorSchemeReference>> after,
    double t,
  ) => [
    for (var i = 0; i < after.length; i++)
      i < before.length
        ? (t < 0.5 ? before[i] : after[i])
        : after[i],
  ];
}