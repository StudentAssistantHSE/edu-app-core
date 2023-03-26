import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_color_scheme.freezed.dart';

@freezed
class EduColorScheme with _$EduColorScheme {
  const factory EduColorScheme({
    required Color themeMain,
    required Color themeInverse,
    required Color transparent,
    required Color overlayShadow,

    required Color primary50,
    required Color primary100,
    required Color primary200,
    required Color primary300,
    required Color primary400,
    required Color primary500,
    required Color primary600,
    required Color primary700,
    required Color primary800,
    required Color primary900,

    required Color secondary50,
    required Color secondary100,
    required Color secondary200,
    required Color secondary300,
    required Color secondary400,
    required Color secondary500,
    required Color secondary600,
    required Color secondary700,
    required Color secondary800,
    required Color secondary900,

    required Color tertiary50,
    required Color tertiary100,
    required Color tertiary200,
    required Color tertiary300,
    required Color tertiary400,
    required Color tertiary500,
    required Color tertiary600,
    required Color tertiary700,
    required Color tertiary800,
    required Color tertiary900,

    required Color neutral50,
    required Color neutral100,
    required Color neutral200,
    required Color neutral300,
    required Color neutral400,
    required Color neutral500,
    required Color neutral600,
    required Color neutral700,
    required Color neutral800,
    required Color neutral900,

    required Color success50,
    required Color success100,
    required Color success200,
    required Color success300,
    required Color success400,
    required Color success500,
    required Color success600,
    required Color success700,
    required Color success800,
    required Color success900,

    required Color error50,
    required Color error100,
    required Color error200,
    required Color error300,
    required Color error400,
    required Color error500,
    required Color error600,
    required Color error700,
    required Color error800,
    required Color error900,
  }) = _EduColorScheme;

  factory EduColorScheme.lerp(EduColorScheme before, EduColorScheme after, double t) =>
      EduColorScheme(
        themeMain: Color.lerp(before.themeMain, after.themeMain, t) ?? after.themeMain,
        themeInverse: Color.lerp(before.themeInverse, after.themeInverse, t) ?? after.themeInverse,
        transparent: Color.lerp(before.transparent, after.transparent, t) ?? after.transparent,
        overlayShadow: Color.lerp(before.overlayShadow, after.overlayShadow, t) ?? after.overlayShadow,

        primary50: Color.lerp(before.primary50, after.primary50, t) ?? after.primary50,
        primary100: Color.lerp(before.primary100, after.primary100, t) ?? after.primary100,
        primary200: Color.lerp(before.primary200, after.primary200, t) ?? after.primary200,
        primary300: Color.lerp(before.primary300, after.primary300, t) ?? after.primary300,
        primary400: Color.lerp(before.primary400, after.primary400, t) ?? after.primary400,
        primary500: Color.lerp(before.primary500, after.primary500, t) ?? after.primary500,
        primary600: Color.lerp(before.primary600, after.primary600, t) ?? after.primary600,
        primary700: Color.lerp(before.primary700, after.primary700, t) ?? after.primary700,
        primary800: Color.lerp(before.primary800, after.primary800, t) ?? after.primary800,
        primary900: Color.lerp(before.primary900, after.primary900, t) ?? after.primary900,

        secondary50: Color.lerp(before.secondary50, after.secondary50, t) ?? after.secondary50,
        secondary100: Color.lerp(before.secondary100, after.secondary100, t) ?? after.secondary100,
        secondary200: Color.lerp(before.secondary200, after.secondary200, t) ?? after.secondary200,
        secondary300: Color.lerp(before.secondary300, after.secondary300, t) ?? after.secondary300,
        secondary400: Color.lerp(before.secondary400, after.secondary400, t) ?? after.secondary400,
        secondary500: Color.lerp(before.secondary500, after.secondary500, t) ?? after.secondary500,
        secondary600: Color.lerp(before.secondary600, after.secondary600, t) ?? after.secondary600,
        secondary700: Color.lerp(before.secondary700, after.secondary700, t) ?? after.secondary700,
        secondary800: Color.lerp(before.secondary800, after.secondary800, t) ?? after.secondary800,
        secondary900: Color.lerp(before.secondary900, after.secondary900, t) ?? after.secondary900,

        tertiary50: Color.lerp(before.tertiary50, after.tertiary50, t) ?? after.tertiary50,
        tertiary100: Color.lerp(before.tertiary100, after.tertiary100, t) ?? after.tertiary100,
        tertiary200: Color.lerp(before.tertiary200, after.tertiary200, t) ?? after.tertiary200,
        tertiary300: Color.lerp(before.tertiary300, after.tertiary300, t) ?? after.tertiary300,
        tertiary400: Color.lerp(before.tertiary400, after.tertiary400, t) ?? after.tertiary400,
        tertiary500: Color.lerp(before.tertiary500, after.tertiary500, t) ?? after.tertiary500,
        tertiary600: Color.lerp(before.tertiary600, after.tertiary600, t) ?? after.tertiary600,
        tertiary700: Color.lerp(before.tertiary700, after.tertiary700, t) ?? after.tertiary700,
        tertiary800: Color.lerp(before.tertiary800, after.tertiary800, t) ?? after.tertiary800,
        tertiary900: Color.lerp(before.tertiary900, after.tertiary900, t) ?? after.tertiary900,

        neutral50: Color.lerp(before.neutral50, after.neutral50, t) ?? after.neutral50,
        neutral100: Color.lerp(before.neutral100, after.neutral100, t) ?? after.neutral100,
        neutral200: Color.lerp(before.neutral200, after.neutral200, t) ?? after.neutral200,
        neutral300: Color.lerp(before.neutral300, after.neutral300, t) ?? after.neutral300,
        neutral400: Color.lerp(before.neutral400, after.neutral400, t) ?? after.neutral400,
        neutral500: Color.lerp(before.neutral500, after.neutral500, t) ?? after.neutral500,
        neutral600: Color.lerp(before.neutral600, after.neutral600, t) ?? after.neutral600,
        neutral700: Color.lerp(before.neutral700, after.neutral700, t) ?? after.neutral700,
        neutral800: Color.lerp(before.neutral800, after.neutral800, t) ?? after.neutral800,
        neutral900: Color.lerp(before.neutral900, after.neutral900, t) ?? after.neutral900,

        success50: Color.lerp(before.success50, after.success50, t) ?? after.success50,
        success100: Color.lerp(before.success100, after.success100, t) ?? after.success100,
        success200: Color.lerp(before.success200, after.success200, t) ?? after.success200,
        success300: Color.lerp(before.success300, after.success300, t) ?? after.success300,
        success400: Color.lerp(before.success400, after.success400, t) ?? after.success400,
        success500: Color.lerp(before.success500, after.success500, t) ?? after.success500,
        success600: Color.lerp(before.success600, after.success600, t) ?? after.success600,
        success700: Color.lerp(before.success700, after.success700, t) ?? after.success700,
        success800: Color.lerp(before.success800, after.success800, t) ?? after.success800,
        success900: Color.lerp(before.success900, after.success900, t) ?? after.success900,

        error50: Color.lerp(before.error50, after.error50, t) ?? after.error50,
        error100: Color.lerp(before.error100, after.error100, t) ?? after.error100,
        error200: Color.lerp(before.error200, after.error200, t) ?? after.error200,
        error300: Color.lerp(before.error300, after.error300, t) ?? after.error300,
        error400: Color.lerp(before.error400, after.error400, t) ?? after.error400,
        error500: Color.lerp(before.error500, after.error500, t) ?? after.error500,
        error600: Color.lerp(before.error600, after.error600, t) ?? after.error600,
        error700: Color.lerp(before.error700, after.error700, t) ?? after.error700,
        error800: Color.lerp(before.error800, after.error800, t) ?? after.error800,
        error900: Color.lerp(before.error900, after.error900, t) ?? after.error900,
      );
}

enum ColorSchemeReference {
  themeMain,
  themeInverse,
  transparent,
  overlayShadow,

  primary50,
  primary100,
  primary200,
  primary300,
  primary400,
  primary500,
  primary600,
  primary700,
  primary800,
  primary900,

  secondary50,
  secondary100,
  secondary200,
  secondary300,
  secondary400,
  secondary500,
  secondary600,
  secondary700,
  secondary800,
  secondary900,

  tertiary50,
  tertiary100,
  tertiary200,
  tertiary300,
  tertiary400,
  tertiary500,
  tertiary600,
  tertiary700,
  tertiary800,
  tertiary900,

  neutral50,
  neutral100,
  neutral200,
  neutral300,
  neutral400,
  neutral500,
  neutral600,
  neutral700,
  neutral800,
  neutral900,

  success50,
  success100,
  success200,
  success300,
  success400,
  success500,
  success600,
  success700,
  success800,
  success900,

  error50,
  error100,
  error200,
  error300,
  error400,
  error500,
  error600,
  error700,
  error800,
  error900,
}

extension ColorSchemeReferenceResolver on ColorSchemeReference {
  Color resolveColorScheme(EduColorScheme colorScheme) {
    switch (this) {
      case ColorSchemeReference.themeMain:
        return colorScheme.themeMain;
      case ColorSchemeReference.themeInverse:
        return colorScheme.themeInverse;
      case ColorSchemeReference.transparent:
        return colorScheme.transparent;
      case ColorSchemeReference.overlayShadow:
        return colorScheme.overlayShadow;

      case ColorSchemeReference.primary50:
        return colorScheme.primary50;
      case ColorSchemeReference.primary100:
        return colorScheme.primary100;
      case ColorSchemeReference.primary200:
        return colorScheme.primary200;
      case ColorSchemeReference.primary300:
        return colorScheme.primary300;
      case ColorSchemeReference.primary400:
        return colorScheme.primary400;
      case ColorSchemeReference.primary500:
        return colorScheme.primary500;
      case ColorSchemeReference.primary600:
        return colorScheme.primary600;
      case ColorSchemeReference.primary700:
        return colorScheme.primary700;
      case ColorSchemeReference.primary800:
        return colorScheme.primary800;
      case ColorSchemeReference.primary900:
        return colorScheme.primary900;

      case ColorSchemeReference.secondary50:
        return colorScheme.secondary50;
      case ColorSchemeReference.secondary100:
        return colorScheme.secondary100;
      case ColorSchemeReference.secondary200:
        return colorScheme.secondary200;
      case ColorSchemeReference.secondary300:
        return colorScheme.secondary300;
      case ColorSchemeReference.secondary400:
        return colorScheme.secondary400;
      case ColorSchemeReference.secondary500:
        return colorScheme.secondary500;
      case ColorSchemeReference.secondary600:
        return colorScheme.secondary600;
      case ColorSchemeReference.secondary700:
        return colorScheme.secondary700;
      case ColorSchemeReference.secondary800:
        return colorScheme.secondary800;
      case ColorSchemeReference.secondary900:
        return colorScheme.secondary900;

      case ColorSchemeReference.tertiary50:
        return colorScheme.tertiary50;
      case ColorSchemeReference.tertiary100:
        return colorScheme.tertiary100;
      case ColorSchemeReference.tertiary200:
        return colorScheme.tertiary200;
      case ColorSchemeReference.tertiary300:
        return colorScheme.tertiary300;
      case ColorSchemeReference.tertiary400:
        return colorScheme.tertiary400;
      case ColorSchemeReference.tertiary500:
        return colorScheme.tertiary500;
      case ColorSchemeReference.tertiary600:
        return colorScheme.tertiary600;
      case ColorSchemeReference.tertiary700:
        return colorScheme.tertiary700;
      case ColorSchemeReference.tertiary800:
        return colorScheme.tertiary800;
      case ColorSchemeReference.tertiary900:
        return colorScheme.tertiary900;

      case ColorSchemeReference.neutral50:
        return colorScheme.neutral50;
      case ColorSchemeReference.neutral100:
        return colorScheme.neutral100;
      case ColorSchemeReference.neutral200:
        return colorScheme.neutral200;
      case ColorSchemeReference.neutral300:
        return colorScheme.neutral300;
      case ColorSchemeReference.neutral400:
        return colorScheme.neutral400;
      case ColorSchemeReference.neutral500:
        return colorScheme.neutral500;
      case ColorSchemeReference.neutral600:
        return colorScheme.neutral600;
      case ColorSchemeReference.neutral700:
        return colorScheme.neutral700;
      case ColorSchemeReference.neutral800:
        return colorScheme.neutral800;
      case ColorSchemeReference.neutral900:
        return colorScheme.neutral900;

      case ColorSchemeReference.success50:
        return colorScheme.success50;
      case ColorSchemeReference.success100:
        return colorScheme.success100;
      case ColorSchemeReference.success200:
        return colorScheme.success200;
      case ColorSchemeReference.success300:
        return colorScheme.success300;
      case ColorSchemeReference.success400:
        return colorScheme.success400;
      case ColorSchemeReference.success500:
        return colorScheme.success500;
      case ColorSchemeReference.success600:
        return colorScheme.success600;
      case ColorSchemeReference.success700:
        return colorScheme.success700;
      case ColorSchemeReference.success800:
        return colorScheme.success800;
      case ColorSchemeReference.success900:
        return colorScheme.success900;

      case ColorSchemeReference.error50:
        return colorScheme.error50;
      case ColorSchemeReference.error100:
        return colorScheme.error100;
      case ColorSchemeReference.error200:
        return colorScheme.error200;
      case ColorSchemeReference.error300:
        return colorScheme.error300;
      case ColorSchemeReference.error400:
        return colorScheme.error400;
      case ColorSchemeReference.error500:
        return colorScheme.error500;
      case ColorSchemeReference.error600:
        return colorScheme.error600;
      case ColorSchemeReference.error700:
        return colorScheme.error700;
      case ColorSchemeReference.error800:
        return colorScheme.error800;
      case ColorSchemeReference.error900:
        return colorScheme.error900;
    }
  }
}