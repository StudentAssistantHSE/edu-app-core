import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:flutter/material.dart';

enum _EduSnackBarType {
  normal,
  error,
  success,
}

class EduSnackBar extends StatelessWidget {
  static const _snackBarsVerticalPadding = 16.0;
  static const _snackBarsHorizontalPadding = 16.0;

  final String message;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? foregroundColor;

  const EduSnackBar._({
    required this.message,
    this.icon,
    this.onTap,
    this.foregroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget snackContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          Icon(icon, color: foregroundColor, size: 24),
        if (icon != null)
          const SizedBox(height: 8),
        Row(
          children: [
            if (onTap != null)
              const SizedBox(width: 40),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).snackBarTheme.contentTextStyle?.copyWith(color: foregroundColor),
              ),
            ),
            if (onTap != null)
              const SizedBox(width: 16),
            if (onTap != null)
              const Icon(Icons.arrow_forward_ios_rounded, size: 24),
          ],
        ),
      ],
    );

    if (onTap != null) {
      snackContent = GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: snackContent,
      );
    }

    return snackContent;
  }

  static void showError(BuildContext context, { required String message }) =>
      _show(
        context,
        message,
        type: _EduSnackBarType.error,
      );

  static void _show(
    BuildContext context,
    String message, {
    _EduSnackBarType type = _EduSnackBarType.normal,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Color backgroundColor;
    final Color foregroundColor;
    final Color borderColor;
    final IconData? icon;
    switch (type) {
      case _EduSnackBarType.normal:
        backgroundColor = colorScheme.surface;
        foregroundColor = colorScheme.onSurface;
        borderColor = colorScheme.primary;
        icon = null;
        break;
      case _EduSnackBarType.error:
        backgroundColor = colorScheme.errorContainer;
        foregroundColor = colorScheme.error;
        borderColor = colorScheme.error;
        icon = CustomIcons.exclamation;
        break;
      case _EduSnackBarType.success:
        throw UnimplementedError('Unimplemented success color palette');
    }

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          padding: EdgeInsets.fromLTRB(
            _snackBarsHorizontalPadding,
            _snackBarsVerticalPadding + MediaQuery.of(context).padding.bottom,
            _snackBarsHorizontalPadding,
            _snackBarsVerticalPadding,
          ),
          duration: const Duration(seconds: 2),
          content: EduSnackBar._(
            message: message,
            foregroundColor: foregroundColor,
            icon: icon,
          ),
          backgroundColor: backgroundColor,
          shape: Border(top: BorderSide(color: borderColor)),
        ),
      );
  }
}