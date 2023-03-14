import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  const WaveClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width * -0.002777778, 0)
      ..lineTo(size.width * -0.002399361, size.height - 21.3101828)
      ..cubicTo(
        size.width * -0.001643161,
        size.height - 21.4458698,
        size.width * -0.0006979111,
        size.height - 21.5137365,
        size.width * 0.00005828667,
        size.height - 21.64944675,
      )
      ..cubicTo(
        size.width * 0.3189861,
        size.height - 64.17797475,
        size.width * 0.9235667,
        size.height + 37.5652575,
        size.width * 1.002778,
        size.height - 17.0373675,
      )
      ..lineTo(size.width * 1.002778, 0)
      ..lineTo(size.width * -0.002777778, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}