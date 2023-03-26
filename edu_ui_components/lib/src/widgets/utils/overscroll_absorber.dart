import 'package:flutter/widgets.dart';

class NoIndicatorsScrollBehaviour extends ScrollBehavior {
  const NoIndicatorsScrollBehaviour();

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}