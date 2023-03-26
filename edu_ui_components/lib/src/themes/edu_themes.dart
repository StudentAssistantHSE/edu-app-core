import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/themes/edu_themes/edu_themes.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class EduThemes {
  static const light = EduThemeData(
    brightness: Brightness.light,

    /* Referencable */
    colorScheme: EduColorSchemes.light,
    gradientsTheme: EduGradientsThemes.light,
    opacityTheme: EduOpacityThemes.universal,
    shadowsTheme: EduShadowsThemes.light,
    textTheme: EduTextThemes.light,
    transitionsTheme: EduTransitionsThemes.universal,

    /* Widgets - app */
    categoriesListTheme: EduWidgetsAppThemes.categoriesListTheme,

    /* Widgets - buttons */
    baseButtonTheme: EduWidgetsButtonsThemes.baseButtonTheme,
    gradientButtonTheme: EduWidgetsButtonsThemes.gradientButtonTheme,
    iconButtonTheme: EduWidgetsButtonsThemes.iconButtonTheme,
    outlinedButtonTheme: EduWidgetsButtonsThemes.outlinedButtonTheme,
    textButtonTheme: EduWidgetsButtonsThemes.textButtonTheme,

    /* Widgets - components */
    avatarRowTheme: EduWidgetsComponentsThemes.avatarRowTheme,
    dividerTheme: EduWidgetsComponentsThemes.dividerTheme,
    crossFadeTheme: EduWidgetsComponentsThemes.crossFadeTheme,
    loadingShimmerTheme: EduWidgetsComponentsThemes.loadingShimmerTheme,

    /* Widgets - containers */
    appBarTheme: EduWidgetsContainersThemes.appBarTheme,
    bottomNavigationBarTheme: EduWidgetsContainersThemes.bottomNavigationBarTheme,
    cardTheme: EduWidgetsContainersThemes.cardTheme,
    scaffoldTheme: EduWidgetsContainersThemes.scaffoldTheme,
    tabBarTheme: EduWidgetsContainersThemes.tabBarTheme,
    waveAppBarTheme: EduWidgetsContainersThemes.waveAppBarTheme,

    /* Widgets - images */
    avatarWithPlaceholderTheme: EduWidgetsImagesThemes.avatarWithPlaceholderTheme,
    imageTheme: EduWidgetsImagesThemes.imageTheme,

    /* Widgets - indicators */
    loadingIndicatorTheme: EduWidgetsIndicatorsThemes.loadingIndicatorTheme,
    progressIndicatorTheme: EduWidgetsIndicatorsThemes.progressIndicatorTheme,
    stepsIndicatorTheme: EduWidgetsIndicatorsThemes.stepsIndicatorTheme,

    /* Widgets - inputs */
    codeInputTheme: EduWidgetsInputsThemes.codeInputTheme,
    textInputTheme: EduWidgetsInputsThemes.textInputTheme,
    textInputValidationPrefixTheme: EduWidgetsInputsThemes.textInputValidationPrefixTheme,

    /* Widgets - list items */
    baseListItemTheme: EduWidgetsListItemsThemes.baseListItemTheme,
  );

  static final dark = light.copyWith(brightness: Brightness.light);

  static final blue = light.copyWith(brightness: Brightness.light);

  const EduThemes._();
}

extension ThemeTypeUIConverter on ThemeType {
  EduThemeData get _platformFallback {
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    if (brightness == Brightness.dark) {
      return EduThemes.dark;
    }
    return EduThemes.light;
  }

  EduThemeData get themeData {
    switch (this) {
      case ThemeType.platform:
        return _platformFallback;
      case ThemeType.light:
        return EduThemes.light;
      case ThemeType.dark:
        return EduThemes.dark;
      case ThemeType.blue:
        return EduThemes.blue;
    }
  }
}