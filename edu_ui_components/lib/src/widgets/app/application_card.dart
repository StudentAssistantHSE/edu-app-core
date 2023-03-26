import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_models/edu_models.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_gradient_button.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_outlined_button.dart';
import 'package:edu_ui_components/src/widgets/containers/edu_card.dart';
import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  final S translations;
  final ApplicationModel application;
  final void Function(StatusType)? onProcessApplication;

  const ApplicationCard({
    required this.translations,
    required this.application,
    this.onProcessApplication,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);

    return EduCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '${translations.root_applications_applicationCard_statusTitle} ',
              style: theme.textTheme.body,
              children: [
                TextSpan(
                  text: application.status.isAccepted
                      ? translations.root_applications_applicationCard_statusAcceptedText
                      : application.status.isRejected
                      ? translations.root_applications_applicationCard_statusRejectedText
                      : translations.root_applications_applicationCard_statusAppliedText,
                  style: TextStyle(
                    color: application.status.isAccepted
                        ? theme.colorScheme.success600
                        : application.status.isRejected
                        ? theme.colorScheme.error500
                        : null,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(translations.root_applications_applicationCard_messageTitle, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
          Text(application.message, style: theme.textTheme.body),
          if (onProcessApplication != null && (!application.status.isRejected || !application.status.isAccepted))
            ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  if (!application.status.isRejected)
                    Expanded(
                      child: EduOutlinedButton(
                        text: translations.root_applications_applicationCard_processApplicationRejectText,
                        onPressed: () => onProcessApplication?.call(StatusType.rejected),
                      ),
                    ),
                  if (!application.status.isRejected && !application.status.isAccepted)
                  const SizedBox(width: 16),
                  if (!application.status.isAccepted)
                    Expanded(
                      child: EduGradientButton(
                        text: translations.root_applications_applicationCard_processApplicationAcceptText,
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