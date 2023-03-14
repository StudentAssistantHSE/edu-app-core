import 'package:edu_ui_components/assets/assets.dart';
import 'package:flutter/painting.dart';

abstract class EduTextStyles {
  static const fontFamily = 'Rubik';

  static const _baseTextStyle = TextStyle(
    fontFamily: fontFamily,
    package: Assets.packageName,
  );

  static final displayLarge = _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.normal,
    height: 64.0 / 57.0,
  );
  static final displayMedium = _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.normal,
    height: 52.0 / 45.0,
  );
  static final displaySmall = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.normal,
    height: 44.0 / 36.0,
  );

  static final headlineLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    height: 40.0 / 32.0,
  );
  static final headlineMedium = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    height: 36.0 / 28.0,
  );
  static final headlineSmall = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    height: 32.0 / 24.0,
  );

  static final titleLarge = _baseTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 28.0 / 22.0,
  );
  static final titleMedium = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24.0 / 16.0,
    letterSpacing: 16 * 0.0015,
  );
  static final titleSmall = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20.0 / 14.0,
    letterSpacing: 14 * 0.001,
  );

  static final labelLarge = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20.0 / 14.0,
    letterSpacing: 14 * 0.001,
  );
  static final labelMedium = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16.0 / 12.0,
    letterSpacing: 12 * 0.005,
  );
  static final labelSmall = _baseTextStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 16.0 / 11.0,
    letterSpacing: 11 * 0.005,
  );

  static final bodyLarge = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 24.0 / 16.0,
    letterSpacing: 16 * 0.0015,
  );
  static final bodyMedium = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 20.0 / 14.0,
    letterSpacing: 14 * 0.0025,
  );
  static final bodySmall = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 16.0 / 12.0,
    letterSpacing: 12 * 0.004,
  );

  const EduTextStyles._();
}