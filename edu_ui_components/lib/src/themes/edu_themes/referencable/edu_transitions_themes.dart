import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/animation.dart';

abstract class EduTransitionsThemes {
  static const universal = EduTransitionsTheme(
    emphasized: EduTransition(
      duration: EduDurations.long_2,
      curve: Curves.easeInOutCubicEmphasized,
    ),
    emphasizedAccelerate: EduTransition(
      duration: EduDurations.short_4,
      curve: Cubic(0.3, 0.0, 0.8, 0.15),
    ),
    emphasizedDecelerate: EduTransition(
      duration: EduDurations.medium_4,
      curve: Cubic(0.05, 0.7, 0.1, 1.0),
    ),
    standard: EduTransition(
      duration: EduDurations.medium_2,
      curve: Cubic(0.2, 0.0, 0, 1.0),
    ),
    standardAccelerate: EduTransition(
      duration: EduDurations.short_4,
      curve: Cubic(0.3, 0, 1, 1),
    ),
    standardDecelerate: EduTransition(
      duration: EduDurations.medium_1,
      curve: Cubic(0, 0, 0, 1),
    ),
    fast: EduTransition(
      duration: EduDurations.short_4,
      curve: Cubic(0.2, 0.0, 0, 1.0),
    ),
    fastAccelerate: EduTransition(
      duration: EduDurations.short_2,
      curve: Cubic(0.3, 0, 1, 1),
    ),
    fastDecelerate: EduTransition(
      duration: EduDurations.short_3,
      curve: Cubic(0, 0, 0, 1),
    ),
  );

  const EduTransitionsThemes._();
}

abstract class EduDurations {
  static const short_1 = Duration(milliseconds: 50);
  static const short_2 = Duration(milliseconds: 100);
  static const short_3 = Duration(milliseconds: 150);
  static const short_4 = Duration(milliseconds: 200);

  static const medium_1 = Duration(milliseconds: 250);
  static const medium_2 = Duration(milliseconds: 300);
  static const medium_3 = Duration(milliseconds: 350);
  static const medium_4 = Duration(milliseconds: 400);

  static const long_1 = Duration(milliseconds: 450);
  static const long_2 = Duration(milliseconds: 500);
  static const long_3 = Duration(milliseconds: 550);
  static const long_4 = Duration(milliseconds: 600);

  static const extraLong_1 = Duration(milliseconds: 700);
  static const extraLong_2 = Duration(milliseconds: 800);
  static const extraLong_3 = Duration(milliseconds: 900);
  static const extraLong_4 = Duration(milliseconds: 1000);

  const EduDurations._();
}