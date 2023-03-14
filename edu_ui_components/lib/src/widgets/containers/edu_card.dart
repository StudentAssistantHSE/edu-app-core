import 'package:edu_ui_components/src/themes/edu_shadows.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:flutter/material.dart';

class EduCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool useShadow;
  final Border? border;

  const EduCard({
    required this.child,
    this.padding,
    this.useShadow = true,
    this.border,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        boxShadow: useShadow
            ? EduShadows.elevatedShadow(colorScheme.primarySwatch)
            : null,
        color: colorScheme.surface,
        border: border,
      ),
      padding: padding,
      child: child,
    );
  }
}