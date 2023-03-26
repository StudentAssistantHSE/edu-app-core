import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class EduBottomNavigationBarItem {
  final String label;
  final Widget icon;
  final Widget? activeIcon;

  const EduBottomNavigationBarItem({
    required this.label,
    required this.icon,
    this.activeIcon,
  });
}

class EduBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<EduBottomNavigationBarItem> items;

  const EduBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    super.key,
  })  : assert(items.length >= 2),
        assert(0 <= currentIndex && currentIndex < items.length);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    final backgroundColor = theme.bottomNavigationBarTheme.backgroundColor
        .resolveColorScheme(theme.colorScheme);
    final activeBackgroundColor = theme.bottomNavigationBarTheme.activeBackgroundColor
        .resolveColorScheme(theme.colorScheme);
    final labelStyle = theme.bottomNavigationBarTheme.labelStyle
        .resolveTextTheme(theme.textTheme);
    final foregroundColor = theme.bottomNavigationBarTheme.foregroundColor
        .resolveColorScheme(theme.colorScheme);
    final activeForegroundColor = theme.bottomNavigationBarTheme.activeForegroundColor
        .resolveColorScheme(theme.colorScheme);
    final shadow = theme.bottomNavigationBarTheme.shadow
        .resolveShadowsTheme(theme.shadowsTheme);
    final indicatorColor = theme.bottomNavigationBarTheme.indicatorColor
        .resolveColorScheme(theme.colorScheme);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: shadow,
      ),
      child: SizedBox(
        height: theme.bottomNavigationBarTheme.height + bottomPadding,
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isActive = currentIndex == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => onTap.call(index),
                behavior: HitTestBehavior.translucent,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: isActive
                        ? Border(
                            top: BorderSide(
                              width: theme.bottomNavigationBarTheme.indicatorHeight,
                              color: indicatorColor,
                            ),
                          )
                        : null,
                    color: isActive ? activeBackgroundColor : backgroundColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: bottomPadding + 8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: IconTheme(
                              data: IconThemeData(
                                color: isActive
                                    ? activeForegroundColor
                                    : foregroundColor,
                                size: theme.bottomNavigationBarTheme.iconSize,
                              ),
                              child: isActive ? (item.activeIcon ?? item.icon) : item.icon,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              item.label,
                              style: labelStyle.copyWith(
                                color: isActive ? activeForegroundColor : foregroundColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
