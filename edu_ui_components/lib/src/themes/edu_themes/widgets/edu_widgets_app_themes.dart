import 'package:edu_ui_components/src/themes/models/models.dart';

abstract class EduWidgetsAppThemes {
  static const categoriesListTheme = CategoriesListTheme(
    backgroundColor: ColorSchemeReference.primary500,
    labelStyle: TextThemeReference.body,
    foregroundColor: ColorSchemeReference.themeMain,
    spacing: 8.0,
  );

  const EduWidgetsAppThemes._();
}