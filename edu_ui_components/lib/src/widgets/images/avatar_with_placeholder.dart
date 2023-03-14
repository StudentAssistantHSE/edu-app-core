import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/themes/edu_transitions.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

const _fadeInTransition = EduTransitions.standardDecelerate;
const _defaultRadius = 20.0;
const _defaultMinRadius = 0.0;
const _defaultMaxRadius = double.infinity;

class _ColorScheme {
  final Color backgroundColor;
  final Color foregroundColor;

  const _ColorScheme({
    required this.backgroundColor,
    required this.foregroundColor,
  });
}

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

  double get _minDiameter {
    if (widget.radius == null && widget.minRadius == null && widget.maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (widget.radius ?? widget.minRadius ?? _defaultMinRadius);
  }

  double get _maxDiameter {
    if (widget.radius == null && widget.minRadius == null && widget.maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (widget.radius ?? widget.maxRadius ?? _defaultMaxRadius);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minDiameter = _minDiameter;
    final maxDiameter = _maxDiameter;
    final colorScheme = _getColorScheme(widget.placeholderText, theme.colorScheme);
    final avatar = widget.avatar;

    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: minDiameter,
        minWidth: minDiameter,
        maxWidth: maxDiameter,
        maxHeight: maxDiameter,
      ),
      duration: _fadeInTransition.duration,
      curve: _fadeInTransition.curve,
      decoration: BoxDecoration(
        color: _avatarLoadingError || avatar == null
            ? colorScheme.backgroundColor
            : theme.primarySwatch.shade50,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: FittedBox(
          child: AnimatedOpacity(
            duration: _fadeInTransition.duration,
            curve: _fadeInTransition.curve,
            opacity: _avatarLoadingError || avatar == null ? 1.0 : 0.0,
            child: Text(
              _getFirstCharacter(widget.placeholderText).toUpperCase(),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.foregroundColor,
                fontWeight: FontWeight.w600,
              ),
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

  _ColorScheme _getColorScheme(String text, ColorScheme colorScheme) {
    final textLower = text.toLowerCase();
    var hash = 0;
    for (var i = 0; i < textLower.length; i++) {
      hash = textLower.codeUnitAt(i) + ((hash << 5) - hash);
    }

    switch (hash % 9) {
      case 0:
        return _ColorScheme(backgroundColor: colorScheme.primary, foregroundColor: colorScheme.onPrimary);
      case 1:
        return _ColorScheme(backgroundColor: colorScheme.secondary, foregroundColor: colorScheme.onSecondary);
      case 2:
        return _ColorScheme(backgroundColor: colorScheme.tertiary, foregroundColor: colorScheme.onTertiary);
      case 3:
        return _ColorScheme(backgroundColor: colorScheme.error, foregroundColor: colorScheme.onError);
      case 4:
        return _ColorScheme(backgroundColor: colorScheme.surfaceVariant, foregroundColor: colorScheme.onSurfaceVariant);
      case 5:
        return _ColorScheme(backgroundColor: colorScheme.primaryContainer, foregroundColor: colorScheme.onPrimaryContainer);
      case 6:
        return _ColorScheme(backgroundColor: colorScheme.secondaryContainer, foregroundColor: colorScheme.onSecondaryContainer);
      case 7:
        return _ColorScheme(backgroundColor: colorScheme.tertiaryContainer, foregroundColor: colorScheme.onTertiaryContainer);
      case 8:
        return _ColorScheme(backgroundColor: colorScheme.errorContainer, foregroundColor: colorScheme.onErrorContainer);
    }
    throw UnimplementedError('Hash for color scheme was computed incorrectly');
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