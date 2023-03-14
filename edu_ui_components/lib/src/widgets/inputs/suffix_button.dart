import 'package:flutter/material.dart';

class SuffixButton extends StatelessWidget {
  final Icon icon;
  final bool enabled;
  final VoidCallback? onPressed;

  const SuffixButton({
    required this.icon,
    this.enabled = true,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
    canRequestFocus: false,
    onTap: enabled ? onPressed : null,
    child: icon,
  );
}