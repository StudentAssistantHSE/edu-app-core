import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/ui/wave_clipper.dart';
import 'package:edu_ui_components/src/widgets/images/edu_logo.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';

class WaveAppBar extends StatelessWidget {
  final double? keyboardCollapsedSize;
  final Widget? title;
  final bool collapseWhenKeyboardOpened;

  const WaveAppBar({
    this.keyboardCollapsedSize,
    this.title,
    this.collapseWhenKeyboardOpened = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final title = this.title ?? LayoutBuilder(
      builder: (_, constraints) => SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight * theme.waveAppBarTheme.logoSize,
        child: const EduLogo(),
      ),
    );
    final waveAppBar = ClipPath(
      clipper: const WaveClipper(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: theme.waveAppBarTheme.gradient.resolveGradientsTheme(theme.gradientsTheme),
        ),
        child: Center(
          child: title,
        ),
      ),
    );

    final expandedHeight = MediaQuery.of(context).size.height *
        (keyboardCollapsedSize ?? theme.waveAppBarTheme.keyboardCollapsedSize);
    if (collapseWhenKeyboardOpened) {
      return KeyboardAware(
        builder: (context, options) {
          final transition = options.isKeyboardOpen
              ? theme.waveAppBarTheme.keyboardOpenedTransition
              : theme.waveAppBarTheme.keyboardCollapsedTransition;
          final resolvedTransition = transition.resolveTransitionsTheme(theme.transitionsTheme);
          return AnimatedContainer(
            duration: resolvedTransition.duration,
            curve: resolvedTransition.curve,
            width: double.infinity,
            height: options.isKeyboardOpen
                ? theme.waveAppBarTheme.keyboardOpenedHeight
                : expandedHeight,
            child: waveAppBar,
          );
        },
      );
    }

    return SizedBox(
      height: expandedHeight,
      child: waveAppBar,
    );
  }
}