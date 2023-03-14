class IllegalRouteArgumentsException implements Exception {
  final String? route;
  final String moduleName;
  final List<String> nullFields;
  final bool initialRoute;

  const IllegalRouteArgumentsException({
    required this.route,
    required this.moduleName,
    this.nullFields = const [],
    this.initialRoute = false,
  });

  @override
  String toString() => 'IllegalRouteArgumentsException: Arguments are illegal for${initialRoute ? ' initial' : ''} $route in $moduleName module.${nullFields.isEmpty ? '' : ' Null fields in arguments: ${nullFields.join(', ')}'}';
}