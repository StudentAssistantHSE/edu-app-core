import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_opacity_theme.freezed.dart';

@freezed
class EduOpacityTheme with _$EduOpacityTheme {
  const factory EduOpacityTheme({
    required double visible,
    required double disabled,
    required double invisible,
  }) = _EduOpacityTheme;

  factory EduOpacityTheme.lerp(EduOpacityTheme before, EduOpacityTheme after, double t) =>
      EduOpacityTheme(
        visible: lerpDouble(before.visible, after.visible, t) ?? after.visible,
        disabled: lerpDouble(before.disabled, after.disabled, t) ?? after.disabled,
        invisible: lerpDouble(before.invisible, after.invisible, t) ?? after.invisible,
      );
}

enum OpacityThemeReference {
  visible,
  disabled,
  invisible,
}

extension OpacityThemeReferenceResolver on OpacityThemeReference {
  double resolveOpacityTheme(EduOpacityTheme opacityTheme) {
    switch (this) {
      case OpacityThemeReference.visible:
        return opacityTheme.visible;
      case OpacityThemeReference.disabled:
        return opacityTheme.disabled;
      case OpacityThemeReference.invisible:
        return opacityTheme.invisible;
    }
  }
}