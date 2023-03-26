import 'package:edu_ui_components/assets/assets.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/images/edu_image.dart';
import 'package:flutter/foundation.dart';

class EduLogo extends EduImage {
  @override
  String get path => Assets.logo;

  const EduLogo({ ColorSchemeReference? color, Key? key }) : super(color: color, key: key, useColor: color != null);
}