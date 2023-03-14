import 'dart:math';

import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final Color? color;
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
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.color ?? theme.colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _Flashing(interval: const Interval(0.1, 0.7), controller: _controller, color: color, scale: widget.scale),
        SizedBox(width: widget.scale * 6),
        _Flashing(
          interval: const Interval(0.2, 0.8),
          controller: _controller,
          color: color,
          child: Icon(CustomIcons.lightBulb, color: color, size: widget.scale * 20),
          scale: widget.scale,
        ),
        SizedBox(width: widget.scale * 6),
        _Flashing(interval: const Interval(0.3, 0.9), controller: _controller, color: color, scale: widget.scale),
        SizedBox(width: widget.scale * 6),
        _Flashing(interval: const Interval(0.4, 1), controller: _controller, color: color, scale: widget.scale),
      ],
    );
  }
}

class _Flashing extends StatelessWidget {
  final Interval interval;
  final AnimationController controller;
  final Widget? child;
  final Color color;
  final double scale;

  const _Flashing({
    required this.interval,
    required this.controller,
    required this.color,
    this.child,
    this.scale = 1,
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
            width: scale * 6,
            height: scale * 6,
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
