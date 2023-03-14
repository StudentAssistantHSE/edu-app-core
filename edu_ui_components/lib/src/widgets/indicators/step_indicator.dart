import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/themes/edu_transitions.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int maxSteps;
  final bool isHorizontal;

  const StepIndicator({
    required this.currentStep,
    required this.maxSteps,
    this.isHorizontal = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < maxSteps; i++)
          AnimatedContainer(
            width: 8,
            height: 8,
            margin: isHorizontal
                ? const EdgeInsets.symmetric(horizontal: 8)
                : const EdgeInsets.symmetric(vertical: 8),
            duration: currentStep == i
                ? EduTransitions.standardDecelerate.duration
                : EduTransitions.standardAccelerate.duration,
            curve: currentStep == i
                ? EduTransitions.standardDecelerate.curve
                : EduTransitions.standardAccelerate.curve,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentStep == i
                  ? colorScheme.primary
                  : null,
              border: currentStep == i
                  ? Border.all(color: Colors.transparent)
                  : Border.all(color: colorScheme.onSurfaceSwatch.shade300),
            ),
          ),
      ],
    );

    if (isHorizontal) {
      return SizedBox(
        height: 8,
        child: content,
      );
    }

    return SizedBox(
      width: 8,
      child: content,
    );
  }
}