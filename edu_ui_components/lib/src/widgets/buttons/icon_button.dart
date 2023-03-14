import 'package:flutter/material.dart';

class ThemeIconButton extends StatelessWidget {
  final Widget icon;
  final double? iconSize;
  final Color? color;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final String? tooltip;

  const ThemeIconButton({
    required this.icon,
    this.iconSize,
    this.color,
    this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.tooltip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = IconTheme.of(context);
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: iconSize ?? theme.size,
      color: color ?? theme.color,
      highlightColor: Colors.transparent,
      padding: padding,
      tooltip: tooltip,
    );
  }
}