import 'package:edu_ui_components/assets/assets.dart';
import 'package:edu_ui_components/src/themes/edu_palette.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

abstract class EduTextThemes {
  static const light = EduTextTheme(
    headline: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: 40.0 / 32.0,
      fontFamily: _fontFamily,
      package: Assets.packageName,
      color: EduPalette.blue500,
    ),
    pageTitle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24.0 / 16.0,
      letterSpacing: 16 * 0.0015,
      fontFamily: _fontFamily,
      package: Assets.packageName,
      color: EduPalette.blue500,
    ),
    title: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 24.0 / 16.0,
      letterSpacing: 16 * 0.0015,
      fontFamily: _fontFamily,
      package: Assets.packageName,
      color: EduPalette.grey500,
    ),
    body: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 20.0 / 14.0,
      letterSpacing: 14 * 0.0025,
      fontFamily: _fontFamily,
      package: Assets.packageName,
      color: EduPalette.grey500,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 16.0 / 12.0,
      letterSpacing: 12 * 0.004,
      fontFamily: _fontFamily,
      package: Assets.packageName,
      color: EduPalette.grey300,
    ),
  );

  static const _fontFamily = 'Rubik';

  const EduTextThemes._();
}