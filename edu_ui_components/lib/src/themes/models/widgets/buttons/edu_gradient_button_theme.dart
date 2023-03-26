import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_gradients_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_opacity_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_gradient_button_theme.freezed.dart';

@freezed
class EduGradientButtonTheme with _$EduGradientButtonTheme {
  const factory EduGradientButtonTheme({
    required GradientsThemeReference gradient,
    required ColorSchemeReference foregroundColor,
    required TextThemeReference textStyle,
    required OpacityThemeReference disabledOpacity,
  }) = _EduGradientButtonTheme;

  factory EduGradientButtonTheme.lerp(EduGradientButtonTheme before, EduGradientButtonTheme after, double t) =>
      EduGradientButtonTheme(
        gradient: t < 0.5 ? before.gradient : after.gradient,
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        textStyle: t < 0.5 ? before.textStyle : after.textStyle,
        disabledOpacity: t < 0.5 ? before.disabledOpacity : after.disabledOpacity,
      );
}