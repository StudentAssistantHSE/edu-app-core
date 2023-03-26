import 'package:flutter/material.dart';

class EduDialogAction {
  final String text;
  final VoidCallback? onPressed;

  const EduDialogAction({
    required this.text,
    this.onPressed,
  });
}