import 'package:flutter/material.dart';

abstract class EduShadows {
  const EduShadows._();

  static List<BoxShadow> elevatedShadow(
    MaterialColor primary,
  ) => [
    BoxShadow(color: primary.withOpacity(0.3), offset: const Offset(0, 2), blurRadius: 10),
  ];
}