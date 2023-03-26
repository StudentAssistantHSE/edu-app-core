import 'package:edu_ui_components/assets/assets.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

abstract class EduImage extends StatelessWidget {
  final ColorSchemeReference? color;
  final bool useColor;

  String get path;

  const EduImage({ this.color, this.useColor = true, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    return Image.asset(
      path,
      fit: BoxFit.contain,
      package: Assets.packageName,
      color: useColor
        ? (color ?? theme.imageTheme.color).resolveColorScheme(theme.colorScheme)
        : null,
    );
  }
}