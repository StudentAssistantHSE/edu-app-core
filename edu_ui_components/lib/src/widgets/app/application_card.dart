import 'package:edu_models/edu_models.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_gradient_button.dart';
import 'package:edu_ui_components/src/widgets/containers/edu_card.dart';
import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  final String messageTitle;
  final String statusTitle;
  final String statusAppliedText;
  final String statusRejectedText;
  final String statusAcceptedText;
  final String processApplicationAcceptText;
  final String processApplicationRejectText;
  final ApplicationModel application;
  final void Function(StatusType)? onProcessApplication;

  const ApplicationCard({
    required this.messageTitle,
    required this.statusTitle,
    required this.statusAppliedText,
    required this.statusRejectedText,
    required this.statusAcceptedText,
    required this.processApplicationAcceptText,
    required this.processApplicationRejectText,
    required this.application,
    this.onProcessApplication,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.secondary);

    return EduCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '$statusTitle ',
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
                        ? const Color(0xFF6EAE40)
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
          if (onProcessApplication != null)
            ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: EduGradientButton(
                      text: processApplicationRejectText,
                      onPressed: () => onProcessApplication?.call(StatusType.rejected),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: EduGradientButton(
                      text: processApplicationAcceptText,
                      onPressed: () => onProcessApplication?.call(StatusType.accepted),
                    ),
                  ),
                ],
              ),
            ],
        ],
      ),
    );
  }
}