import 'package:edu_ui_components/src/themes/models/models.dart';

abstract class EduWidgetsListItemsThemes {
  static const baseListItemTheme = BaseListItemTheme(
    textStyle: TextThemeReference.body,
    foregroundColor: ColorSchemeReference.neutral500,
    activeForegroundColor: ColorSchemeReference.primary500,
    transition: TransitionsThemeReference.fastAccelerate,
    activeTransition: TransitionsThemeReference.fastDecelerate,
    iconSize: 24.0,
    actionsSpace: 16.0,
    verticalPadding: 12.0,
  );

  const EduWidgetsListItemsThemes._();
}