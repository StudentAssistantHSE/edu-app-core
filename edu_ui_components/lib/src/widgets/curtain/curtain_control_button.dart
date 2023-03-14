import 'dart:math' as math;

import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_shadows.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/widgets/curtain/bloc/curtain_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurtainControlButton extends StatelessWidget {
  final double visibleFraction;
  final Widget? content;

  const CurtainControlButton({
    required this.visibleFraction,
    this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => context.read<CurtainBloc>().add(
        visibleFraction >= 0.5 ? const CurtainCollapsed() : const CurtainExpanded(),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.surface,
          boxShadow: EduShadows.elevatedShadow(colorScheme.primarySwatch),
        ),
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 1 - visibleFraction,
                child: content,
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: content == null ? 1 : visibleFraction,
                child: Transform.rotate(
                  angle: -math.pi * visibleFraction,
                  child: Icon(
                    CustomIcons.arrowDown,
                    size: 24,
                    color: colorScheme.onSurfaceSwatch,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}