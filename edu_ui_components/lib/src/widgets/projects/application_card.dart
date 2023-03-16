import 'package:edu_models/edu_models.dart';
import 'package:edu_ui_components/src/themes/edu_colors.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/widgets/containers/edu_card.dart';
import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  final String messageTitle;
  final String statusTitle;
  final String statusAppliedText;
  final String statusRejectedText;
  final String statusAcceptedText;
  final ApplicationModel application;

  const ApplicationCard({
    required this.messageTitle,
    required this.statusTitle,
    required this.statusAppliedText,
    required this.statusRejectedText,
    required this.statusAcceptedText,
    required this.application,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.titleMedium?.copyWith(color: theme.secondarySwatch);

    return EduCard(
      useShadow: false,
      padding: const EdgeInsets.all(16),
      border: Border.all(
        color: theme.onSurfaceSwatch.shade100,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: statusTitle,
              style: theme.textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: application.status.isAccepted
                      ? statusAcceptedText
                      : application.status.isRejected
                      ? statusRejectedText
                      : statusAppliedText,
                  style: TextStyle(
                    color: application.status.isAccepted
                        ? EduColors.success
                        : application.status.isRejected
                        ? theme.colorScheme.error
                        : null,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(messageTitle, style: titleStyle),
          Text(application.message, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}