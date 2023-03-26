import 'package:edu_ui_components/src/widgets/components/edu_divider.dart';
import 'package:edu_ui_components/src/widgets/components/scroll_divider_mixin.dart';
import 'package:flutter/material.dart';

class ScrollDivider extends StatefulWidgetWithScrollController {
  const ScrollDivider({ super.scrollController, Key? key }) : super(key: key);

  @override
  _ScrollDividerState createState() => _ScrollDividerState();
}

class _ScrollDividerState extends State<ScrollDivider> with ScrollDividerMixin {
  @override
  Widget build(BuildContext context) => Opacity(
    opacity: scrollDividerOpacity,
    child: const EduDivider(usePadding: false),
  );
}