import 'package:edu_core/edu_core.dart';
import 'package:flutter/material.dart';

class ArgumentsProvider<T> extends InheritedWidget {
  final T? arguments;

  const ArgumentsProvider({
    required this.arguments,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant ArgumentsProvider oldWidget) =>
      oldWidget.arguments != arguments;

  static T? of<T>(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ArgumentsProvider<T>>();
    if (scope == null) {
      throw NoElementInContextException<ArgumentsProvider<T>>();
    }
    return scope.arguments;
  }
}