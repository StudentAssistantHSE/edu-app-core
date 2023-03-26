import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/inputs/input_state_controller.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/inputs/input_widget_settings.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum _InputState {
  disabled,
  error,
  success;
}

extension _InputStateX on _InputState {
  bool get isError => this == _InputState.error;
  bool get enabled => this != _InputState.disabled;
}

class InputWidget<T extends Bloc<Event, State>, Event, State> extends StatelessWidget {
  final InputStateController<Event, State> controller;
  final InputWidgetSettings settings;

  const InputWidget({
    required this.controller,
    required this.settings,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<T, State>(
    buildWhen: (previous, current) {
      final previousState = _getInputState(previous);
      final currentState = _getInputState(current);
      final previousIsValid = controller.isValidSelector(previous);
      final currentIsValid = controller.isValidSelector(current);
      return previousState != currentState || previousIsValid != currentIsValid;
    },
    builder: (context, state) {
      final hint = context.select<S, String?>(controller.hintSelector);
      final isValid = controller.isValidSelector(state);
      final inputState = _getInputState(state);
      return TextInput(
        textInputAction: settings.textInputAction,
        suffixType: settings.suffixType,
        autocorrect: settings.autocorrect,
        autofillHints: inputState.enabled ? settings.autofillHints : null,
        keyboardType: settings.keyboardType,
        inputFormatters: settings.inputFormatters,
        maxLength: settings.maxLength,
        autofocus: settings.autofocus,
        obscure: settings.obscure,
        withDelay: settings.withDelay,
        maxLines: settings.maxLines,
        minLines: settings.minLines,
        expands: settings.expands,
        textAlignVertical: settings.textAlignVertical,

        initialValue: controller.initialValue(state),
        onChanged: inputState.enabled ? _callbackBuilder(context, controller.onChangedEventBuilder) : null,
        onSubmitted: _callbackBuilder(context, controller.onSubmittedEventBuilder),
        hint: hint,
        enabled: inputState.enabled,
        onValidationPrefixPressed: controller.isValidationPrefixTappable
            ? () => controller.onValidationPrefixPressed(context, context.read<T>().state)
            : null,
        isValid: isValid,
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

  ValueChanged<String>? _callbackBuilder(
    BuildContext context,
    Event? Function(BuildContext, String) eventBuilder,
  ) => (value) {
    final event = eventBuilder(context, value);
    if (event != null) {
      context.read<T>().add(event);
    }
  };
}