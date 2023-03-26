import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class EduProgressIndicator extends StatelessWidget {
  final double? value;
  final ColorSchemeReference? color;
  final double? width;

  const EduProgressIndicator({
    this.value,
    this.color,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    return CircularProgressIndicator(
      value: value,
      color: (color ?? theme.progressIndicatorTheme.color).resolveColorScheme(theme.colorScheme),
      strokeWidth: width ?? theme.progressIndicatorTheme.width,
    );
  }
}