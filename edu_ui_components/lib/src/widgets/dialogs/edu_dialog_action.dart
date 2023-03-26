import 'package:flutter/material.dart';

enum EduDialogActionStyle {
  primary,
  secondary,
  tertiary,
  error,
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