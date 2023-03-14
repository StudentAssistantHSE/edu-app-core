class NoRouteException implements Exception {
  final String? route;
  final String moduleName;

  const NoRouteException({ required this.route, required this.moduleName });

  @override
  String toString() => 'NoRouteException: Route $route not found for $moduleName module';
}