import 'package:edu_core/edu_core.dart';
import 'package:flutter/widgets.dart';

class Navigation {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  bool _locked = false;

  ModalRoute<T>? currentRoute<T>() {
    final context = _navigationKey.currentContext;
    if (context == null) {
      return null;
    }
    return ModalRoute.of<T>(context);
  }

  NavigatorState? parent() =>
      _navigationKey.currentContext?.findAncestorStateOfType<NavigatorState>();

  Future<T?> push<T extends Object?>(Route<T> route) =>
      _navigationKey.state.push(route);

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) => _navigationKey.state.pushReplacement(newRoute, result: result);

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) => _navigationKey.state.pushAndRemoveUntil(newRoute, predicate);

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) => _navigationKey.state.pushNamed(routeName, arguments: arguments);

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) => _navigationKey.state.pushReplacementNamed(
    routeName,
    result: result,
    arguments: arguments,
  );

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) => _navigationKey.state.pushNamedAndRemoveUntil(
    newRouteName,
    predicate,
    arguments: arguments,
  );

  void pop<T extends Object?>([T? result]) =>
      _navigationKey.state.pop(result);

  void popUntil(bool Function(Route<dynamic>) predicate) =>
      _navigationKey.state.popUntil(predicate);

  Future<bool> maybePop<T extends Object?>([T? result]) =>
      _navigationKey.state.maybePop(result);

  bool canPop() => _navigationKey.state.canPop();

  void lockRoute() {
    if (_locked) {
      return;
    }
    final route = ModalRoute.of(_navigationKey.context);
    if (route == null) {
      return;
    }
    _locked = true;
    route.addScopedWillPopCallback(_lockerCallback);
  }

  void unlockRoute() {
    if (!_locked) {
      return;
    }
    final route = ModalRoute.of(_navigationKey.context);
    if (route == null) {
      return;
    }
    _locked = false;
    route.removeScopedWillPopCallback(_lockerCallback);
  }

  Future<bool> _lockerCallback() async => !(await _navigationKey.state.maybePop());
}