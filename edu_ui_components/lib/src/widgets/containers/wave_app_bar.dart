import 'package:edu_ui_components/src/themes/edu_gradients.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/themes/edu_transitions.dart';
import 'package:edu_ui_components/src/ui/wave_clipper.dart';
import 'package:edu_ui_components/src/widgets/images/edu_logo.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';

class WaveAppBar extends StatelessWidget {
  final double keyboardClosedSize;
  final Widget? title;
  final bool collapseWhenKeyboardOpened;

  const WaveAppBar({
    this.keyboardClosedSize = 0.36,
    this.title,
    this.collapseWhenKeyboardOpened = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = this.title ?? LayoutBuilder(
      builder: (_, constraints) => SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight * 0.24,
        child: const EduLogo(),
      ),
    );
    final waveAppBar = ClipPath(
      clipper: const WaveClipper(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: EduGradients.primaryGradient(theme.colorScheme.primarySwatch),
        ),
        child: Center(
          child: title,
        ),
      ),
    );

    final expandedHeight = MediaQuery.of(context).size.height * keyboardClosedSize;
    if (collapseWhenKeyboardOpened) {
      return KeyboardAware(
        builder: (context, options) {
          final transition = options.isKeyboardOpen
              ? EduTransitions.standardDecelerate
              : EduTransitions.standardAccelerate;
          return AnimatedContainer(
            duration: transition.duration,
            curve: transition.curve,
            width: double.infinity,
            height: options.isKeyboardOpen
                ? (theme.appBarTheme.toolbarHeight ?? kToolbarHeight) + 96
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