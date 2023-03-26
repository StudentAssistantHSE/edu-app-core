import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class EduCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool useBorder;

  const EduCard({
    required this.child,
    this.padding,
    this.useBorder = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(theme.cardTheme.borderRadius),
        color: theme.cardTheme.backgroundColor.resolveColorScheme(theme.colorScheme),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(theme.cardTheme.borderRadius),
          border: useBorder
              ? Border.all(color: theme.cardTheme.borderColor.resolveColorScheme(theme.colorScheme))
              : null,
        ),
        position: DecorationPosition.foreground,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(theme.cardTheme.borderRadius),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}