import 'package:edu_core/src/exceptions/unexpected_state_exception.dart';
import 'package:flutter/widgets.dart';

extension NavigatorKeyExtension on GlobalKey<NavigatorState> {
  BuildContext get context {
    final currentContext = this.currentContext;
    if (currentContext == null) {
      throw const UnexpectedStateException('Navigator context is null');
    }
    return currentContext;
  }

  NavigatorState get state {
    final currentState = this.currentState;
    if (currentState == null) {
      throw const UnexpectedStateException('Navigator state is null');
    }
    return currentState;
  }
}