import 'package:flutter/material.dart';

abstract class EduColors {
  static const white = Colors.white;

  static const success = Color(0xFF6EAE40);

  static const blue = MaterialColor(
    _bluePrimary,
    _blueSwatch,
  );

  static const ocher = MaterialColor(
    _ocherPrimary,
    _ocherSwatch,
  );

  static const beige = MaterialColor(
    _beigePrimary,
    _beigeSwatch,
  );

  static const error = MaterialColor(
    _errorPrimary,
    _errorSwatch,
  );

  static const neutral = MaterialColor(
    _neutralPrimary,
    _neutralSwatch,
  );

  static const _bluePrimary = 0xFF084A98;
  static const _blueSwatch = {
    50: Color(0xFFF3F6FA),
    100: Color(0xFFCEDBEA),
    200: Color(0xFF9CB7D6),
    300: Color(0xFF6B92C1),
    400: Color(0xFF396EAD),
    500: Color(_bluePrimary),
    600: Color(0xFF063B7A),
    700: Color(0xFF052C5B),
    800: Color(0xFF031E3D),
    900: Color(0xFF020F1E),
  };

  static const _ocherPrimary = 0xFFDDB380;
  static const _ocherSwatch = {
    50: Color(0xFFFDFBF9),
    100: Color(0xFFF8F0E6),
    200: Color(0xFFF1E1CC),
    300: Color(0xFFEBD1B3),
    400: Color(0xFFE4C299),
    500: Color(_ocherPrimary),
    600: Color(0xFFB18F66),
    700: Color(0xFF856B4D),
    800: Color(0xFF584833),
    900: Color(0xFF2C241A),
  };

  static const _beigePrimary = 0xFFD9B1A9;
  static const _beigeSwatch = {
    50: Color(0xFFFDFCFC),
    100: Color(0xFFF7EFEE),
    200: Color(0xFFF0E0DD),
    300: Color(0xFFE8D0CB),
    400: Color(0xFFE1C1BA),
    500: Color(_beigePrimary),
    600: Color(0xFFAE8E87),
    700: Color(0xFF826A65),
    800: Color(0xFF574744),
    900: Color(0xFF2B2322),
  };

  static const _errorPrimary = 0xFFE3190D;
  static const _errorSwatch = {
    50: Color(0xFFFEF3F3),
    100: Color(0xFFF9D1CF),
    200: Color(0xFFF4A39E),
    300: Color(0xFFEE756E),
    400: Color(0xFFE9473E),
    500: Color(_errorPrimary),
    600: Color(0xFFB6140B),
    700: Color(0xFF880F08),
    800: Color(0xFF5B0A05),
    900: Color(0xFF2D0503),
  };

  static const _neutralPrimary = 0xFF605D62;
  static const _neutralSwatch = {
    50: Color(0xFFF2F2F2),
    100: Color(0xFFDFDFE0),
    200: Color(0xFFBFBEC0),
    300: Color(0xFFA09EA1),
    400: Color(0xFF807D81),
    500: Color(_neutralPrimary),
    600: Color(0xFF4D4A4E),
    700: Color(0xFF3A383B),
    800: Color(0xFF262527),
    900: Color(0xFF131314),
  };

  const EduColors._();
}