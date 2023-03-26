import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_color_scheme.dart';
import 'package:edu_ui_components/src/themes/models/referencable/edu_text_theme.dart';
import 'package:edu_ui_components/src/widgets/images/avatar_with_placeholder.dart';
import 'package:flutter/material.dart';

class AvatarRow extends StatelessWidget {
  final String text;
  final String? avatar;
  final Widget? action;

  const AvatarRow({
    required this.text,
    this.avatar,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);
    return Row(
      children: [
        AvatarWithPlaceholder(
          key: ValueKey(avatar),
          placeholderText: text,
          avatar: avatar,
          radius: theme.avatarRowTheme.avatarRadius,
        ),
        SizedBox(width: theme.avatarRowTheme.spacer),
        Expanded(
          child: Text(
            text,
            style: theme.avatarRowTheme.textStyle.resolveTextTheme(theme.textTheme)
                .copyWith(color: theme.avatarRowTheme.foregroundColor.resolveColorScheme(theme.colorScheme)),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (action != null)
          SizedBox(width: theme.avatarRowTheme.spacer),
        if (action != null)
          action!,
      ],
    );
  }
}