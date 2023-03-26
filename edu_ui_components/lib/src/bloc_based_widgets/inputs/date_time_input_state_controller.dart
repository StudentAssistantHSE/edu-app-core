import 'package:edu_localizations/edu_localizations.dart';
import 'package:flutter/material.dart';

abstract class DateTimeInputStateController<Event, State> {
  const DateTimeInputStateController();

  String? hintSelector(S translations) => null;
  DateTime startDateTimeSelector(State state);
  DateTime endDateTimeSelector(State state);
  DateTime? selectedDateTimeSelector(State state) => null;
  bool disabledSelector(State state) => false;
  bool errorSelector(State state) => false;

  Event? eventBuilder(BuildContext context, DateTime? value) => null;
}