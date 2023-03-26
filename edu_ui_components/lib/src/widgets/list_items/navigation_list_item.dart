import 'package:edu_ui_components/src/base/navigation_provider.dart';
import 'package:edu_ui_components/src/widgets/list_items/list_item.dart';
import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {
  final String route;
  final String text;

  const NavigationListItem({
    required this.route,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListItem(
    text: text,
    navigationCallback: () => NavigationProvider.of(context).pushNamed(route),
  );
}