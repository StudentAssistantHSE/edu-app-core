import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_transitions_theme.freezed.dart';

@freezed
class EduTransition with _$EduTransition {
  const factory EduTransition({
    required Duration duration,
    required Curve curve,
  }) = _EduTransition;

  factory EduTransition.lerp(EduTransition before, EduTransition after, double t) =>
      EduTransition(
        duration: lerpDuration(before.duration, after.duration, t),
        curve: t < 0.5 ? before.curve : after.curve,
      );
}

@freezed
class EduTransitionsTheme with _$EduTransitionsTheme {
  const factory EduTransitionsTheme({
    required EduTransition emphasized,
    required EduTransition emphasizedAccelerate,
    required EduTransition emphasizedDecelerate,
    required EduTransition standard,
    required EduTransition standardAccelerate,
    required EduTransition standardDecelerate,
    required EduTransition fast,
    required EduTransition fastAccelerate,
    required EduTransition fastDecelerate,
  }) = _EduTransitionsTheme;

  factory EduTransitionsTheme.lerp(EduTransitionsTheme before, EduTransitionsTheme after, double t) =>
      EduTransitionsTheme(
        emphasized: EduTransition.lerp(before.emphasized, after.emphasized, t),
        emphasizedAccelerate: EduTransition.lerp(before.emphasizedAccelerate, after.emphasizedAccelerate, t),
        emphasizedDecelerate: EduTransition.lerp(before.emphasizedDecelerate, after.emphasizedDecelerate, t),
        standard: EduTransition.lerp(before.standard, after.standard, t),
        standardAccelerate: EduTransition.lerp(before.standardAccelerate, after.standardAccelerate, t),
        standardDecelerate: EduTransition.lerp(before.standardDecelerate, after.standardDecelerate, t),
        fast: EduTransition.lerp(before.fast, after.fast, t),
        fastAccelerate: EduTransition.lerp(before.fastAccelerate, after.fastAccelerate, t),
        fastDecelerate: EduTransition.lerp(before.fastDecelerate, after.fastDecelerate, t),
      );
}

enum TransitionsThemeReference {
  emphasized,
  emphasizedAccelerate,
  emphasizedDecelerate,
  standard,
  standardAccelerate,
  standardDecelerate,
  fast,
  fastAccelerate,
  fastDecelerate,
}

extension TransitionsThemeReferenceResolver on TransitionsThemeReference {
  EduTransition resolveTransitionsTheme(EduTransitionsTheme transitionsTheme) {
    switch (this) {
      case TransitionsThemeReference.emphasized:
        return transitionsTheme.emphasized;
      case TransitionsThemeReference.emphasizedAccelerate:
        return transitionsTheme.emphasizedAccelerate;
      case TransitionsThemeReference.emphasizedDecelerate:
        return transitionsTheme.emphasizedDecelerate;
      case TransitionsThemeReference.standard:
        return transitionsTheme.standard;
      case TransitionsThemeReference.standardAccelerate:
        return transitionsTheme.standardAccelerate;
      case TransitionsThemeReference.standardDecelerate:
        return transitionsTheme.standardDecelerate;
      case TransitionsThemeReference.fast:
        return transitionsTheme.fast;
      case TransitionsThemeReference.fastAccelerate:
        return transitionsTheme.fastAccelerate;
      case TransitionsThemeReference.fastDecelerate:
        return transitionsTheme.fastDecelerate;
    }
  }
}