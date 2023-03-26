import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_image_theme.freezed.dart';

@freezed
class EduImageTheme with _$EduImageTheme {
  const factory EduImageTheme({
    required ColorSchemeReference color,
  }) = _EduImageTheme;

  factory EduImageTheme.lerp(EduImageTheme before, EduImageTheme after, double t) =>
      EduImageTheme(
        color: t < 0.5 ? before.color : after.color,
      );
}