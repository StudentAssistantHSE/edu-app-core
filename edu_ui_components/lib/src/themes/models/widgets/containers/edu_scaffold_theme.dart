import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edu_scaffold_theme.freezed.dart';

@freezed
class EduScaffoldTheme with _$EduScaffoldTheme {
  const factory EduScaffoldTheme({
    required ColorSchemeReference backgroundColor,
  }) = _EduScaffoldTheme;

  factory EduScaffoldTheme.lerp(EduScaffoldTheme before, EduScaffoldTheme after, double t) =>
      EduScaffoldTheme(
        backgroundColor: t < 0.5 ? before.backgroundColor : after.backgroundColor,
      );
}