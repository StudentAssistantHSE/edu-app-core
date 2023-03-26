import 'package:edu_ui_components/src/themes/models/models.dart';

abstract class EduWidgetsIndicatorsThemes {
  static const loadingIndicatorTheme = LoadingIndicatorTheme(
    color: ColorSchemeReference.primary500,
    duration: Duration(milliseconds: 1500),
    iconSize: 20.0,
    dotsSize: 8.0,
  );

  static const progressIndicatorTheme = EduProgressIndicatorTheme(
    color: ColorSchemeReference.neutral300,
    width: 2.0,
  );

  static const stepsIndicatorTheme = StepsIndicatorTheme(
    activeTransition: TransitionsThemeReference.standardDecelerate,
    inactiveTransition: TransitionsThemeReference.standardAccelerate,
    stepSize: 8.0,
    stepSpace: 4.0,
    activeColor: ColorSchemeReference.primary500,
    inactiveBorderColor: ColorSchemeReference.neutral100,
  );

  const EduWidgetsIndicatorsThemes._();
}