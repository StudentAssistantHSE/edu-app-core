part of 'base_module.dart';

abstract class BaseModuleRouting<T> {
  final String _moduleName;

  RoutesTable get table;

  const BaseModuleRouting(this._moduleName);

  List<Route<dynamic>> onGenerateInitialRoutes(T? arguments, String routeName) {
    final routes = routeName.split('/');
    return [
      for (final route in routes)
        _onGenerateInitialRoute(arguments, route),
    ];
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeBuilder = table[settings.name];
    if (routeBuilder == null) {
      throw NoRouteException(route: settings.name, moduleName: _moduleName);
    }

    return routeBuilder(settings);
  }

  String? initialRouteBuilder(T? moduleArguments) => null;

  @protected
  Object? initialRoutesArgumentsBuilder(T? moduleArguments, String route) => null;

  Route<dynamic> _onGenerateInitialRoute(T? moduleArguments, String route) => onGenerateRoute(
    RouteSettings(
      name: route,
      arguments: initialRoutesArgumentsBuilder(moduleArguments, route),
    ),
  );
}