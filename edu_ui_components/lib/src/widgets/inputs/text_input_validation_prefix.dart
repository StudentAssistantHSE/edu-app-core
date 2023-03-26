import 'dart:async';

import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

enum TextInputValidationHelperEvent {
  denied,
  replaced,
}

class TextInputValidationPrefix extends StatefulWidget {
  final bool isValid;
  final VoidCallback? onPressed;
  final bool enabled;
  
  const TextInputValidationPrefix({
    required this.isValid,
    required this.enabled,
    this.onPressed,
    Key? key,
  }) : super(key: key);
  
  @override
  TextInputValidationPrefixState createState() => TextInputValidationPrefixState();
}

class TextInputValidationPrefixState extends State<TextInputValidationPrefix> {
  final _validCheckKey = UniqueKey();
  final _invalidCheckKey = UniqueKey();

  Timer? _flashTimer;
  ColorSchemeReference? _flashColor;

  @override
  void dispose() {
    _flashTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final color = _flashColor?.resolveColorScheme(theme.colorScheme)
        ?? (widget.isValid ? theme.textInputValidationPrefixTheme.successColor : null)
            ?.resolveColorScheme(theme.colorScheme)
            .withOpacity(widget.enabled
                ? 1.0
                : theme.textInputValidationPrefixTheme
                    .disabledOpacity.resolveOpacityTheme(theme.opacityTheme),
            )
        ?? IconTheme.of(context).color
        ?? Colors.black;

    final flashTransition = theme.textInputValidationPrefixTheme.flashTransition
        .resolveTransitionsTheme(theme.transitionsTheme);
    final switchInTransition = theme.textInputValidationPrefixTheme.iconSwitchInTransition
        .resolveTransitionsTheme(theme.transitionsTheme);
    final switchOutTransition = theme.textInputValidationPrefixTheme.iconSwitchOutTransition
        .resolveTransitionsTheme(theme.transitionsTheme);
    final content = Padding(
      padding: theme.textInputValidationPrefixTheme.padding,
      child: AnimatedContainer(
        duration: flashTransition.duration,
        curve: flashTransition.curve,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color),
        ),
        child: AnimatedTheme(
          duration: flashTransition.duration,
          curve: flashTransition.curve,
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(
              color: color,
              size: theme.textInputValidationPrefixTheme.iconSize,
            ),
          ),
          child: AnimatedSwitcher(
            duration: switchInTransition.duration,
            reverseDuration: switchOutTransition.duration,
            switchInCurve: switchInTransition.curve,
            switchOutCurve: switchOutTransition.curve,
            child: widget.isValid
                ? Icon(CustomIcons.check, key: _validCheckKey)
                : Icon(Icons.question_mark_rounded, key: _invalidCheckKey),
          ),
        ),
      ),
    );
    if (widget.onPressed == null) {
      return content;
    }

    return InkWell(
      onTap: widget.onPressed,
      canRequestFocus: false,
      child: content,
    );
  }

  void handleValidationEvent(TextInputValidationHelperEvent event) {
    _flashTimer?.cancel();
    switch (event) {
      case TextInputValidationHelperEvent.denied:
        final theme = EduTheme.of(context);
        final flashColor = theme.textInputValidationPrefixTheme.deniedFlashColor;
        if (_flashColor != flashColor) {
          setState(() => _flashColor = flashColor);
        }
        _flashTimer = Timer(
          theme.textInputValidationPrefixTheme.flashTransition
              .resolveTransitionsTheme(theme.transitionsTheme).duration,
          () => setState(() => _flashColor = null),
        );
        break;
      case TextInputValidationHelperEvent.replaced:
        final theme = EduTheme.of(context);
        final flashColor = theme.textInputValidationPrefixTheme.replacedFlashColor;
        if (_flashColor != flashColor) {
          setState(() => _flashColor = flashColor);
        }
        _flashTimer = Timer(
          theme.textInputValidationPrefixTheme.flashTransition
              .resolveTransitionsTheme(theme.transitionsTheme).duration,
          () => setState(() => _flashColor = null),
        );
        break;
    }
  }
}