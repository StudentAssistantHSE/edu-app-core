import 'package:edu_ui_components/assets/assets.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/images/edu_image.dart';
import 'package:flutter/foundation.dart';

class Firework extends EduImage {
  @override
  String get path => Assets.firework;

  const Firework({ ColorSchemeReference? color, Key? key }) : super(color: color, useColor: true, key: key);
}