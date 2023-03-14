import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/buttons/button_state_controller.dart';
import 'package:edu_ui_components/src/widgets/buttons/primary_button.dart';
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

class PrimaryButtonWidget<T extends Bloc<Event, State>, Event, State> extends StatelessWidget {
  final PrimaryButtonStyle style;
  final ButtonStateController<Event, State> controller;

  const PrimaryButtonWidget({
    required this.controller,
    this.style = PrimaryButtonStyle.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<T, State>(
    buildWhen: (previous, current) => _getButtonState(previous) != _getButtonState(current),
    builder: (context, state) {
      final text = context.select<S, String>(controller.textSelector);
      final buttonState = _getButtonState(state);
      return PrimaryButton(
        text: text,
        style: style,
        expand: true,
        useGuard: buttonState.isLoading,
        onPressed: buttonState.isEnabled
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

  _ButtonState _getButtonState(State state) {
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
}