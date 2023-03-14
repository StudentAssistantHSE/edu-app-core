import 'package:edu_ui_components/src/themes/edu_colors.dart';
import 'package:flutter/material.dart';

class CheckListItem {
  final String text;
  final bool? isCompleted;

  const CheckListItem(this.text, { this.isCompleted });
}

class CheckListDialogContent extends StatelessWidget {
  final List<CheckListItem> items;

  const CheckListDialogContent({ required this.items, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: i == 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                _PrefixIcon(value: items[i].isCompleted),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    items[i].text,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: items[i].isCompleted == null
                          ? null
                          : items[i].isCompleted!
                          ? EduColors.success
                          : theme.colorScheme.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _PrefixIcon extends StatelessWidget {
  final bool? value;

  const _PrefixIcon({ this.value, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = this.value;

    final theme = Theme.of(context);
    if (value == null) {
      return SizedBox(
        height: 16,
        width: 16,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.textTheme.bodyMedium?.color,
            ),
            width: 4,
            height: 4,
          ),
        ),
      );
    }

    return Icon(
      value ? Icons.check : Icons.close,
      size: 16.0,
      color: value ? EduColors.success : theme.colorScheme.error,
    );
  }
}