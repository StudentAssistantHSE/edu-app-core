import 'package:edu_ui_components/src/themes/edu_palette.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

abstract class EduGradientsThemes {
  static const light = EduGradientsTheme(
    primary: LinearGradient(colors: [ EduPalette.blue500, EduPalette.blue700 ]),
  );

  const EduGradientsThemes._();
}