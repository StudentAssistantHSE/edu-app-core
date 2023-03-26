import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class StepsIndicator extends StatelessWidget {
  final int currentStep;
  final int maxSteps;
  final bool isHorizontal;

  const StepsIndicator({
    required this.currentStep,
    required this.maxSteps,
    this.isHorizontal = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final activeTransition = theme.stepsIndicatorTheme.activeTransition
        .resolveTransitionsTheme(theme.transitionsTheme);
    final inactiveTransition = theme.stepsIndicatorTheme.inactiveTransition
        .resolveTransitionsTheme(theme.transitionsTheme);
    final inactiveBorderColor = theme.stepsIndicatorTheme.inactiveBorderColor
        .resolveColorScheme(theme.colorScheme);
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < maxSteps; i++)
          AnimatedContainer(
            width: theme.stepsIndicatorTheme.stepSize,
            height: theme.stepsIndicatorTheme.stepSize,
            margin: isHorizontal
                ? EdgeInsets.symmetric(horizontal: theme.stepsIndicatorTheme.stepSpace)
                : EdgeInsets.symmetric(vertical: theme.stepsIndicatorTheme.stepSpace),
            duration: currentStep == i
                ? activeTransition.duration
                : inactiveTransition.duration,
            curve: currentStep == i
                ? activeTransition.curve
                : inactiveTransition.curve,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentStep == i
                  ? theme.stepsIndicatorTheme.activeColor.resolveColorScheme(theme.colorScheme)
                  : null,
              border: currentStep == i
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: inactiveBorderColor),
            ),
          ),
      ],
    );

    if (isHorizontal) {
      return SizedBox(
        height: theme.stepsIndicatorTheme.stepSize,
        child: content,
      );
    }

    return SizedBox(
      width: theme.stepsIndicatorTheme.stepSize,
      child: content,
    );
  }
}