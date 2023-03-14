import 'package:edu_ui_components/src/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

enum EduDialogActionStyle {
  primary,
  secondary,
  tertiary,
  error,
}

extension EduDialogActionStyleConverter on EduDialogActionStyle {
  PrimaryButtonStyle get asPrimaryButtonStyle {
    switch (this) {
      case EduDialogActionStyle.primary:
        return PrimaryButtonStyle.primary;
      case EduDialogActionStyle.secondary:
        return PrimaryButtonStyle.secondary;
      case EduDialogActionStyle.tertiary:
        return PrimaryButtonStyle.tertiary;
      case EduDialogActionStyle.error:
        return PrimaryButtonStyle.error;
    }
  }
}

class EduDialogAction {
  final EduDialogActionStyle style;
  final String text;
  final VoidCallback? onPressed;

  const EduDialogAction({
    required this.text,
    this.style = EduDialogActionStyle.primary,
    this.onPressed,
  });
}