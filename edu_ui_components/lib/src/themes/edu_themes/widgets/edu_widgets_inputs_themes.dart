import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

abstract class EduWidgetsInputsThemes {
  static const codeInputTheme = CodeInputTheme(
    codeTextStyle: TextThemeReference.headline,
    codeTextColor: ColorSchemeReference.primary500,
    activePinColor: ColorSchemeReference.primary500,
    disabledPinColor: ColorSchemeReference.neutral100,
    errorPinColor: ColorSchemeReference.error500,
    transition: TransitionsThemeReference.fast,
    pinWidth: 20.0,
    pinHeight: 40.0,
    pinSpace: 8.0,
  );

  static const textInputTheme = TextInputTheme(
    padding: EdgeInsets.symmetric(
      vertical: 8.0,
      horizontal: 12.0,
    ),
    borderRadius: 4.0,
    markerWidth: 2,
    hintStyle: TextThemeReference.body,
    textStyle: TextThemeReference.body,
    backgroundColor: ColorSchemeReference.neutral50,
    focusedBackgroundColor: ColorSchemeReference.themeMain,
    errorBackgroundColor: ColorSchemeReference.error50,
    foregroundColor: ColorSchemeReference.neutral500,
    enteredForegroundColor: ColorSchemeReference.primary500,
    errorForegroundColor: ColorSchemeReference.error500,
    disabledForegroundColor: ColorSchemeReference.neutral300,
    focusedTransition: TransitionsThemeReference.standardDecelerate,
    unfocusedTransition: TransitionsThemeReference.standardAccelerate,
    timeoutDuration: Duration(milliseconds: 300),
  );

  static const textInputValidationPrefixTheme = TextInputValidationPrefixTheme(
    deniedFlashColor: ColorSchemeReference.error500,
    replacedFlashColor: ColorSchemeReference.secondary500,
    successColor: ColorSchemeReference.success500,
    flashTransition: TransitionsThemeReference.standard,
    iconSwitchInTransition: TransitionsThemeReference.standardDecelerate,
    iconSwitchOutTransition: TransitionsThemeReference.standardAccelerate,
    disabledOpacity: OpacityThemeReference.disabled,
    iconSize: 20.0,
    padding: EdgeInsets.symmetric(vertical: 8),
  );

  const EduWidgetsInputsThemes._();
}