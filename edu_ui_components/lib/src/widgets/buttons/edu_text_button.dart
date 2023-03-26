import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_base_button.dart';
import 'package:flutter/material.dart';

class EduTextButton extends EduBaseButton {
  const EduTextButton({
    required String text,
    VoidCallback? onPressed,
    Key? key,
  }) : super(
    text: text,
    useGuard: false,
    onPressed: onPressed,
    expand: false,
    key: key,
  );

  @override
  EduButtonTheme buttonThemeOf(EduThemeData theme) => EduButtonTheme(
    foregroundColor: theme.textButtonTheme.foregroundColor,
    textStyle: theme.textButtonTheme.textStyle,
    disabledForegroundColor: theme.textButtonTheme.disabledForegroundColor,
  );
}