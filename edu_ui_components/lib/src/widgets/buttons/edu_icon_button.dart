import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class EduIconButton extends StatelessWidget {
  final Widget icon;
  final double? iconSize;
  final ColorSchemeReference? color;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final String? tooltip;

  const EduIconButton({
    required this.icon,
    this.iconSize,
    this.color,
    this.onPressed,
    this.padding,
    this.tooltip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final transition = (onPressed == null
        ? theme.baseButtonTheme.disableTransition
        : theme.baseButtonTheme.enableTransition)
        .resolveTransitionsTheme(theme.transitionsTheme);

    final color = (this.color ?? theme.iconButtonTheme.color).resolveColorScheme(theme.colorScheme);
    return AnimatedOpacity(
      duration: transition.duration,
      curve: transition.curve,
      opacity: onPressed == null
          ? theme.iconButtonTheme.disabledOpacity.resolveOpacityTheme(theme.opacityTheme)
          : 1.0,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: iconSize ?? theme.iconButtonTheme.iconSize,
        color: color,
        disabledColor: color,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: padding ?? theme.iconButtonTheme.padding,
        tooltip: tooltip,
      ),
    );
  }
}