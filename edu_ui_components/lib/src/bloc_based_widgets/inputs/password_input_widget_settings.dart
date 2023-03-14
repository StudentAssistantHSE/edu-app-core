import 'package:edu_ui_components/src/bloc_based_widgets/inputs/input_widget_settings.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';

class PasswordInputWidgetSettings extends InputWidgetSettings {
  @override
  TextInputSuffixType get suffixType => TextInputSuffixType.obscure;

  @override
  bool get obscure => true;

  const PasswordInputWidgetSettings({
    TextInputAction? textInputAction = TextInputAction.next,
    Iterable<String>? autofillHints = const [ AutofillHints.password ],
    bool autofocus = false,
  }) : super(
    textInputAction: textInputAction,
    autofillHints: autofillHints,
    autofocus: autofocus,
  );
}