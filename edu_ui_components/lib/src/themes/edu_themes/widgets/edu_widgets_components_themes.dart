import 'package:edu_ui_components/src/themes/models/models.dart';

abstract class EduWidgetsComponentsThemes {
  static const avatarRowTheme = AvatarRowTheme(
    avatarRadius: 16.0,
    spacer: 8.0,
    textStyle: TextThemeReference.body,
    foregroundColor: ColorSchemeReference.primary500,
  );

  static const dividerTheme = EduDividerTheme(
    height: 1,
    color: ColorSchemeReference.neutral100,
  );

  static const crossFadeTheme = CrossFadeTheme(
    appearanceTransition: TransitionsThemeReference.standardDecelerate,
    disappearanceTransition: TransitionsThemeReference.standardAccelerate,
  );

  static const loadingShimmerTheme = LoadingShimmerTheme(
    duration: Duration(seconds: 5),
    baseColor: ColorSchemeReference.neutral50,
    highlightColor: ColorSchemeReference.neutral300,
  );

  const EduWidgetsComponentsThemes._();
}