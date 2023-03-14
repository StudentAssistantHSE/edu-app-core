import 'package:edu_ui_components/src/themes/edu_transitions.dart';
import 'package:flutter/material.dart';

class CrossFade extends StatelessWidget {
  final Alignment alignment;
  final bool showFirst;
  final Widget? firstChild;
  final Widget? secondChild;
  final EduTransition transition;
  final EduTransition reverseTransition;

  const CrossFade({
    this.alignment = Alignment.center,
    this.showFirst = true,
    this.firstChild,
    this.secondChild,
    this.transition = EduTransitions.emphasizedDecelerate,
    this.reverseTransition = EduTransitions.emphasizedAccelerate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstTransition = showFirst
        ? transition
        : reverseTransition;
    final secondTransition = showFirst
        ? reverseTransition
        : transition;
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