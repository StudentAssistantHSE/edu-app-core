import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/dialogs/edu_picker.dart';
import 'package:edu_ui_components/src/widgets/inputs/text_input.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum SelectionInputSuffixType {
  empty,
  clear,
}

extension _SelectionInputSuffixTypeX on SelectionInputSuffixType {
  bool get isClear => this == SelectionInputSuffixType.clear;
}

class SelectionInputItem<T> extends Equatable {
  final T key;
  final String title;

  @override
  List<Object?> get props => [key, title];

  const SelectionInputItem({ required this.key, required this.title });
}

class SelectionInput<T> extends StatefulWidget {
  final List<SelectionInputItem<T>> items;
  final T? selectedItem;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final SelectionInputSuffixType suffixType;

  const SelectionInput({
    required this.items,
    this.selectedItem,
    this.hint,
    this.onChanged,
    this.suffixType = SelectionInputSuffixType.empty,
    Key? key,
  }) : super(key: key);

  @override
  _SelectionInputState<T> createState() => _SelectionInputState<T>();
}

class _SelectionInputState<T> extends State<SelectionInput<T>> {
  late final TextEditingController _textEditingController;

  bool get _addNotSelected => SelectionInput<T> == SelectionInput<T?>;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _setSelectedItemText();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SelectionInput<T> oldWidget) {
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
    final disabled = widget.onChanged == null
        || widget.items.isEmpty && !_addNotSelected;
    return InkWell(
      onTap: disabled ? null : _showPicker,
      canRequestFocus: false,
      child: SizedBox(
        child: IgnorePointer(
          child: TextInput(
            suffixType: widget.suffixType.isClear
                && widget.selectedItem != null && _addNotSelected
                ? TextInputSuffixType.clear : TextInputSuffixType.empty,
            hint: widget.hint,
            controller: _textEditingController,
            onChanged: (value) => value.isEmpty
                ? widget.onChanged?.call(null)
                : null,
            enabled: !disabled,
          ),
        ),
      ),
    );
  }

  void _setSelectedItemText() {
    final selectedItemTitle = widget.items
        .firstWhereOrNull((e) => e.key == widget.selectedItem)?.title;
    _textEditingController.text = selectedItemTitle ?? '';
  }

  Future<void> _showPicker() async {
    var initialItemIndex = widget.items.indexWhere((e) => e.key == widget.selectedItem);
    if (initialItemIndex == -1) {
      initialItemIndex = 0;
    }
    final result = await EduPicker.show(
      context: context,
      items: widget.items.map((e) => e.title).toList(),
      initialItem: initialItemIndex,
      hint: _addNotSelected ? widget.hint : null,
      onChanged: (value) => widget.onChanged?.call(
        value == null
          ? null
          : widget.items[value].key,
      ),
    );

    if (result == null) {
      return;
    }

    if (result == -1) {
      widget.onChanged?.call(null);
      return;
    }

    widget.onChanged?.call(
      widget.items[result].key,
    );
  }
}