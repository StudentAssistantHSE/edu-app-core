import 'dart:math' as math;

import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:flutter/material.dart';

class EduTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Tab> tabs;
  final bool isScrollable;
  final double indicatorHeight;

  @override
  Size get preferredSize {
    var maxHeight = 0.0;
    for (final Widget item in tabs) {
      if (item is PreferredSizeWidget) {
        final itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight + indicatorHeight);
  }

  const EduTabBar({
    required this.tabs,
    this.isScrollable = false,
    this.indicatorHeight = 2.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final labelStyle = theme.tabBarTheme.labelStyle
        .resolveTextTheme(theme.textTheme);
    final foregroundColor = theme.tabBarTheme.foregroundColor
        .resolveColorScheme(theme.colorScheme);
    final activeForegroundColor = theme.tabBarTheme.activeForegroundColor
        .resolveColorScheme(theme.colorScheme);
    return TabBar(
      isScrollable: isScrollable,
      labelPadding: theme.tabBarTheme.labelPadding,
      labelStyle: labelStyle,
      unselectedLabelStyle: labelStyle,
      labelColor: activeForegroundColor,
      unselectedLabelColor: foregroundColor,
      indicatorWeight: indicatorHeight,
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      tabs: tabs,
    );
  }
}