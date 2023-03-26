import 'package:edu_models/edu_models.dart';
import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/widgets/app/categories_list.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_gradient_button.dart';
import 'package:edu_ui_components/src/widgets/containers/edu_card.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String contactsTitle;
  final String nameTitle;
  final String descriptionTitle;
  final String applyButtonText;
  final String recommendationsText;
  final ProjectModel project;
  final VoidCallback? applyButtonCallback;

  const ProjectCard({
    required this.contactsTitle,
    required this.nameTitle,
    required this.descriptionTitle,
    required this.applyButtonText,
    required this.recommendationsText,
    required this.project,
    this.applyButtonCallback,
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
          Row(
            children: [
              const Icon(CustomIcons.user, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(project.userFullName ?? recommendationsText, style: theme.textTheme.bodyMedium),
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
             CategoriesList(categories: project.categories),
            ],
          if (applyButtonCallback != null)
            ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: EduGradientButton(
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