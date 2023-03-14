import 'package:edu_ui_components/src/base/navigation.dart';
import 'package:edu_ui_components/src/base/navigation_provider.dart';
import 'package:edu_ui_components/src/widgets/shared_routes/shared_routes_navigator.dart' show OnGenerateRoute;
import 'package:flutter/material.dart';

class SharedRoutesNavigatorItem extends StatelessWidget {
  final String initialRoute;
  final Navigation navigation;
  final OnGenerateRoute? onGenerateRoute;
  final bool visible;

  const SharedRoutesNavigatorItem({
    required this.initialRoute,
    required this.navigation,
    this.onGenerateRoute,
    this.visible = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => NavigationProvider(
    navigation: navigation,
    child: Visibility(
      visible: visible,
      maintainState: true,
      maintainAnimation: true,
      child: Navigator(
        key: navigation.navigationKey,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        observers: [HeroController()],
      ),
    ),
  );
}