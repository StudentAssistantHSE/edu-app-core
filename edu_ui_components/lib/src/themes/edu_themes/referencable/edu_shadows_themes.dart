import 'package:edu_ui_components/src/themes/edu_palette.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

abstract class EduShadowsThemes {
  static const light = EduShadowsTheme(
    upShadow: [ BoxShadow(color: EduPalette.black05, offset: Offset(0, -5), blurRadius: 5) ],
  );

  const EduShadowsThemes._();
}