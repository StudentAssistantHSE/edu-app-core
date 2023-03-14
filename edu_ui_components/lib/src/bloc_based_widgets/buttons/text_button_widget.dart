import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/bloc_based_widgets/buttons/button_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextButtonWidget<T extends Bloc<Event, State>, Event, State> extends StatelessWidget {
  final ButtonStateController<Event, State> controller;

  const TextButtonWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<T, State>(
    buildWhen: (previous, current) => controller.disabledSelector(previous)
        != controller.disabledSelector(current),
    builder: (context, state) {
      final text = context.select<S, String>(controller.textSelector);
      final isDisabled = controller.disabledSelector(state);
      return Center(
        child: TextButton(
          child: Text(text),
          onPressed: isDisabled
              ? null
              : () {
                  controller.onPressed(context);

                  final event = controller.eventBuilder(context);
                  if (event != null) {
                    context.read<T>().add(event);
                  }
                },
          ),
      );
    },
  );
}