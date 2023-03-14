import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/base/base_module.dart';
import 'package:flutter/widgets.dart';

class ModuleRoutingProvider<T extends BaseModuleRouting<K>, K> extends InheritedWidget {
  final T? routing;

  const ModuleRoutingProvider({
    required this.routing,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant ModuleRoutingProvider<T, K> oldWidget) =>
      oldWidget.routing != routing;

  static T? of<T extends BaseModuleRouting<K>, K>(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ModuleRoutingProvider<T, K>>();
    if (scope == null) {
      throw NoElementInContextException<ModuleRoutingProvider<T, K>>();
    }
    return scope.routing;
  }
}