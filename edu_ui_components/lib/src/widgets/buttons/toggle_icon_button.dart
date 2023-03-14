import 'package:flutter/material.dart';

enum ToggleIconState {
  firstSelected,
  secondSelected,
  nothingSelected,
}

class ToggleIconButton extends StatefulWidget {
  final ToggleIconState state;
  final Widget? firstIcon;
  final Widget? secondIcon;
  final bool enabled;

  const ToggleIconButton({
    required this.state,
    this.firstIcon,
    this.secondIcon,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  _ToggleIconButtonState createState() => _ToggleIconButtonState();
}

class _ToggleIconButtonState extends State<ToggleIconButton> {
  @override
  Widget build(BuildContext context) => const SizedBox(

  );
}