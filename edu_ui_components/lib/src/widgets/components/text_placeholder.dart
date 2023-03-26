import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:edu_ui_components/src/widgets/components/loading_shimmer.dart';
import 'package:flutter/material.dart';

class TextPlaceholder extends StatelessWidget {
  final TextThemeReference textStyle;

  const TextPlaceholder({ required this.textStyle, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final textStyle = this.textStyle.resolveTextTheme(theme.textTheme);

    return LoadingShimmer(
      child: Container(
        width: double.infinity,
        height: (textStyle.height ?? 0) * (textStyle.fontSize ?? 0),
        decoration: BoxDecoration(
          color: theme.loadingShimmerTheme.baseColor.resolveColorScheme(theme.colorScheme),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
      ),
    );
  }
}