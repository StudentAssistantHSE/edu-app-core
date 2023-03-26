import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cross_fade_theme.freezed.dart';

@freezed
class CrossFadeTheme with _$CrossFadeTheme {
  const factory CrossFadeTheme({
    required TransitionsThemeReference appearanceTransition,
    required TransitionsThemeReference disappearanceTransition,
  }) = _CrossFadeTheme;

  factory CrossFadeTheme.lerp(CrossFadeTheme before, CrossFadeTheme after, double t) =>
      CrossFadeTheme(
        appearanceTransition: t < 0.5 ? before.appearanceTransition : after.appearanceTransition,
        disappearanceTransition: t < 0.5 ? before.disappearanceTransition : after.disappearanceTransition,
      );
}