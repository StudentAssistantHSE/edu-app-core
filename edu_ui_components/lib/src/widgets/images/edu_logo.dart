import 'package:edu_ui_components/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EduLogo extends StatelessWidget {
  final Color? color;
  final bool animated;

  const EduLogo({ this.color, this.animated = false, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.onPrimary;
    Widget logo = Padding(
      child: Image.asset(
        Assets.logo,
        fit: BoxFit.contain,
        package: Assets.packageName,
        color: color,
      ),
      padding: const EdgeInsets.all(2),
    );

    if (animated) {
      logo = Shimmer.fromColors(
        baseColor: color,
        highlightColor: color.withOpacity(0.38),
        period: const Duration(seconds: 5),
        child: logo,
      );
    }
    return logo;
  }
}