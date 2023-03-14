import 'package:edu_ui_components/src/themes/edu_text_styles.dart';
import 'package:flutter/material.dart';

abstract class EduStateProperties {
  const EduStateProperties._();

  static MaterialStateColor simpleStateColor(
    Color color, {
    Color? focusedColor,
    Color? disabledColor,
  }) =>
      MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledColor ?? color.withOpacity(0.72);
        }
        if (states.contains(MaterialState.focused)) {
          return focusedColor ?? color;
        }
        return color;
      });

  static MaterialStateProperty<T> simpleStateProperty<T>(
    T defaultValue, {
    T? disabledValue,
    T? focusedValue,
  }) =>
      MaterialStateProperty.resolveWith<T>((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledValue ?? defaultValue;
        }
        if (states.contains(MaterialState.focused)) {
          return focusedValue ?? defaultValue;
        }
        return defaultValue;
      });

  static MaterialStateTextStyle inputHintStyle(Color color, Color disabledColor) =>
      MaterialStateTextStyle.resolveWith((states) {
        var resolvedColor = color;
        if (states.contains(MaterialState.disabled)) {
          resolvedColor = disabledColor;
        }
        return EduTextStyles.bodyMedium.copyWith(
          color: resolvedColor,
        );
      });

  static MaterialStateColor inputForegroundColor(Color color, Color disabledColor) =>
      MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledColor;
        }
        return color;
      });
}