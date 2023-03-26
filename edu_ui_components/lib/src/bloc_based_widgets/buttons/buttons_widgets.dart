import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/buttons/button_state_controller.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_gradient_button.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_outlined_button.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum _ButtonState {
  disabled,
  loading,
  enabled,
}

extension _ButtonStateX on _ButtonState {
  bool get isLoading => this == _ButtonState.loading;
  bool get isEnabled => this == _ButtonState.enabled;
}

_ButtonState _getButtonState<T extends Bloc<Event, State>, Event, State>(
  State state,
  ButtonStateController<Event, State> controller,
) {
  final disabled = controller.disabledSelector(state);
  if (disabled) {
    return _ButtonState.disabled;
  }
  final loading = controller.loadingSelector(state);
  if (loading) {
    return _ButtonState.loading;
  }
  return _ButtonState.enabled;
}

class EduGradientButtonWidget<T extends Bloc<Event, State>, Event, State> extends StatelessWidget {
  final ButtonStateController<Event, State> controller;
  final bool expand;

  const EduGradientButtonWidget({
    required this.controller,
    this.expand = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocSelector<T, State, _ButtonState>(
    selector: (state) => _getButtonState<T, Event, State>(state, controller),
    builder: (context, state) {
      final text = context.select<S, String>(controller.textSelector);
      return EduGradientButton(
        text: text,
        expand: expand,
        useGuard: state.isLoading,
        onPressed: state.isEnabled
            ? () {
                controller.onPressed(context);

                final event = controller.eventBuilder(context);
                if (event != null) {
                  context.read<T>().add(event);
                }
              }
            : null,
      );
    },
  );
}

class EduOutlinedButtonWidget<T extends Bloc<Event, State>, Event, State> extends StatelessWidget {
  final ButtonStateController<Event, State> controller;
  final bool expand;

  const EduOutlinedButtonWidget({
    required this.controller,
    this.expand = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocSelector<T, State, _ButtonState>(
    selector: (state) => _getButtonState<T, Event, State>(state, controller),
    builder: (context, state) {
      final text = context.select<S, String>(controller.textSelector);
      return EduOutlinedButton(
        text: text,
        expand: expand,
        useGuard: state.isLoading,
        onPressed: state.isEnabled
            ? () {
                controller.onPressed(context);

                final event = controller.eventBuilder(context);
                if (event != null) {
                  context.read<T>().add(event);
                }
              }
            : null,
      );
    },
  );
}

class EduTextButtonWidget<T extends Bloc<Event, State>, Event, State> extends StatelessWidget {
  final ButtonStateController<Event, State> controller;
  final bool expand;

  const EduTextButtonWidget({
    required this.controller,
    this.expand = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocSelector<T, State, _ButtonState>(
    selector: (state) => _getButtonState<T, Event, State>(state, controller),
    builder: (context, state) {
      final text = context.select<S, String>(controller.textSelector);
      return EduTextButton(
        text: text,
        onPressed: state.isEnabled
            ? () {
                controller.onPressed(context);

                final event = controller.eventBuilder(context);
                if (event != null) {
                  context.read<T>().add(event);
                }
              }
            : null,
      );
    },
  );
}