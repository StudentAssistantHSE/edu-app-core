import 'package:edu_localizations/edu_localizations.dart';
import 'package:flutter/material.dart';

abstract class ButtonStateController<Event, State> {
  const ButtonStateController();

  String textSelector(S translations);
  bool disabledSelector(State state) => false;
  bool loadingSelector(State state) => false;

  void onPressed(BuildContext context) {}
  Event? eventBuilder(BuildContext context) => null;
}