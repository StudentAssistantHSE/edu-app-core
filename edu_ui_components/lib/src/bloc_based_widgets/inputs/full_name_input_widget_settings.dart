import 'package:edu_ui_components/src/bloc_based_widgets/inputs/input_widget_settings.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';

class FullNameInputWidgetSettings extends InputWidgetSettings {
  @override
  TextInputSuffixType get suffixType => TextInputSuffixType.clear;

  const FullNameInputWidgetSettings({
    TextInputAction? textInputAction = TextInputAction.next,
    Iterable<String>? autofillHints = const [ AutofillHints.name ],
    bool autofocus = false,
  }) : super(
    textInputAction: textInputAction,
    autofillHints: autofillHints,
    autofocus: autofocus,
  );
}