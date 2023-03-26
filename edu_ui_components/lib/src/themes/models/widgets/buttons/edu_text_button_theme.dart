import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_text_button_theme.freezed.dart';

@freezed
class EduTextButtonTheme with _$EduTextButtonTheme {
  const factory EduTextButtonTheme({
    required ColorSchemeReference foregroundColor,
    required ColorSchemeReference disabledForegroundColor,
    required TextThemeReference textStyle,
  }) = _EduTextButtonTheme;

  factory EduTextButtonTheme.lerp(EduTextButtonTheme before, EduTextButtonTheme after, double t) =>
      EduTextButtonTheme(
        foregroundColor: t < 0.5 ? before.foregroundColor : after.foregroundColor,
        disabledForegroundColor: t < 0.5 ? before.disabledForegroundColor : after.disabledForegroundColor,
        textStyle: t < 0.5 ? before.textStyle : after.textStyle,
      );
}