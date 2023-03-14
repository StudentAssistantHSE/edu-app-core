import 'package:edu_localizations/edu_localizations.dart';
import 'package:flutter/widgets.dart';

abstract class InputStateController<Event, State> {
  bool get isValidationPrefixTappable => false;

  const InputStateController();

  Event? onChangedEventBuilder(BuildContext context, String value) => null;
  Event? onSubmittedEventBuilder(BuildContext context, String value) => null;
  void onValidationPrefixPressed(BuildContext context, State state) {}

  String? initialValue(State state) => null;
  String? hintSelector(S translations) => null;
  bool disabledSelector(State state) => false;
  bool canSubmitSelector(State state) => true;

  bool? isValidSelector(State state) => null;
}