import 'dart:math';

import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final ColorSchemeReference? color;
  final double scale;

  const LoadingIndicator({
    this.color,
    this.scale = 1,
    Key? key,
  }) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =  AnimationController(
    vsync: this,
    duration: Duration(
      milliseconds: EduTheme.of(context).loadingIndicatorTheme.duration.inMilliseconds,
    ),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final color = (widget.color ?? theme.loadingIndicatorTheme.color)
        .resolveColorScheme(theme.colorScheme);
    final dotsSize = widget.scale * theme.loadingIndicatorTheme.dotsSize;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _Flashing(
          interval: const Interval(0.1, 0.7),
          controller: _controller,
          color: color,
          size: dotsSize,
        ),
        SizedBox(width: dotsSize),
        _Flashing(
          interval: const Interval(0.2, 0.8),
          controller: _controller,
          color: color,
          child: Icon(
            CustomIcons.lightBulb,
            color: color,
            size: widget.scale * theme.loadingIndicatorTheme.iconSize,
          ),
        ),
        SizedBox(width: dotsSize),
        _Flashing(
          interval: const Interval(0.3, 0.9),
          controller: _controller,
          color: color,
          size: dotsSize,
        ),
        SizedBox(width: dotsSize),
        _Flashing(
          interval: const Interval(0.4, 1),
          controller: _controller,
          color: color,
          size: dotsSize,
        ),
      ],
    );
  }
}

class _Flashing extends StatelessWidget {
  final Interval interval;
  final AnimationController controller;
  final Widget? child;
  final Color color;
  final double? size;

  const _Flashing({
    required this.interval,
    required this.controller,
    required this.color,
    this.child,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        final flashPercent = sin(pi * interval.transform(controller.value));
        return Opacity(
          opacity: flashPercent,
          child: child ?? Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      },
    );
  }
}
