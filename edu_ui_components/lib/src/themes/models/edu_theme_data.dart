import 'package:edu_ui_components/src/themes/models/referencable/referencable.dart';
import 'package:edu_ui_components/src/themes/models/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_theme_data.freezed.dart';

@freezed
class EduThemeData with _$EduThemeData {
  const factory EduThemeData({
    required Brightness brightness,

    /* Referencable - uses lerp */
    required EduColorScheme colorScheme,
    required EduGradientsTheme gradientsTheme,
    required EduOpacityTheme opacityTheme,
    required EduShadowsTheme shadowsTheme,
    required EduTextTheme textTheme,
    required EduTransitionsTheme transitionsTheme,

    /* Widgets - app */
    required CategoriesListTheme categoriesListTheme,

    /* Widgets - buttons */
    required EduBaseButtonTheme baseButtonTheme,
    required EduGradientButtonTheme gradientButtonTheme,
    required EduIconButtonTheme iconButtonTheme,
    required EduOutlinedButtonTheme outlinedButtonTheme,
    required EduTextButtonTheme textButtonTheme,

    /* Widgets - components */
    required AvatarRowTheme avatarRowTheme,
    required EduDividerTheme dividerTheme,
    required CrossFadeTheme crossFadeTheme,
    required LoadingShimmerTheme loadingShimmerTheme,

    /* Widgets - containers */
    required EduAppBarTheme appBarTheme,
    required EduBottomNavigationBarTheme bottomNavigationBarTheme,
    required EduCardTheme cardTheme,
    required EduScaffoldTheme scaffoldTheme,
    required EduTabBarTheme tabBarTheme,
    required WaveAppBarTheme waveAppBarTheme,

    /* Widgets - images */
    required AvatarWithPlaceholderTheme avatarWithPlaceholderTheme,
    required EduImageTheme imageTheme,

    /* Widgets - indicators */
    required LoadingIndicatorTheme loadingIndicatorTheme,
    required EduProgressIndicatorTheme progressIndicatorTheme,
    required StepsIndicatorTheme stepsIndicatorTheme,

    /* Widgets - inputs */
    required CodeInputTheme codeInputTheme,
    required TextInputTheme textInputTheme,
    required TextInputValidationPrefixTheme textInputValidationPrefixTheme,

    /* Widgets - list items */
    required BaseListItemTheme baseListItemTheme,
  }) = _EduThemeData;

  factory EduThemeData.lerp(EduThemeData before, EduThemeData after, double t) =>
      EduThemeData(
        brightness: t < 0.5 ? before.brightness : after.brightness,

        /* Referencable */
        colorScheme: EduColorScheme.lerp(before.colorScheme, after.colorScheme, t),
        gradientsTheme: EduGradientsTheme.lerp(before.gradientsTheme, after.gradientsTheme, t),
        opacityTheme: EduOpacityTheme.lerp(before.opacityTheme, after.opacityTheme, t),
        shadowsTheme: EduShadowsTheme.lerp(before.shadowsTheme, after.shadowsTheme, t),
        textTheme: EduTextTheme.lerp(before.textTheme, after.textTheme, t),
        transitionsTheme: EduTransitionsTheme.lerp(before.transitionsTheme, after.transitionsTheme, t),

        /* Widgets - buttons */
        categoriesListTheme: CategoriesListTheme.lerp(before.categoriesListTheme, after.categoriesListTheme, t),

        /* Widgets - buttons */
        baseButtonTheme: EduBaseButtonTheme.lerp(before.baseButtonTheme, after.baseButtonTheme, t),
        gradientButtonTheme: EduGradientButtonTheme.lerp(before.gradientButtonTheme, after.gradientButtonTheme, t),
        iconButtonTheme: EduIconButtonTheme.lerp(before.iconButtonTheme, after.iconButtonTheme, t),
        outlinedButtonTheme: EduOutlinedButtonTheme.lerp(before.outlinedButtonTheme, after.outlinedButtonTheme, t),
        textButtonTheme: EduTextButtonTheme.lerp(before.textButtonTheme, after.textButtonTheme, t),

        /* Widgets - components */
        avatarRowTheme: AvatarRowTheme.lerp(before.avatarRowTheme, after.avatarRowTheme, t),
        dividerTheme: EduDividerTheme.lerp(before.dividerTheme, after.dividerTheme, t),
        crossFadeTheme: CrossFadeTheme.lerp(before.crossFadeTheme, after.crossFadeTheme, t),
        loadingShimmerTheme: LoadingShimmerTheme.lerp(before.loadingShimmerTheme, after.loadingShimmerTheme, t),

        /* Widgets - containers */
        appBarTheme: EduAppBarTheme.lerp(before.appBarTheme, after.appBarTheme, t),
        bottomNavigationBarTheme: EduBottomNavigationBarTheme.lerp(before.bottomNavigationBarTheme, after.bottomNavigationBarTheme, t),
        cardTheme: EduCardTheme.lerp(before.cardTheme, after.cardTheme, t),
        scaffoldTheme: EduScaffoldTheme.lerp(before.scaffoldTheme, after.scaffoldTheme, t),
        tabBarTheme: EduTabBarTheme.lerp(before.tabBarTheme, after.tabBarTheme, t),
        waveAppBarTheme: WaveAppBarTheme.lerp(before.waveAppBarTheme, after.waveAppBarTheme, t),

        /* Widgets - images */
        avatarWithPlaceholderTheme: AvatarWithPlaceholderTheme.lerp(before.avatarWithPlaceholderTheme, after.avatarWithPlaceholderTheme, t),
        imageTheme: EduImageTheme.lerp(before.imageTheme, after.imageTheme, t),

        /* Widgets - indicators */
        loadingIndicatorTheme: LoadingIndicatorTheme.lerp(before.loadingIndicatorTheme, after.loadingIndicatorTheme, t),
        progressIndicatorTheme: EduProgressIndicatorTheme.lerp(before.progressIndicatorTheme, after.progressIndicatorTheme, t),
        stepsIndicatorTheme: StepsIndicatorTheme.lerp(before.stepsIndicatorTheme, after.stepsIndicatorTheme, t),

        /* Widgets - inputs */
        codeInputTheme: CodeInputTheme.lerp(before.codeInputTheme, after.codeInputTheme, t),
        textInputTheme: TextInputTheme.lerp(before.textInputTheme, after.textInputTheme, t),
        textInputValidationPrefixTheme: TextInputValidationPrefixTheme.lerp(before.textInputValidationPrefixTheme, after.textInputValidationPrefixTheme, t),

        /* Widgets - list items */
        baseListItemTheme: BaseListItemTheme.lerp(before.baseListItemTheme, after.baseListItemTheme, t),
      );

  static Brightness estimateBrightnessForColor(Color color) {
    final relativeLuminance = color.computeLuminance();
    return (relativeLuminance + 0.05) * (relativeLuminance + 0.05) > 0.15
        ? Brightness.light
        : Brightness.dark;
  }
}