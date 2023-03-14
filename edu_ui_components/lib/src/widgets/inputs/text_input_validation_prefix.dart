import 'dart:async';

import 'package:edu_ui_components/edu_ui_components.dart';
import 'package:edu_ui_components/src/themes/edu_colors.dart';
import 'package:flutter/material.dart';

enum TextInputValidationHelperEvent {
  denied,
  replaced,
}

const _colorTransition = EduTransitions.standard;

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
  Color? _flashColor;

  @override
  void dispose() {
    _flashTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = _flashColor
        ?? (widget.isValid ? EduColors.success : null)?.withOpacity(widget.enabled ? 1.0 : 0.54)
        ?? IconTheme.of(context).color
        ?? Colors.black;

    final content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AnimatedContainer(
        duration: _colorTransition.duration,
        curve: _colorTransition.curve,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color),
        ),
        child: AnimatedTheme(
          duration: _colorTransition.duration,
          curve: _colorTransition.curve,
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: color, size: 20),
          ),
          child: AnimatedSwitcher(
            duration: EduTransitions.standardDecelerate.duration,
            reverseDuration: EduTransitions.standardAccelerate.duration,
            switchInCurve: EduTransitions.standardDecelerate.curve,
            switchOutCurve: EduTransitions.standardAccelerate.curve,
            child: widget.isValid
                ? Icon(Icons.check_rounded, key: _validCheckKey)
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
        final flashColor = Theme.of(context).colorScheme.error;
        if (_flashColor != flashColor) {
          setState(() => _flashColor = flashColor);
        }
        _flashTimer = Timer(_colorTransition.duration, () {
          setState(() => _flashColor = null);
        });
        break;
      case TextInputValidationHelperEvent.replaced:
        final flashColor = Theme.of(context).colorScheme.secondary;
        if (_flashColor != flashColor) {
          setState(() => _flashColor = flashColor);
        }
        _flashTimer = Timer(_colorTransition.duration, () {
          setState(() => _flashColor = null);
        });
        break;
    }
  }
}