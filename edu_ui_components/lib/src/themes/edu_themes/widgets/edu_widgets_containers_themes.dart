import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

abstract class EduWidgetsContainersThemes {
  static const appBarTheme = EduAppBarTheme(
    toolbarHeight: 56.0,
    iconSize: 24.0,
    backgroundColor: ColorSchemeReference.themeMain,
    foregroundColor: ColorSchemeReference.primary500,
    titleTextStyle: TextThemeReference.title,
    toolbarTextStyle: TextThemeReference.body,
  );

  static const bottomNavigationBarTheme = EduBottomNavigationBarTheme(
    height: 60.0,
    shadow: ShadowsThemeReference.upShadow,
    backgroundColor: ColorSchemeReference.themeMain,
    activeBackgroundColor: ColorSchemeReference.primary50,
    iconSize: 24.0,
    labelStyle: TextThemeReference.caption,
    foregroundColor: ColorSchemeReference.neutral200,
    activeForegroundColor: ColorSchemeReference.primary500,
    indicatorColor: ColorSchemeReference.primary500,
    indicatorHeight: 2.0,
  );

  static const cardTheme = EduCardTheme(
    backgroundColor: ColorSchemeReference.themeMain,
    borderRadius: 4.0,
    borderColor: ColorSchemeReference.neutral100,
  );

  static const scaffoldTheme = EduScaffoldTheme(
    backgroundColor: ColorSchemeReference.themeMain,
  );

  static const tabBarTheme = EduTabBarTheme(
    indicatorColor: ColorSchemeReference.primary500,
    labelStyle: TextThemeReference.body,
    foregroundColor: ColorSchemeReference.neutral200,
    activeForegroundColor: ColorSchemeReference.primary500,
    labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
  );

  static const waveAppBarTheme = WaveAppBarTheme(
    keyboardCollapsedSize: 0.36,
    keyboardOpenedHeight: 152,
    logoSize: 0.24,
    gradient: GradientsThemeReference.primary,
    keyboardCollapsedTransition: TransitionsThemeReference.standardAccelerate,
    keyboardOpenedTransition: TransitionsThemeReference.standardDecelerate,
  );

  const EduWidgetsContainersThemes._();
}