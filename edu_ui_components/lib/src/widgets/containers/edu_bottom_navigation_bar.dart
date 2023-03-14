import 'package:edu_ui_components/src/themes/edu_shadows.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:flutter/material.dart';

class EduBottomNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  const EduBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    super.key,
  })  : assert(items.length >= 2),
        assert(0 <= currentIndex && currentIndex < items.length);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: EduShadows.elevatedShadow(theme.onSurfaceSwatch),
        color: theme.colorScheme.surface,
      ),
      child: SizedBox(
        height: preferredSize.height + bottomPadding,
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = currentIndex == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => onTap.call(index),
                behavior: HitTestBehavior.translucent,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border(
                            top: BorderSide(
                              width: 2.0,
                              color: theme.colorScheme.primary,
                            ),
                          )
                        : null,
                    color: isSelected ? theme.primarySwatch.shade50 : theme.colorScheme.surface,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (isSelected) item.activeIcon else item.icon,
                        if (item.label != null) ...[
                          const SizedBox(height: 4.0),
                          Text(
                            item.label!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isSelected ? theme.colorScheme.primary : theme.onSurfaceSwatch.shade200,
                            ),
                          ),
                        ],
                        SizedBox(height: bottomPadding),
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
