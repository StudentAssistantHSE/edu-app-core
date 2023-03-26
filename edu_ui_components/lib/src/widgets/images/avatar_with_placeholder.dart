import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/models.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AvatarWithPlaceholder extends StatefulWidget {
  final String placeholderText;
  final String? avatar;
  final double? radius;
  final double? minRadius;
  final double? maxRadius;

  const AvatarWithPlaceholder({
    required this.placeholderText,
    this.avatar,
    this.radius,
    this.minRadius,
    this.maxRadius,
    super.key,
  }) : assert(radius == null || (minRadius == null && maxRadius == null));

  @override
  _AvatarWithPlaceholder createState() => _AvatarWithPlaceholder();
}

class _AvatarWithPlaceholder extends State<AvatarWithPlaceholder> {
  bool _avatarLoadingError = false;

  @override
  void didUpdateWidget(AvatarWithPlaceholder oldWidget) {
    if (oldWidget.avatar != widget.avatar) {
      _avatarLoadingError = false;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    final minDiameter = _minDiameter(theme.avatarWithPlaceholderTheme);
    final maxDiameter = _maxDiameter(theme.avatarWithPlaceholderTheme);
    final colorScheme = _getColorScheme(widget.placeholderText, theme.avatarWithPlaceholderTheme);
    final avatar = widget.avatar;
    final fadeInTransition = theme.avatarWithPlaceholderTheme.fadeInTransition
        .resolveTransitionsTheme(theme.transitionsTheme);

    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: minDiameter,
        minWidth: minDiameter,
        maxWidth: maxDiameter,
        maxHeight: maxDiameter,
      ),
      duration: fadeInTransition.duration,
      curve: fadeInTransition.curve,
      decoration: BoxDecoration(
        color: _avatarLoadingError || avatar == null
            ? colorScheme.first.resolveColorScheme(theme.colorScheme)
            : theme.avatarWithPlaceholderTheme.backgroundColor.resolveColorScheme(theme.colorScheme),
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FittedBox(
          child: AnimatedOpacity(
            duration: fadeInTransition.duration,
            curve: fadeInTransition.curve,
            opacity: _avatarLoadingError || avatar == null ? 1.0 : 0.0,
            child: Text(
              _getFirstCharacter(widget.placeholderText).toUpperCase(),
              style: theme.avatarWithPlaceholderTheme.letterStyle.resolveTextTheme(theme.textTheme)
                  .copyWith(color: colorScheme.second.resolveColorScheme(theme.colorScheme)),
            ),
          ),
        ),
      ),
      foregroundDecoration: BoxDecoration(
        shape: BoxShape.circle,
        image: avatar != null
            ? DecorationImage(
                image: ExtendedNetworkImageProvider(
                  avatar,
                  cache: true,
                  retries: 3,
                  timeRetry: const Duration(seconds: 1),
                ),
                onError: (_, __) => setState(() => _avatarLoadingError = true),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }

  double _minDiameter(AvatarWithPlaceholderTheme theme) {
    if (widget.radius == null && widget.minRadius == null && widget.maxRadius == null) {
      return theme.radius * 2.0;
    }
    return 2.0 * (widget.radius ?? widget.minRadius ?? theme.minRadius);
  }

  double _maxDiameter(AvatarWithPlaceholderTheme theme) {
    if (widget.radius == null && widget.minRadius == null && widget.maxRadius == null) {
      return theme.radius * 2.0;
    }
    return 2.0 * (widget.radius ?? widget.maxRadius ?? theme.maxRadius);
  }

  Pair<ColorSchemeReference, ColorSchemeReference> _getColorScheme(String text, AvatarWithPlaceholderTheme theme) {
    final textLower = text.toLowerCase();
    var hash = 0;
    for (var i = 0; i < textLower.length; i++) {
      hash = textLower.codeUnitAt(i) + ((hash << 5) - hash);
    }

    return theme.colors[hash % theme.colors.length];
  }

  String _getFirstCharacter(String text) {
    String? character;
    final regex = RegExp(r'\p{L}|\d', unicode: true);
    for (var i = 0; i < text.length; i++) {
      if (regex.hasMatch(text[i])) {
        character = text[i];
        break;
      }
    }
    if (character == null) {
      return text.isEmpty ? '' : text[0];
    }
    return character;
  }
}