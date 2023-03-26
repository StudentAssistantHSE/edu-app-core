import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/cupertino.dart';

abstract class InputWidgetSettings {
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool autofocus;

  TextInputSuffixType get suffixType => TextInputSuffixType.empty;
  bool get autocorrect => false;
  List<TextInputFormatterInterface>? get inputFormatters => null;
  TextInputType? get keyboardType => null;
  int? get maxLength => null;
  int? get maxLines => 1;
  int? get minLines => null;
  bool get obscure => false;
  bool get withDelay => false;
  bool get expands => false;
  TextAlignVertical? get textAlignVertical => null;

  const InputWidgetSettings({
    required this.textInputAction,
    required this.autofillHints,
    required this.autofocus,
  });
}