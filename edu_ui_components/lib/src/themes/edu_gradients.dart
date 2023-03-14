import 'package:flutter/material.dart';

abstract class EduGradients {
  const EduGradients._();

  static LinearGradient primaryGradient(
    MaterialColor primaryColor,
  ) => LinearGradient(
    colors: [
      primaryColor,
      primaryColor.shade700,
    ],
  );
}