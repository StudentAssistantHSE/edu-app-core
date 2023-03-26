import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/indicators/loading_indicator.dart';
import 'package:flutter/material.dart';

class EduButtonTheme {
  final ColorSchemeReference foregroundColor;
  final TextThemeReference textStyle;

  final OpacityThemeReference? disabledOpacity;
  final GradientsThemeReference? gradient;
  final ColorSchemeReference? borderColor;
  final double? borderWidth;
  final ColorSchemeReference? disabledForegroundColor;

  const EduButtonTheme({
    required this.foregroundColor,
    required this.textStyle,
    this.disabledOpacity,
    this.gradient,
    this.borderColor,
    this.borderWidth,
    this.disabledForegroundColor,
  });
}

abstract class EduBaseButton extends StatelessWidget {
  final String text;
  final bool useGuard;
  final VoidCallback? onPressed;
  final bool expand;

  const EduBaseButton({
    this.text = '',
    this.useGuard = false,
    this.onPressed,
    this.expand = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final buttonTheme = buttonThemeOf(theme);

    final disabled = onPressed == null || useGuard;
    final foregroundColor = (disabled
        ? (buttonTheme.disabledForegroundColor ?? buttonTheme.foregroundColor)
        : buttonTheme.foregroundColor)
        .resolveColorScheme(theme.colorScheme);

    Widget content = Text(
      text,
      style: buttonTheme.textStyle
          .resolveTextTheme(theme.textTheme).copyWith(color: foregroundColor),
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
            color: buttonTheme.foregroundColor,
          ),
        ],
      );
    }

    var constraints = BoxConstraints(
      minWidth: theme.baseButtonTheme.minimumSize,
      minHeight: theme.baseButtonTheme.minimumSize,
    );

    if (expand) {
      final size = constraints.constrain(const Size.fromWidth(double.maxFinite));
      constraints = constraints.copyWith(
        minWidth: size.width,
        maxWidth: size.width,
      );
    }

    final opacity = disabled
        ? (buttonTheme.disabledOpacity?.resolveOpacityTheme(theme.opacityTheme) ?? 1.0)
        : 1.0;
    final transition = (disabled
        ? theme.baseButtonTheme.disableTransition
        : theme.baseButtonTheme.enableTransition)
        .resolveTransitionsTheme(theme.transitionsTheme);
    final borderColor = buttonTheme.borderColor;
    return ConstrainedBox(
      constraints: constraints,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: transition.duration,
        curve: transition.curve,
        child: InkWell(
          onTap: onPressed,
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          borderRadius: BorderRadius.circular(theme.baseButtonTheme.borderRadius),
          child: Container(
            decoration: BoxDecoration(
              gradient: buttonTheme.gradient?.resolveGradientsTheme(theme.gradientsTheme),
              border: borderColor == null
                  ? null
                  : Border.all(
                      color: borderColor.resolveColorScheme(theme.colorScheme),
                      width: buttonTheme.borderWidth ?? 0,
                    ),
              borderRadius: BorderRadius.circular(theme.baseButtonTheme.borderRadius),
            ),
            alignment: expand ? Alignment.center : null,
            padding: theme.baseButtonTheme.padding,
            child: content,
          ),
        ),
      ),
    );
  }

  EduButtonTheme buttonThemeOf(EduThemeData theme);
}