import 'package:edu_ui_components/assets/assets.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:flutter/material.dart';

enum FireworkStyle {
  onPrimary,
  primary300,
}

class Firework extends StatelessWidget {
  final FireworkStyle style;

  const Firework({ this.style = FireworkStyle.onPrimary, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color color;
    switch (style) {
      case FireworkStyle.onPrimary:
        color = colorScheme.onPrimary;
        break;
      case FireworkStyle.primary300:
        color = colorScheme.primarySwatch.shade300;
        break;
    }

    return Image.asset(
      Assets.firework,
      fit: BoxFit.contain,
      package: Assets.packageName,
      color: color,
    );
  }
}