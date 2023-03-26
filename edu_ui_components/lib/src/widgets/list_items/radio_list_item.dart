import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/components/cross_fade.dart';
import 'package:edu_ui_components/src/widgets/list_items/list_item.dart';
import 'package:flutter/material.dart';

class RadioListItem<T> extends StatelessWidget {
  final String text;
  final T groupValue;
  final T value;
  final void Function(T) onChanged;
  final VoidCallback? navigationCallback;

  const RadioListItem({
    required this.text,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    this.navigationCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget leading = _SelectionMark<T>(
      isActive: value == groupValue,
    );

    if (navigationCallback != null) {
      leading = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => value == groupValue ? null : onChanged(value),
        child: leading,
      );
    }

    final listItem = ListItem(
      text: text,
      navigationCallback: navigationCallback,
      leading: leading,
      isActive: value == groupValue,
    );

    if (navigationCallback == null) {
      return GestureDetector(
        onTap: () => value == groupValue ? null : onChanged(value),
        behavior: HitTestBehavior.translucent,
        child: listItem,
      );
    }

    return listItem;
  }
}

class _SelectionMark<T> extends StatelessWidget {
  final bool isActive;

  const _SelectionMark({ required this.isActive, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final transition = (isActive
        ? theme.baseListItemTheme.activeTransition
        : theme.baseListItemTheme.transition)
        .resolveTransitionsTheme(theme.transitionsTheme);
    final foregroundColor = (isActive
        ? theme.baseListItemTheme.activeForegroundColor
        : theme.baseListItemTheme.foregroundColor)
        .resolveColorScheme(theme.colorScheme);
    return AnimatedContainer(
      duration: transition.duration,
      curve: transition.curve,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: foregroundColor,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: CrossFade(
        firstChild: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.baseListItemTheme.activeForegroundColor.resolveColorScheme(theme.colorScheme),
          ),
        ),
        appearanceTransition: theme.baseListItemTheme.activeTransition,
        disappearanceTransition: theme.baseListItemTheme.transition,
        showFirst: isActive,
      ),
    );
  }
}