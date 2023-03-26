import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class CrossFade extends StatelessWidget {
  final Alignment alignment;
  final bool showFirst;
  final Widget? firstChild;
  final Widget? secondChild;
  final TransitionsThemeReference? appearanceTransition;
  final TransitionsThemeReference? disappearanceTransition;

  const CrossFade({
    this.alignment = Alignment.center,
    this.showFirst = true,
    this.firstChild,
    this.secondChild,
    this.appearanceTransition,
    this.disappearanceTransition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);

    final appearanceTransition = (this.appearanceTransition ?? theme.crossFadeTheme.appearanceTransition)
        .resolveTransitionsTheme(theme.transitionsTheme);
    final disappearanceTransition = (this.disappearanceTransition ?? theme.crossFadeTheme.disappearanceTransition)
        .resolveTransitionsTheme(theme.transitionsTheme);

    final firstTransition = showFirst
        ? appearanceTransition
        : disappearanceTransition;
    final secondTransition = showFirst
        ? disappearanceTransition
        : appearanceTransition;

    return Stack(
      alignment: alignment,
      children: [
        Positioned(
          child: AnimatedOpacity(
            opacity: showFirst ? 1.0 : 0.0,
            duration: firstTransition.duration,
            curve: firstTransition.curve,
            child: firstChild,
          ),
        ),
        Positioned(
          child: AnimatedOpacity(
            opacity: showFirst ? 0.0 : 1.0,
            duration: secondTransition.duration,
            curve: secondTransition.curve,
            child: secondChild,
          ),
        ),
      ],
    );
  }
}