import 'package:edu_ui_components/src/bloc_based_widgets/inputs/input_widget_settings.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';

class SearchInputWidgetSettings extends InputWidgetSettings {
  @override
  TextInputSuffixType get suffixType => TextInputSuffixType.clear;

  @override
  bool get withDelay => true;

  const SearchInputWidgetSettings() : super(
    textInputAction: TextInputAction.search,
    autofillHints: null,
    autofocus: false,
  );
}