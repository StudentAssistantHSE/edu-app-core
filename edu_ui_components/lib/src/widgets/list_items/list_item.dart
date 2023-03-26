import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_transitions_theme.dart';
import 'package:edu_ui_components/src/widgets/utils/screen_grid.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final bool isActive;
  final Widget? leading;
  final VoidCallback? navigationCallback;

  const ListItem({
    required this.text,
    this.isActive = false,
    this.leading,
    this.navigationCallback,
    Key? key,
  }) : super(key: key);

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
    final item = ScreenGrid(
      column: 0,
      additionalOffset: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: theme.baseListItemTheme.verticalPadding),
        child: AnimatedDefaultTextStyle(
          style: theme.baseListItemTheme.textStyle.resolveTextTheme(theme.textTheme)
              .copyWith(color: foregroundColor),
          duration: transition.duration,
          curve: transition.curve,
          child: IconTheme(
            data: IconThemeData(
              color: foregroundColor,
              size: theme.baseListItemTheme.iconSize,
            ),
            child: Row(
              children: [
                if (leading != null)
                  leading ?? const SizedBox.shrink(),
                if (leading != null)
                  SizedBox(width: theme.baseListItemTheme.actionsSpace),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
                if (navigationCallback != null)
                  SizedBox(width: theme.baseListItemTheme.actionsSpace),
                if (navigationCallback != null)
                  const Icon(Icons.keyboard_arrow_right_rounded),
              ],
            ),
          ),
        ),
      ),
    );

    if (navigationCallback != null) {
      return GestureDetector(
        child: item,
        behavior: HitTestBehavior.translucent,
        onTap: navigationCallback,
      );
    }

    return item;
  }
}