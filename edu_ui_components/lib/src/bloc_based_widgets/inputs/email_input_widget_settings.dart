import 'package:edu_ui_components/src/bloc_based_widgets/inputs/input_widget_settings.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';

class EmailInputWidgetSettings extends InputWidgetSettings {
  @override
  TextInputSuffixType get suffixType => TextInputSuffixType.clear;

  @override
  TextInputType get keyboardType => TextInputType.emailAddress;

  const EmailInputWidgetSettings({
    TextInputAction? textInputAction = TextInputAction.next,
    bool autofocus = false,
  }) : super(
    textInputAction: textInputAction,
    autofillHints: const [ AutofillHints.email ],
    autofocus: autofocus,
  );
}