import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:flutter/material.dart';

class TextPlaceholder extends StatelessWidget {
  final TextStyle? textStyle;

  const TextPlaceholder({ this.textStyle, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: (textStyle?.height ?? 0) * (textStyle?.fontSize ?? 0),
      decoration: BoxDecoration(
        color: colorScheme.onSurfaceSwatch.shade50,
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
}