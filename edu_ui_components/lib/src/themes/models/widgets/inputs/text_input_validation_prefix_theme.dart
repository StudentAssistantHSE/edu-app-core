import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_opacity_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_input_validation_prefix_theme.freezed.dart';

@freezed
class TextInputValidationPrefixTheme with _$TextInputValidationPrefixTheme {
  const factory TextInputValidationPrefixTheme({
    required ColorSchemeReference deniedFlashColor,
    required ColorSchemeReference replacedFlashColor,
    required ColorSchemeReference successColor,
    required TransitionsThemeReference flashTransition,
    required TransitionsThemeReference iconSwitchInTransition,
    required TransitionsThemeReference iconSwitchOutTransition,
    required OpacityThemeReference disabledOpacity,
    required double iconSize,
    required EdgeInsets padding,
  }) = _TextInputValidationPrefixTheme;

  factory TextInputValidationPrefixTheme.lerp(TextInputValidationPrefixTheme before, TextInputValidationPrefixTheme after, double t) =>
      TextInputValidationPrefixTheme(
        deniedFlashColor: t < 0.5 ? before.deniedFlashColor : after.deniedFlashColor,
        replacedFlashColor: t < 0.5 ? before.replacedFlashColor : after.replacedFlashColor,
        successColor: t < 0.5 ? before.successColor : after.successColor,
        flashTransition: t < 0.5 ? before.flashTransition : after.flashTransition,
        iconSwitchInTransition: t < 0.5 ? before.iconSwitchInTransition : after.iconSwitchInTransition,
        iconSwitchOutTransition: t < 0.5 ? before.iconSwitchOutTransition : after.iconSwitchOutTransition,
        disabledOpacity: t < 0.5 ? before.disabledOpacity : after.disabledOpacity,
        iconSize: lerpDouble(before.iconSize, after.iconSize, t) ?? after.iconSize,
        padding: EdgeInsets.lerp(before.padding, after.padding, t) ?? after.padding,
      );
}