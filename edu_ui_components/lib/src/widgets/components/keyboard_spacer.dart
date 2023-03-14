import 'package:flutter/material.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';

class KeyboardSpacer extends StatelessWidget {
  const KeyboardSpacer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => KeyboardAware(
    builder: (context, options) => SizedBox(
      height: options.keyboardHeight,
    ),
  );
}