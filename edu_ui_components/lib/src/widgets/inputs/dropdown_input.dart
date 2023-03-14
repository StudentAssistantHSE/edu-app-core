import 'package:edu_ui_components/src/widgets/inputs/suffix_button.dart';
import 'package:flutter/material.dart';

enum DropdownInputSuffixType {
  empty,
  clear,
}

extension _DropdownInputSuffixTypeX on DropdownInputSuffixType {
  bool get isClear => this == DropdownInputSuffixType.clear;
}

class DropdownInputItem<T> {
  final T key;
  final String title;

  const DropdownInputItem({ required this.key, required this.title });
}

class DropdownInput<T> extends StatelessWidget {
  final List<DropdownInputItem<T>> items;
  final T? selectedItem;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final DropdownInputSuffixType suffixType;

  bool get _addNotSelected => DropdownInput<T> == DropdownInput<T?>;

  const DropdownInput({
    required this.items,
    this.selectedItem,
    this.hint,
    this.onChanged,
    this.suffixType = DropdownInputSuffixType.empty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hint = this.hint;
    final items = [
      if (_addNotSelected && hint != null)
        DropdownMenuItem<T>(
          child: Text(hint, style: theme.inputDecorationTheme.hintStyle),
        ),
      for (final item in this.items)
        DropdownMenuItem<T>(
          child: Text(item.title),
          value: item.key,
        ),
    ];

    return FocusScope(
      canRequestFocus: false,
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixType.isClear && selectedItem != null && _addNotSelected
              ? SuffixButton(
            icon: const Icon(Icons.close_rounded),
            enabled: onChanged != null,
            onPressed: () => onChanged?.call(null),
          )
              : null,
        ),
        onChanged: onChanged,
        value: selectedItem,
        style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary),
        items: items,
      ),
    );
  }
}