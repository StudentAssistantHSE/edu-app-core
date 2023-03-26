import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_shadows_theme.freezed.dart';

@freezed
class EduShadowsTheme with _$EduShadowsTheme {
  const factory EduShadowsTheme({
    required List<BoxShadow> upShadow,
  }) = _EduShadowsTheme;

  factory EduShadowsTheme.lerp(EduShadowsTheme before, EduShadowsTheme after, double t) =>
      EduShadowsTheme(
        upShadow: _lerpShadows(before.upShadow, after.upShadow, t),
      );

  static List<BoxShadow> _lerpShadows(List<BoxShadow> before, List<BoxShadow> after, double t) => [
    for (var i = 0; i < after.length; i++)
      i < before.length
        ? BoxShadow.lerp(before[i], after[i], t) ?? after[i]
        : after[i],
  ];
}

enum ShadowsThemeReference {
  upShadow,
}

extension ShadowsThemeReferenceResolver on ShadowsThemeReference {
  List<BoxShadow> resolveShadowsTheme(EduShadowsTheme shadowsTheme) {
    switch (this) {
      case ShadowsThemeReference.upShadow:
        return shadowsTheme.upShadow;
    }
  }
}