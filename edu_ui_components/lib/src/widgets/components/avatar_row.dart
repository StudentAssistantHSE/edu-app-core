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
  Widget build(BuildContext context) => Row(
    children: [
      AvatarWithPlaceholder(
        placeholderText: text,
        avatar: avatar,
        radius: 16,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      if (action != null)
        const SizedBox(width: 8),
      if (action != null)
        action!,
    ],
  );
}