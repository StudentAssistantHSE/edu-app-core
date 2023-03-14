import 'package:flutter/cupertino.dart';

class ScreenGrid extends StatelessWidget {
  static const _screenGridColumnsCount = 5;
  static const _screenGridGutter = 8.0;
  static const _screenGridMargin = 16.0;

  final Widget child;
  final int column;
  final double additionalOffset;

  const ScreenGrid({
    required this.child,
    required this.column,
    this.additionalOffset = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: getPadding(
        screenWidth: MediaQuery.of(context).size.width,
        column: column,
        additionalOffset: additionalOffset,
      ),
    ),
    child: child,
  );

  static double getPadding({
    required double screenWidth,
    required int column,
    double additionalOffset = 0,
  }) {
    final columnWidth = (
        screenWidth
            - _screenGridMargin * 2
            - (_screenGridColumnsCount - 1) * _screenGridGutter
    ) / _screenGridColumnsCount;

    return _screenGridMargin
        + column * (columnWidth + _screenGridGutter)
        + additionalOffset;
  }
}