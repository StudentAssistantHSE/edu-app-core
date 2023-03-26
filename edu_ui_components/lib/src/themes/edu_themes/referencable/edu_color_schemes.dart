import 'package:edu_ui_components/src/themes/edu_palette.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';

abstract class EduColorSchemes {
  static const light = EduColorScheme(
    themeMain: EduPalette.white,
    themeInverse: EduPalette.black,
    transparent: EduPalette.transparent,
    overlayShadow: EduPalette.black72,

    primary50: EduPalette.blue50,
    primary100: EduPalette.blue100,
    primary200: EduPalette.blue200,
    primary300: EduPalette.blue300,
    primary400: EduPalette.blue400,
    primary500: EduPalette.blue500,
    primary600: EduPalette.blue600,
    primary700: EduPalette.blue700,
    primary800: EduPalette.blue800,
    primary900: EduPalette.blue900,

    secondary50: EduPalette.ocher50,
    secondary100: EduPalette.ocher100,
    secondary200: EduPalette.ocher200,
    secondary300: EduPalette.ocher300,
    secondary400: EduPalette.ocher400,
    secondary500: EduPalette.ocher500,
    secondary600: EduPalette.ocher600,
    secondary700: EduPalette.ocher700,
    secondary800: EduPalette.ocher800,
    secondary900: EduPalette.ocher900,

    tertiary50: EduPalette.beige50,
    tertiary100: EduPalette.beige100,
    tertiary200: EduPalette.beige200,
    tertiary300: EduPalette.beige300,
    tertiary400: EduPalette.beige400,
    tertiary500: EduPalette.beige500,
    tertiary600: EduPalette.beige600,
    tertiary700: EduPalette.beige700,
    tertiary800: EduPalette.beige800,
    tertiary900: EduPalette.beige900,

    neutral50: EduPalette.grey50,
    neutral100: EduPalette.grey100,
    neutral200: EduPalette.grey200,
    neutral300: EduPalette.grey300,
    neutral400: EduPalette.grey400,
    neutral500: EduPalette.grey500,
    neutral600: EduPalette.grey600,
    neutral700: EduPalette.grey700,
    neutral800: EduPalette.grey800,
    neutral900: EduPalette.grey900,

    success50: EduPalette.green50,
    success100: EduPalette.green100,
    success200: EduPalette.green200,
    success300: EduPalette.green300,
    success400: EduPalette.green400,
    success500: EduPalette.green500,
    success600: EduPalette.green600,
    success700: EduPalette.green700,
    success800: EduPalette.green800,
    success900: EduPalette.green900,

    error50: EduPalette.red50,
    error100: EduPalette.red100,
    error200: EduPalette.red200,
    error300: EduPalette.red300,
    error400: EduPalette.red400,
    error500: EduPalette.red500,
    error600: EduPalette.red600,
    error700: EduPalette.red700,
    error800: EduPalette.red800,
    error900: EduPalette.red900,
  );

  const EduColorSchemes._();
}