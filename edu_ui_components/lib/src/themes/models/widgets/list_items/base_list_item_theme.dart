import 'dart:ui';

import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_list_item_theme.freezed.dart';

@freezed
class BaseListItemTheme with _$BaseListItemTheme {
  const factory BaseListItemTheme({
    required TextThemeReference textStyle,
    required ColorSchemeReference foregroundColor,
    required ColorSchemeReference activeForegroundColor,
    required TransitionsThemeReference transition,
    required TransitionsThemeReference activeTransition,
    required double iconSize,
    required double actionsSpace,
    required double verticalPadding,
  }) = _BaseListItemTheme;

  factory BaseListItemTheme.lerp(BaseListItemTheme before, BaseListItemTheme after, double t) =>
      BaseListItemTheme(
        textStyle: t < 0.5 ? before.textStyle : after.textStyle,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        activeForegroundColor: t < 0.5 ? before.activeForegroundColor : after.activeForegroundColor,
        transition: t < 0.5 ? before.transition : after.transition,
        activeTransition: t < 0.5 ? before.activeTransition : after.activeTransition,
        iconSize: lerpDouble(before.iconSize, after.iconSize, t) ?? after.iconSize,
        actionsSpace: lerpDouble(before.actionsSpace, after.actionsSpace, t) ?? after.actionsSpace,
        verticalPadding: lerpDouble(before.verticalPadding, after.verticalPadding, t) ?? after.verticalPadding,
      );
}