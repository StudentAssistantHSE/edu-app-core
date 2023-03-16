import 'package:edu_ui_components/assets/assets.dart';
import 'package:flutter/material.dart';

class EduLogo extends StatelessWidget {
  final Color? color;

  const EduLogo({ this.color, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    child: Image.asset(
      Assets.logo,
      fit: BoxFit.contain,
      package: Assets.packageName,
    ),
    padding: const EdgeInsets.all(2),
  );
}