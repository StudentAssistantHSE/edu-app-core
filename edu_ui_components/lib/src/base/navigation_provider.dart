import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/base/navigation.dart';
import 'package:flutter/widgets.dart';

class NavigationProvider extends InheritedWidget {
  final Navigation navigation;

  const NavigationProvider({
    required this.navigation,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant NavigationProvider oldWidget) =>
      oldWidget.navigation != navigation;

  static Navigation of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<NavigationProvider>();
    if (scope == null) {
      throw const NoElementInContextException<NavigationProvider>();
    }
    return scope.navigation;
  }
}