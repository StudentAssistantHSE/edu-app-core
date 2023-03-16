// ignore_for_file: avoid_redundant_argument_values

import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/themes/edu_colors.dart';
import 'package:edu_ui_components/src/themes/edu_state_properties.dart';
import 'package:edu_ui_components/src/themes/edu_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class EduThemes {
  static final light = ThemeData(
    fontFamily: EduTextStyles.fontFamily,
    brightness: Brightness.light,
    useMaterial3: true,

    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,

    scaffoldBackgroundColor: EduColors.white,
    dividerTheme: DividerThemeData(
      color: EduColors.neutral.shade100,
      space: 0,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: EduColors.blue,
      onPrimary: EduColors.white,
      primaryContainer: EduColors.blue.shade100,
      onPrimaryContainer: EduColors.blue.shade800,

      secondary: EduColors.ocher,
      onSecondary: EduColors.white,
      secondaryContainer: EduColors.ocher.shade100,
      onSecondaryContainer: EduColors.ocher.shade800,

      tertiary: EduColors.beige,
      onTertiary: EduColors.white,
      tertiaryContainer: EduColors.beige.shade200,
      onTertiaryContainer: EduColors.beige.shade800,

      error: EduColors.error,
      onError: EduColors.white,
      errorContainer: EduColors.error.shade100,
      onErrorContainer: EduColors.error.shade800,

      background: EduColors.white,
      onBackground: EduColors.neutral.shade900,

      surface: EduColors.white,
      onSurface: EduColors.neutral,

      surfaceVariant: EduColors.neutral.shade100,
      onSurfaceVariant: EduColors.neutral.shade600,

      outline: EduColors.neutral.shade400,
    ),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: EduColors.white,
      foregroundColor: EduColors.blue,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      toolbarHeight: 56,
    ),

    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: EduColors.blue,
            width: 2.0,
          ),
        ),
      ),
    ),

    iconTheme: const IconThemeData(
      color: EduColors.blue,
    ),

    textTheme: TextTheme(
      displayLarge: EduTextStyles.displayLarge.copyWith(color: EduColors.neutral),
      displayMedium: EduTextStyles.displayMedium.copyWith(color: EduColors.neutral),
      displaySmall: EduTextStyles.displaySmall.copyWith(color: EduColors.neutral),

      headlineLarge: EduTextStyles.headlineLarge.copyWith(color: EduColors.neutral),
      headlineMedium: EduTextStyles.headlineMedium.copyWith(color: EduColors.neutral),
      headlineSmall: EduTextStyles.headlineSmall.copyWith(color: EduColors.neutral),

      titleLarge: EduTextStyles.titleLarge.copyWith(color: EduColors.neutral),
      titleMedium: EduTextStyles.titleMedium.copyWith(color: EduColors.neutral),
      titleSmall: EduTextStyles.titleSmall.copyWith(color: EduColors.neutral),

      labelLarge: EduTextStyles.labelLarge.copyWith(color: EduColors.neutral),
      labelMedium: EduTextStyles.labelMedium.copyWith(color: EduColors.neutral),
      labelSmall: EduTextStyles.labelSmall.copyWith(color: EduColors.neutral),

      bodyLarge: EduTextStyles.bodyLarge.copyWith(color: EduColors.neutral),
      bodyMedium: EduTextStyles.bodyMedium.copyWith(color: EduColors.neutral),
      bodySmall: EduTextStyles.bodySmall.copyWith(color: EduColors.neutral.shade300),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(EduTextStyles.bodyMedium),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        backgroundColor: EduStateProperties.simpleStateColor(EduColors.blue),
        foregroundColor: EduStateProperties.simpleStateColor(EduColors.white),
        elevation: MaterialStateProperty.all<double>(0),
        minimumSize: MaterialStateProperty.all<Size>(const Size.square(44.0)),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        )),
        shape: MaterialStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        )),
        animationDuration: Duration.zero,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: EduStateProperties.simpleStateColor(
          EduColors.neutral.shade300,
          disabledColor: EduColors.neutral.shade100,
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(EduTextStyles.bodyMedium),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        )),
        minimumSize: MaterialStateProperty.all<Size>(const Size.square(44.0)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      hintStyle: EduStateProperties.inputHintStyle(EduColors.neutral.shade600, EduColors.neutral.shade200),
      filled: true,
      fillColor: EduColors.neutral.shade50,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        borderSide: BorderSide(color: EduColors.blue),
      ),
      suffixIconColor: EduStateProperties.inputForegroundColor(EduColors.blue, EduColors.neutral.shade200),
      prefixIconColor: EduStateProperties.inputForegroundColor(EduColors.blue, EduColors.neutral.shade200),
    ),

    snackBarTheme: SnackBarThemeData(
      contentTextStyle: EduTextStyles.bodyMedium,
    ),

    dialogTheme: DialogTheme(
      backgroundColor: EduColors.white,
      titleTextStyle: EduTextStyles.titleMedium.copyWith(
        color: EduColors.blue,
      ),
      contentTextStyle: EduTextStyles.bodyMedium.copyWith(
        color: EduColors.blue,
      ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
    ),
  );

  static final dark = light.copyWith(
    brightness: Brightness.dark,
  );

  static final blue = light.copyWith(
    brightness: Brightness.dark,
  );

  const EduThemes._();
}

extension ThemeDataX on ThemeData {
  MaterialColor get primarySwatch => colorScheme.primary as MaterialColor;
  MaterialColor get secondarySwatch => colorScheme.secondary as MaterialColor;
  MaterialColor get tertiarySwatch => colorScheme.tertiary as MaterialColor;
  MaterialColor get errorSwatch => colorScheme.error as MaterialColor;
  MaterialColor get onSurfaceSwatch => colorScheme.onSurface as MaterialColor;
}

extension ColorSchemeX on ColorScheme {
  MaterialColor get primarySwatch => primary as MaterialColor;
  MaterialColor get secondarySwatch => secondary as MaterialColor;
  MaterialColor get tertiarySwatch => tertiary as MaterialColor;
  MaterialColor get errorSwatch => error as MaterialColor;
  MaterialColor get onSurfaceSwatch => onSurface as MaterialColor;
}

extension ThemeTypeUIConverter on ThemeType {
  ThemeData get _platformFallback {
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    if (brightness == Brightness.dark) {
      return EduThemes.dark;
    }
    return EduThemes.light;
  }

  ThemeData get themeData {
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