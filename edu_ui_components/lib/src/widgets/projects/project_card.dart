import 'package:edu_models/edu_models.dart';
import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_themes.dart';
import 'package:edu_ui_components/src/widgets/buttons/primary_button.dart';
import 'package:edu_ui_components/src/widgets/containers/edu_card.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String contactsTitle;
  final String nameTitle;
  final String descriptionTitle;
  final String applyButtonText;
  final ProjectModel project;
  final VoidCallback? applyButtonCallback;

  const ProjectCard({
    required this.contactsTitle,
    required this.nameTitle,
    required this.descriptionTitle,
    required this.applyButtonText,
    required this.project,
    this.applyButtonCallback,
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
          Row(
            children: [
              const Icon(CustomIcons.user, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(project.userFullName, style: theme.textTheme.bodyMedium),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (project.contacts != null)
            SelectableText('$contactsTitle ${project.contacts}', style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          Text(nameTitle, style: titleStyle),
          Text(project.name, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 8),
          Text(descriptionTitle, style: titleStyle),
          Text(project.description, style: theme.textTheme.bodyLarge),
          if (project.categories.isNotEmpty)
            ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final category in project.categories)
                    Chip(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                      backgroundColor: theme.colorScheme.primary,
                      label: Text(
                        category.category,
                        style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary),
                      ),
                    ),
                ],
              ),
            ],
          if (applyButtonCallback != null)
            ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: PrimaryButton(
                  text: applyButtonText,
                  onPressed: applyButtonCallback,
                ),
              ),
            ],
        ],
      ),
    );
  }
}