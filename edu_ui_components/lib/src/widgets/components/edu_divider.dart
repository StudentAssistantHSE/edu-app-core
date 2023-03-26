import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/utils/screen_grid.dart';
import 'package:flutter/material.dart';

class EduDivider extends StatelessWidget {
  final bool usePadding;

  const EduDivider({ this.usePadding = true, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final Widget widget = Divider(
      thickness: theme.dividerTheme.height,
      height: theme.dividerTheme.height,
      color: theme.dividerTheme.color.resolveColorScheme(theme.colorScheme),
    );
    if (usePadding) {
      return ScreenGrid(child: widget, column: 0);
    }
    return widget;
  }
}