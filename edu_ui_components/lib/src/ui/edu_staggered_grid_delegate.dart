import 'dart:math' as math;

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EduStaggeredGridDelegate extends SliverQuiltedGridDelegate {
  static const _tilesCount = 15;

  static const List<QuiltedGridTile> _tilesSeparator = [
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
    QuiltedGridTile(1, 1),
  ];

  static const List<List<QuiltedGridTile>> _tilesVariants = [
    [
      QuiltedGridTile(1, 1),
      QuiltedGridTile(2, 2),
      QuiltedGridTile(1, 1),
    ],
    [
      QuiltedGridTile(2, 2),
      QuiltedGridTile(1, 1),
      QuiltedGridTile(1, 1),
    ],
  ];

  EduStaggeredGridDelegate({
    required Object patternKey,
    int crossAxisCount = 3,
    double mainAxisSpacing = 8,
    double crossAxisSpacing = 8,
  }) : super(
    crossAxisCount: crossAxisCount,
    pattern: _createPattern(patternKey),
    mainAxisSpacing: mainAxisSpacing,
    crossAxisSpacing: crossAxisSpacing,
  );

  static List<QuiltedGridTile> _createPattern(Object patternKey) {
    final random = math.Random(patternKey.hashCode);
    final pattern = <QuiltedGridTile>[];
    for (var i = 0; i < _tilesCount; i++) {
      pattern.addAll(_tilesVariants[random.nextInt(_tilesVariants.length)]);
      final separatorChance = random.nextDouble();
      var separatorsCount = 0;
      if (separatorChance < 0.4) {
        separatorsCount = 1;
      } else if (separatorChance < 0.6) {
        separatorsCount = 2;
      } else if (separatorChance < 0.8) {
        separatorsCount = 3;
      }
      for (var j = 0; j < separatorsCount; j++) {
        pattern.addAll(_tilesSeparator);
      }
    }
    return pattern;
  }
}