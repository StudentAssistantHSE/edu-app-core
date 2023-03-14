import 'package:edu_ui_components/src/bloc_based_widgets/inputs/input_widget_settings.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';

class RepeatedPasswordInputWidgetSettings extends InputWidgetSettings {
  @override
  TextInputSuffixType get suffixType => TextInputSuffixType.clear;

  @override
  bool get obscure => true;

  const RepeatedPasswordInputWidgetSettings({
    TextInputAction? textInputAction = TextInputAction.next,
  }) : super(
    textInputAction: textInputAction,
    autofillHints: const [ AutofillHints.newPassword ],
    autofocus: false,
  );
}