import 'package:edu_core/edu_core.dart';
import 'package:flutter/widgets.dart';

class Navigation {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  bool get locked => _locked;

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

  void lock() => _locked = true;
  void unlock() => _locked = false;

  Future<T?>? push<T extends Object?>(Route<T> route) => _locked
      ? null
      : _navigationKey.state.push(route);

  Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
      Route<T> newRoute, {
        TO? result,
      }) => _locked
      ? null
      : _navigationKey.state.pushReplacement(newRoute, result: result);

  Future<T?>? pushAndRemoveUntil<T extends Object?>(
      Route<T> newRoute,
      RoutePredicate predicate,
      ) => _locked
      ? null
      : _navigationKey.state.pushAndRemoveUntil(newRoute, predicate);

  Future<T?>? pushNamed<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) => _locked
      ? null
      : _navigationKey.state.pushNamed(routeName, arguments: arguments);

  Future<T?>? pushReplacementNamed<T extends Object?, TO extends Object?>(
      String routeName, {
        TO? result,
        Object? arguments,
      }) => _locked
      ? null
      : _navigationKey.state.pushReplacementNamed(
    routeName,
    result: result,
    arguments: arguments,
  );

  Future<T?>? pushNamedAndRemoveUntil<T extends Object?>(
      String newRouteName,
      RoutePredicate predicate, {
        Object? arguments,
      }) => _locked
      ? null
      : _navigationKey.state.pushNamedAndRemoveUntil(
    newRouteName,
    predicate,
    arguments: arguments,
  );

  void pop<T extends Object?>([T? result]) => _locked
      ? null
      : _navigationKey.state.pop(result);

  void popUntil(bool Function(Route<dynamic>) predicate) => _locked
      ? null
      : _navigationKey.state.popUntil(predicate);

  Future<bool> maybePop<T extends Object?>([T? result]) async {
    if (locked) {
      return true;
    }
    return _navigationKey.state.maybePop(result);
  }

  bool canPop() => !_locked && _navigationKey.state.canPop();
}