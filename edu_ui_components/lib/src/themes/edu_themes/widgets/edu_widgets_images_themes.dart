import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';

abstract class EduWidgetsImagesThemes {
  static const avatarWithPlaceholderTheme = AvatarWithPlaceholderTheme(
    radius: 20.0,
    minRadius: 0.0,
    maxRadius: double.infinity,
    fadeInTransition: TransitionsThemeReference.standardDecelerate,
    colors: [
      Pair(
        ColorSchemeReference.primary500,
        ColorSchemeReference.themeMain,
      ),
      Pair(
        ColorSchemeReference.secondary500,
        ColorSchemeReference.themeMain,
      ),
      Pair(
        ColorSchemeReference.tertiary500,
        ColorSchemeReference.themeMain,
      ),
      Pair(
        ColorSchemeReference.error500,
        ColorSchemeReference.themeMain,
      ),
      Pair(
        ColorSchemeReference.neutral500,
        ColorSchemeReference.themeMain,
      ),
      Pair(
        ColorSchemeReference.primary200,
        ColorSchemeReference.primary800,
      ),
      Pair(
        ColorSchemeReference.secondary200,
        ColorSchemeReference.secondary800,
      ),
      Pair(
        ColorSchemeReference.tertiary200,
        ColorSchemeReference.tertiary800,
      ),
      Pair(
        ColorSchemeReference.error200,
        ColorSchemeReference.error800,
      ),
      Pair(
        ColorSchemeReference.neutral200,
        ColorSchemeReference.neutral800,
      ),
    ],
    backgroundColor: ColorSchemeReference.neutral50,
    letterStyle: TextThemeReference.title,
  );

  static const imageTheme = EduImageTheme(
    color: ColorSchemeReference.primary500,
  );

  const EduWidgetsImagesThemes._();
}