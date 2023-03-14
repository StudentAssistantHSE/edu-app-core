import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/themes/edu_shadows.dart';
import 'package:edu_ui_components/src/themes/edu_state_properties.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/widgets/buttons/gradient_elevated_button.dart';
import 'package:edu_ui_components/src/widgets/indicators/loading_indicator.dart';
import 'package:flutter/material.dart';

enum PrimaryButtonStyle {
  primary,
  secondary,
  tertiary,
  elevated,
  error,
}

extension _PrimaryButtonStyleX on PrimaryButtonStyle {
  bool get isElevated => this == PrimaryButtonStyle.elevated;
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final PrimaryButtonStyle style;
  final bool useGuard;
  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  final IconData? postfixIcon;
  final bool expand;

  const PrimaryButton({
    required this.text,
    this.style = PrimaryButtonStyle.primary,
    this.onPressed,
    this.useGuard = false,
    this.prefixIcon,
    this.postfixIcon,
    this.expand = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixIcon != null)
          Icon(prefixIcon),
        if (prefixIcon != null)
          const SizedBox(width: 8),
        Text(text),
        if (postfixIcon != null)
          const SizedBox(width: 8),
        if (postfixIcon != null)
          Icon(postfixIcon),
      ],
    );

    if (useGuard) {
      content = Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0,
            child: content,
          ),
          LoadingIndicator(
            color: style.isElevated
                ? theme.colorScheme.onSurface
                : theme.elevatedButtonTheme.style?.foregroundColor?.resolve({}),
          ),
        ],
      );
    }

    if (style.isElevated) {
      return GradientElevatedButton(
        child: content,
        onPressed: onPressed,
        shadow: EduShadows.elevatedShadow(theme.colorScheme.primarySwatch),
        style: ButtonStyle(
          backgroundColor: EduStateProperties.simpleStateColor(
            theme.colorScheme.surface,
            disabledColor: theme.colorScheme.onSurfaceSwatch.shade50,
          ),
          foregroundColor: EduStateProperties.simpleStateColor(
            theme.colorScheme.onSurface,
            disabledColor: theme.colorScheme.onSurfaceSwatch.shade300,
          ),
          fixedSize: expand ? MaterialStateProperty.all<Size>(const Size.fromWidth(double.maxFinite)) : null,
        ),
      );
    }

    final MaterialColor gradientColor;
    switch (style) {
      case PrimaryButtonStyle.primary:
        gradientColor = theme.colorScheme.primarySwatch;
        break;
      case PrimaryButtonStyle.secondary:
        gradientColor = theme.colorScheme.secondarySwatch;
        break;
      case PrimaryButtonStyle.tertiary:
        gradientColor = theme.colorScheme.tertiarySwatch;
        break;
      case PrimaryButtonStyle.error:
        gradientColor = theme.colorScheme.errorSwatch;
        break;
      case PrimaryButtonStyle.elevated:
        throw const UnexpectedStateException('Primary button: unreachable style state');
    }

    return GradientElevatedButton(
      onPressed: onPressed,
      gradientColor: gradientColor,
      child: content,
      style: ButtonStyle(
        backgroundColor: EduStateProperties.simpleStateColor(gradientColor),
        fixedSize: expand ? MaterialStateProperty.all<Size>(const Size.fromWidth(double.maxFinite)) : null,
      ),
    );
  }
}