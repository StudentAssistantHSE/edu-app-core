import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/widgets.dart';

abstract class EduWidgetsButtonsThemes {
  static const baseButtonTheme = EduBaseButtonTheme(
    minimumSize: 44.0,
    padding: EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 12.0,
    ),
    borderRadius: 4.0,
    disableTransition: TransitionsThemeReference.standardAccelerate,
    enableTransition: TransitionsThemeReference.standardDecelerate,
  );

  static const gradientButtonTheme = EduGradientButtonTheme(
    gradient: GradientsThemeReference.primary,
    foregroundColor: ColorSchemeReference.themeMain,
    textStyle: TextThemeReference.body,
    disabledOpacity: OpacityThemeReference.disabled,
  );

  static const iconButtonTheme = EduIconButtonTheme(
    iconSize: 24.0,
    color: ColorSchemeReference.primary500,
    disabledOpacity: OpacityThemeReference.disabled,
    padding: EdgeInsets.all(8),
  );

  static const outlinedButtonTheme = EduOutlinedButtonTheme(
    outlineColor: ColorSchemeReference.primary500,
    textStyle: TextThemeReference.body,
    disabledOpacity: OpacityThemeReference.disabled,
    borderWidth: 1.0,
  );

  static const textButtonTheme = EduTextButtonTheme(
    foregroundColor: ColorSchemeReference.neutral300,
    disabledForegroundColor: ColorSchemeReference.neutral100,
    textStyle: TextThemeReference.body,
  );

  const EduWidgetsButtonsThemes._();
}