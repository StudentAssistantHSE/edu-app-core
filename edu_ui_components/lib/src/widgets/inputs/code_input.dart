import 'dart:async';

import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/referencable.dart';
import 'package:edu_ui_components/src/widgets/inputs/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PasteDialogConfig {
  final String title;
  final String content;
  final String affirmative;
  final String negative;

  const PasteDialogConfig({
    required this.title,
    required this.content,
    required this.affirmative,
    required this.negative,
  });
}

class CodeInput extends StatelessWidget {
  final PasteDialogConfig pasteDialogConfig;
  final TextEditingController? pinController;
  final StreamController<ErrorAnimationType>? errorController;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool enabled;
  final bool autoFocus;

  const CodeInput({
    required this.pasteDialogConfig,
    this.pinController,
    this.errorController,
    this.onChanged,
    this.onCompleted,
    this.enabled = true,
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final textStyle = theme.codeInputTheme.codeTextStyle
        .resolveTextTheme(theme.textTheme).copyWith(
          color: theme.codeInputTheme.codeTextColor.resolveColorScheme(theme.colorScheme),
        );

    final activeColor = theme.codeInputTheme.activePinColor
        .resolveColorScheme(theme.colorScheme);
    final disabledColor = theme.codeInputTheme.disabledPinColor
        .resolveColorScheme(theme.colorScheme);
    final errorColor = theme.codeInputTheme.errorPinColor
        .resolveColorScheme(theme.colorScheme);
    final transition = theme.codeInputTheme.transition
        .resolveTransitionsTheme(theme.transitionsTheme);

    return CustomPinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      autoFocus: autoFocus,
      enablePinAutofill: false,
      controller: pinController,
      appContext: context,
      autoDisposeControllers: false,
      length: 6,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      enabled: enabled,
      backgroundColor: Colors.transparent,
      textStyle: textStyle,
      cursorColor: textStyle.color,
      errorTextSpace: 0,
      pinTheme: PinTheme(
        activeColor: activeColor,
        selectedColor: activeColor,
        inactiveColor: disabledColor,
        disabledColor: disabledColor,
        errorBorderColor: errorColor,
        fieldWidth: theme.codeInputTheme.pinWidth,
        fieldHeight: theme.codeInputTheme.pinHeight,
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: theme.codeInputTheme.pinSpace),
      ),
      errorAnimationController: errorController,
      beforeTextPaste: (value) {
        if (value == null) return null;
        value = value.trim();
        if (value.length != 6 && value.length != 7) return null;

        final notSeparatedTest = int.tryParse(value) != null;
        final separated = value.split('-');
        if (separated.length != 2) return notSeparatedTest ? value : null;
        separated[0] = separated[0].trim();
        separated[1] = separated[1].trim();
        if (separated[0].length != 3 || separated[1].length != 3) return notSeparatedTest ? value : null;
        final separatedTest = int.tryParse(separated[0]) != null && int.tryParse(separated[1]) != null;

        if (notSeparatedTest) return value;
        if (separatedTest) return separated[0] + separated[1];
        return null;
      },
      animationType: AnimationType.scale,
      animationDuration: transition.duration,
      animationCurve: transition.curve,
      useHapticFeedback: true,
      keyboardType: TextInputType.number,
      dialogConfig: DialogConfig(
        dialogTitle: pasteDialogConfig.title,
        dialogContent: '${pasteDialogConfig.content} ',
        affirmativeText: pasteDialogConfig.affirmative,
        negativeText: pasteDialogConfig.negative,
      ),
      onCompleted: onCompleted,
    );
  }
}