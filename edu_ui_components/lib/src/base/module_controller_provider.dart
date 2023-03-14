import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/base/base_module.dart';
import 'package:flutter/widgets.dart';

class ModuleControllerProvider<T extends BaseModuleController> extends InheritedWidget {
  final T? controller;

  const ModuleControllerProvider({
    required this.controller,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant ModuleControllerProvider<T> oldWidget) =>
      oldWidget.controller != controller;

  static T? of<T extends BaseModuleController>(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ModuleControllerProvider<T>>();
    if (scope == null) {
      throw NoElementInContextException<ModuleControllerProvider<T>>();
    }
    return scope.controller;
  }
}