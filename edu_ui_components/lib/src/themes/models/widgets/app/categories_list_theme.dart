import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_list_theme.freezed.dart';

@freezed
class CategoriesListTheme with _$CategoriesListTheme {
  const factory CategoriesListTheme({
    required ColorSchemeReference backgroundColor,
    required TextThemeReference labelStyle,
    required ColorSchemeReference foregroundColor,
    required double spacing,
  }) = _CategoriesListTheme;

  factory CategoriesListTheme.lerp(CategoriesListTheme before, CategoriesListTheme after, double t) =>
      CategoriesListTheme(
        backgroundColor: t < 0.5 ? before.backgroundColor : after.backgroundColor,
        labelStyle: t < 0.5 ? before.labelStyle : after.labelStyle,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        spacing: lerpDouble(before.spacing, after.spacing, t) ?? after.spacing,
      );
}