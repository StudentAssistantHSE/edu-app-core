import 'package:edu_localizations/edu_localizations.dart';
import 'package:edu_models/edu_models.dart';
import 'package:edu_ui_components/src/icons/custom_icons.dart';
import 'package:edu_ui_components/src/themes/edu_theme.dart';
import 'package:edu_ui_components/src/widgets/app/categories_list.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_gradient_button.dart';
import 'package:edu_ui_components/src/widgets/buttons/edu_icon_button.dart';
import 'package:edu_ui_components/src/widgets/containers/edu_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectCard extends StatelessWidget {
  final S translations;
  final ProjectModel project;
  final VoidCallback? applyButtonCallback;
  final VoidCallback? editButtonCallback;

  const ProjectCard({
    required this.translations,
    required this.project,
    this.applyButtonCallback,
    this.editButtonCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = EduTheme.of(context);

    final startDate = project.startDate;
    final endDate = project.endDate;
    return EduCard(
      padding: const EdgeInsets.all(16).copyWith(top: editButtonCallback != null ? 8.0 : 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(CustomIcons.user, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(project.userFullName ?? translations.root_projects_projectCard_recommendationsText, style: theme.textTheme.body),
              ),
              if (editButtonCallback != null)
                const SizedBox(width: 8),
              if (editButtonCallback != null)
                EduIconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  icon: const Icon(CustomIcons.pencil),
                  onPressed: editButtonCallback,
                ),
            ],
          ),
          if (project.contacts != null && project.contacts!.isNotEmpty)
            ...[
              const SizedBox(height: 8),
              SelectableText('${translations.root_projects_projectCard_contactsTitle} ${project.contacts}', style: theme.textTheme.caption),
            ],
          const SizedBox(height: 8),
          Text(translations.root_projects_projectCard_nameTitle, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
          Text(project.name, style: theme.textTheme.body),
          const SizedBox(height: 8),
          Text(translations.root_projects_projectCard_descriptionTitle, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
          Text(project.description, style: theme.textTheme.body),
          if (startDate != null || endDate != null)
            ...[
              const SizedBox(height: 8),
              Text(translations.root_projects_projectCard_datesText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
              Text('${startDate != null ? DateFormat.yMd(translations.localeName).add_Hm().format(startDate) : '?'} - ${endDate != null ? DateFormat.yMd(translations.localeName).add_Hm().format(endDate) : '?'}', style: theme.textTheme.body),
            ],
          if (project.applicationDeadline != null)
            ...[
              const SizedBox(height: 8),
              Text(translations.root_projects_projectCard_applicationDeadlineText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
              Text(DateFormat.yMd(translations.localeName).add_Hm().format(project.applicationDeadline!), style: theme.textTheme.body),
            ],
          if (project.employmentType != null)
            ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(translations.root_projects_projectCard_employmentTypeText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
                  const SizedBox(width: 8),
                  Text(_translateEmploymentType(project.employmentType, translations), style: theme.textTheme.body),
                ],
              ),
            ],
          if (project.creditNumber != null)
            ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(translations.root_projects_projectCard_creditNumberText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
                  const SizedBox(width: 8),
                  Text(project.creditNumber!.toString(), style: theme.textTheme.body),
                ],
              ),
            ],
          if (project.campus != null)
            ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(translations.root_projects_projectCard_campusText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
                  const SizedBox(width: 8),
                  Text(_translateCampus(project.campus, translations), style: theme.textTheme.body),
                ],
              ),
            ],
          if (project.projectType != null)
            ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(translations.root_projects_projectCard_projectTypeText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
                  const SizedBox(width: 8),
                  Text(_translateProjectType(project.projectType, translations), style: theme.textTheme.body),
                ],
              ),
            ],
          if (project.territory != null && project.territory!.isNotEmpty)
            ...[
              const SizedBox(height: 8),
              Text(translations.root_projects_projectCard_territoryText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
              Text(project.territory!, style: theme.textTheme.body),
            ],
          if (project.skills != null && project.skills!.isNotEmpty)
            ...[
              const SizedBox(height: 8),
              Text(translations.root_projects_projectCard_skillsText, style: theme.textTheme.title.copyWith(color: theme.colorScheme.secondary500)),
              Text(project.skills!, style: theme.textTheme.body),
            ],
          if (project.participantsNumber != null || project.weeklyHours != null)
            const SizedBox(height: 16),
          if (project.participantsNumber != null || project.weeklyHours != null)
            Row(
              children: [
                if (project.participantsNumber != null)
                  Tooltip(
                    message: translations.root_projects_projectCard_participantsNumberTooltipText,
                    child: Row(
                      children: [
                        Icon(CustomIcons.user, color: theme.textTheme.caption.color),
                        const SizedBox(width: 4),
                        Text(project.participantsNumber!.toString(), style: theme.textTheme.caption.copyWith(fontSize: 16)),
                      ],
                    ),
                  ),
                if (project.participantsNumber != null && project.weeklyHours != null)
                  const SizedBox(width: 16),
                if (project.weeklyHours != null)
                  Tooltip(
                    message: translations.root_projects_projectCard_weeklyHoursTooltipText,
                    child: Row(
                      children: [
                        Icon(Icons.timer, color: theme.textTheme.caption.color),
                        const SizedBox(width: 4),
                        Text(project.weeklyHours!.toString(), style: theme.textTheme.caption.copyWith(fontSize: 16)),
                      ],
                    ),
                  ),
              ],
            ),
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
                  text: translations.root_projects_projectCard_applyButtonText,
                  onPressed: applyButtonCallback,
                ),
              ),
            ],
        ],
      ),
    );
  }

  String _translateEmploymentType(EmploymentType? employmentType, S translations) {
    if (employmentType == null) {
      return '';
    }

    switch (employmentType) {
      case EmploymentType.remote:
        return translations.root_projects_projectCard_employmentTypeRemote;
      case EmploymentType.onSiteWork:
        return translations.root_projects_projectCard_employmentTypeOnSiteWork;
      case EmploymentType.expeditions:
        return translations.root_projects_projectCard_employmentTypeExpeditions;
      case EmploymentType.internships:
        return translations.root_projects_projectCard_employmentTypeInternships;
    }
  }

  String _translateCampus(CampusType? campus, S translations) {
    if (campus == null) {
      return '';
    }

    switch (campus) {
      case CampusType.moscow:
        return translations.root_projects_projectCard_campusTypeMoscow;
      case CampusType.nizhniyNovgorod:
        return translations.root_projects_projectCard_campusTypeNizhniyNovgorod;
      case CampusType.perm:
        return translations.root_projects_projectCard_campusTypePerm;
      case CampusType.saintPetersburg:
        return translations.root_projects_projectCard_campusTypeSaintPetersburg;
    }
  }

  String _translateProjectType(ProjectType? campus, S translations) {
    if (campus == null) {
      return '';
    }

    switch (campus) {
      case ProjectType.research:
        return translations.root_projects_projectCard_projectTypeResearch;
      case ProjectType.application:
        return translations.root_projects_projectCard_projectTypeApplication;
      case ProjectType.service:
        return translations.root_projects_projectCard_projectTypeService;
    }
  }
}