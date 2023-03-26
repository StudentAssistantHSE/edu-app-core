import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

enum DateTimeInputSuffixType {
  empty,
  clear,
}

extension _DateTimeInputSuffixTypeX on DateTimeInputSuffixType {
  bool get isClear => this == DateTimeInputSuffixType.clear;
}

class DateTimeInput extends StatefulWidget {
  final DateTime startDateTime;
  final DateTime endDateTime;
  final DateTime? selected;
  final String? hint;
  final ValueChanged<DateTime?>? onChanged;
  final DateTimeInputSuffixType suffixType;
  final String? localeName;
  final bool errorOccurred;

  const DateTimeInput({
    required this.startDateTime,
    required this.endDateTime,
    this.selected,
    this.hint,
    this.onChanged,
    this.suffixType = DateTimeInputSuffixType.empty,
    this.errorOccurred = false,
    this.localeName,
    Key? key,
  }) : super(key: key);

  @override
  _DateTimeInputState createState() => _DateTimeInputState();
}

class _DateTimeInputState extends State<DateTimeInput> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _setSelectedItemText();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DateTimeInput oldWidget) {
    _setSelectedItemText();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onChanged == null;
    return FocusScope(
      canRequestFocus: false,
      child: TextInput(
        readOnly: true,
        suffixType: widget.suffixType.isClear
            ? TextInputSuffixType.clear : TextInputSuffixType.empty,
        hint: widget.hint,
        controller: _textEditingController,
        onChanged: (value) => value.isEmpty
            ? widget.onChanged?.call(null)
            : null,
        enabled: !disabled,
        onTap: _showPicker,
        errorOccurred: widget.errorOccurred,
      ),
    );
  }

  void _setSelectedItemText() {
    final selected = widget.selected;
    if (selected != null) {
      _textEditingController.text = DateFormat.yMd(widget.localeName).add_Hm().format(selected);
    } else {
      _textEditingController.text = '';
    }
  }

  Future<void> _showPicker() async {
    final result = await DatePicker.showDateTimePicker(
      context,
      minTime: widget.startDateTime,
      maxTime: widget.endDateTime,
      currentTime: widget.selected,
      locale: S.of(context)?.localeName == 'ru'
        ? LocaleType.ru
        : LocaleType.en,
    );

    if (result == null) {
      return;
    }

    widget.onChanged?.call(result);
  }
}