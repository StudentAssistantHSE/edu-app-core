import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/inputs/date_time_input_state_controller.dart';
import 'package:edu_ui_components/src/widgets/inputs/date_time_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum _InputState {
  disabled,
  error,
  success;
}

extension _InputStateX on _InputState {
  bool get isError => this == _InputState.error;
  bool get disabled => this == _InputState.disabled;
}

class DateTimeInputWidget<T extends Bloc<Event, State>, Event, State> extends StatelessWidget {
  final DateTimeInputStateController<Event, State> controller;
  final DateTimeInputSuffixType suffixType;

  const DateTimeInputWidget({
    required this.controller,
    this.suffixType = DateTimeInputSuffixType.empty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<T, State>(
    buildWhen: (previous, current) {
      final previousSelected = controller.selectedDateTimeSelector(previous);
      final currentSelected = controller.selectedDateTimeSelector(current);
      final previousStart = controller.startDateTimeSelector(previous);
      final currentStart = controller.startDateTimeSelector(current);
      final previousEnd = controller.endDateTimeSelector(previous);
      final currentEnd = controller.endDateTimeSelector(current);
      final previousState = _getInputState(previous);
      final currentState = _getInputState(current);
      return previousSelected != currentSelected
          || previousStart != currentStart
          || previousEnd != currentEnd
          || previousState != currentState;
    },
    builder: (context, state) {
      final translations = context.watch<S>();
      final hint = controller.hintSelector(translations);
      final start = controller.startDateTimeSelector(state);
      final end = controller.endDateTimeSelector(state);
      final selected = controller.selectedDateTimeSelector(state);
      final inputState = _getInputState(state);
      return DateTimeInput(
        startDateTime: start,
        endDateTime: end,
        selected: selected,
        suffixType: suffixType,
        hint: hint,
        localeName: translations.localeName,
        onChanged: inputState.disabled ? null : (value) {
          final event = controller.eventBuilder(context, value);
          if (event != null) {
            context.read<T>().add(event);
          }
        },
        errorOccurred: inputState.isError,
      );
    },
  );

  _InputState _getInputState(State state) {
    final disabled = controller.disabledSelector(state);
    if (disabled) {
      return _InputState.disabled;
    }
    final error = controller.errorSelector(state);
    if (error) {
      return _InputState.error;
    }
    return _InputState.success;
  }
}