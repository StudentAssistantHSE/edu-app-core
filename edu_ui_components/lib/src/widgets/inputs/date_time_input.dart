import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:flutter/material.dart';
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

  Future<DateTime?> _selectDate(BuildContext context) async {
    var initial = widget.selected ?? DateTime.now();
    if (initial.isBefore(widget.startDateTime)) {
      initial = widget.startDateTime;
    }
    if (initial.isAfter(widget.endDateTime)) {
      initial = widget.endDateTime;
    }
    final selected = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: widget.startDateTime,
      lastDate: widget.endDateTime,
    );
    return selected;
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    var initial = widget.selected ?? DateTime.now();
    if (initial.isBefore(widget.startDateTime)) {
      initial = widget.startDateTime;
    }
    if (initial.isAfter(widget.endDateTime)) {
      initial = widget.endDateTime;
    }
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: initial.hour, minute: initial.minute),
    );
    return selected;
  }

  Future<void> _showPicker() => _selectDate(context).then((date) async {
    if (date != null) {
      final time = await _selectTime(context);
      if (time == null) {
        return;
      }
      widget.onChanged?.call(DateTime(date.year, date.month, date.day, time.hour, time.minute));
    }
  });
}