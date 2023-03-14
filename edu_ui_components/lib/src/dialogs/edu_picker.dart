import 'dart:math';

import 'package:edu_ui_components/src/widgets/buttons/icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EduPicker extends StatefulWidget {
  final List<String> items;
  final int? initialItem;
  final String? hint;
  final ValueChanged<int?>? onChanged;

  const EduPicker._({
    required this.items,
    this.initialItem,
    this.hint,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _EduPickerState createState() => _EduPickerState();

  static Future<int?> show({
    required BuildContext context,
    required List<String> items,
    int? initialItem,
    String? hint,
    ValueChanged<int?>? onChanged,
    bool useRootNavigator = false,
  }) => showModalBottomSheet(
    context: context,
    useRootNavigator: useRootNavigator,
    barrierColor: Colors.black87,
    builder: (context) => EduPicker._(
      items: items,
      initialItem: initialItem,
      hint: hint,
      onChanged: onChanged,
    ),
  );
}

class _EduPickerState extends State<EduPicker> {
  late final FixedExtentScrollController _scrollController;
  late int _currentItem;

  @override
  void initState() {
    _currentItem = widget.initialItem ?? 0;
    if (widget.initialItem != null && widget.hint != null) {
      _currentItem += 1;
    }
    _scrollController = FixedExtentScrollController(initialItem: _currentItem);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hint = widget.hint;
    final items = [
      if (hint != null)
        Text(hint, style: theme.inputDecorationTheme.hintStyle),
      for (final item in widget.items)
        Text(item, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary)),
    ];
    return SafeArea(
      child: SizedBox(
        height: max(min(items.length * 40, MediaQuery.of(context).size.height * 0.38), 200),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ThemeIconButton(
                icon: const Icon(Icons.check_rounded),
                onPressed: _onSelectPressed,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            Expanded(
              child: CupertinoPicker.builder(
                itemExtent: 40,
                useMagnifier: true,
                magnification: 1.2,
                childCount: items.length,
                itemBuilder: (_, index) => Align(child: items[index]),
                scrollController: _scrollController,
                onSelectedItemChanged: (item) => _currentItem = item,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectPressed() => Navigator.of(context).pop(
    widget.hint == null
        ? _currentItem
        : _currentItem == 0
        ? -1
        : _currentItem - 1,
  );
}