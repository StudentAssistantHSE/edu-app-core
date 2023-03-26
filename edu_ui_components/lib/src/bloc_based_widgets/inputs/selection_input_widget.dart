import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/inputs/selection_input_state_controller.dart';
import 'package:edu_ui_components/src/widgets/inputs/selection_input.dart';
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

class SelectionInputWidget<T extends Bloc<Event, State>, Event, State, K> extends StatelessWidget {
  final SelectionInputSuffixType suffixType;
  final SelectionInputStateController<Event, State, K> controller;

  const SelectionInputWidget({
    required this.controller,
    this.suffixType = SelectionInputSuffixType.empty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<T, State>(
    buildWhen: (previous, current) {
      final previousSelected = controller.selectedItemSelector(previous);
      final currentSelected = controller.selectedItemSelector(current);
      final previousState = _getInputState(previous);
      final currentState = _getInputState(current);
      return previousSelected != currentSelected
          || previousState != currentState
          || controller.itemsChangedChecker(previous, current);
    },
    builder: (context, state) {
      final hint = context.select<S, String?>(controller.hintSelector);
      final items = context.select<S, List<SelectionInputItem<K>>>(
        (translations) => controller.itemsSelector(translations, state),
      );
      final selectedItem = controller.selectedItemSelector(state);
      final inputState = _getInputState(state);
      return SelectionInput<K>(
        items: items,
        selectedItem: selectedItem,
        hint: hint,
        suffixType: suffixType,
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