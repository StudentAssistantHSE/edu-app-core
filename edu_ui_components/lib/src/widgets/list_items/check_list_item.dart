import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/components/cross_fade.dart';
import 'package:edu_ui_components/src/widgets/list_items/list_item.dart';
import 'package:flutter/material.dart';

class CheckListItem<T> extends StatelessWidget {
  final String text;
  final Set<T> groupValue;
  final T value;
  final void Function(T) onChanged;
  final VoidCallback? navigationCallback;

  const CheckListItem({
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
      isActive: groupValue.contains(value),
    );

    if (navigationCallback != null) {
      leading = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onChanged(value),
        child: leading,
      );
    }

    final listItem = ListItem(
      text: text,
      navigationCallback: navigationCallback,
      leading: leading,
      isActive: groupValue.contains(value),
    );

    if (navigationCallback == null) {
      return GestureDetector(
        onTap: () => onChanged(value),
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
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        border: Border.all(
          color: foregroundColor,
          width: 2,
        ),
      ),
      alignment: Alignment.center,
      child: CrossFade(
        firstChild: Icon(
          CustomIcons.check,
          size: 16,
          color: theme.baseListItemTheme.activeForegroundColor.resolveColorScheme(theme.colorScheme),
        ),
        appearanceTransition: theme.baseListItemTheme.activeTransition,
        disappearanceTransition: theme.baseListItemTheme.transition,
        showFirst: isActive,
      ),
    );
  }
}