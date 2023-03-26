part of 'create_project_bloc.dart';

abstract class CreateProjectEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const CreateProjectEvent();
}

class CreateProjectNameFieldChanged extends CreateProjectEvent {
  final String name;

  @override
  List<Object> get props => [name];

  const CreateProjectNameFieldChanged(this.name);
}

class CreateProjectDescriptionFieldChanged extends CreateProjectEvent {
  final String description;

  @override
  List<Object> get props => [description];

  const CreateProjectDescriptionFieldChanged(this.description);
}

class CreateProjectContactsFieldChanged extends CreateProjectEvent {
  final String contacts;

  @override
  List<Object> get props => [contacts];

  const CreateProjectContactsFieldChanged(this.contacts);
}

class CreateProjectStartDateTimeChanged extends CreateProjectEvent {
  final DateTime? dateTime;

  @override
  List<Object?> get props => [dateTime];

  const CreateProjectStartDateTimeChanged(this.dateTime);
}

class CreateProjectEndDateTimeChanged extends CreateProjectEvent {
  final DateTime? dateTime;

  @override
  List<Object?> get props => [dateTime];

  const CreateProjectEndDateTimeChanged(this.dateTime);
}

class CreateProjectApplicationDeadlineChanged extends CreateProjectEvent {
  final DateTime? dateTime;

  @override
  List<Object?> get props => [dateTime];

  const CreateProjectApplicationDeadlineChanged(this.dateTime);
}

class CreateProjectEmploymentTypeChanged extends CreateProjectEvent {
  final EmploymentType? employmentType;

  @override
  List<Object?> get props => [employmentType];

  const CreateProjectEmploymentTypeChanged(this.employmentType);
}

class CreateProjectTerritoryFieldChanged extends CreateProjectEvent {
  final String territory;

  @override
  List<Object?> get props => [territory];

  const CreateProjectTerritoryFieldChanged(this.territory);
}

class CreateProjectSkillsFieldChanged extends CreateProjectEvent {
  final String skills;

  @override
  List<Object?> get props => [skills];

  const CreateProjectSkillsFieldChanged(this.skills);
}

class CreateProjectCreditNumberChanged extends CreateProjectEvent {
  final int? creditNumber;

  @override
  List<Object?> get props => [creditNumber];

  const CreateProjectCreditNumberChanged(this.creditNumber);
}

class CreateProjectCampusChanged extends CreateProjectEvent {
  final CampusType? campus;

  @override
  List<Object?> get props => [campus];

  const CreateProjectCampusChanged(this.campus);
}

class CreateProjectParticipantsNumberChanged extends CreateProjectEvent {
  final int? participantsNumber;

  @override
  List<Object?> get props => [participantsNumber];

  const CreateProjectParticipantsNumberChanged(this.participantsNumber);
}

class CreateProjectProjectTypeChanged extends CreateProjectEvent {
  final ProjectType? projectType;

  @override
  List<Object?> get props => [projectType];

  const CreateProjectProjectTypeChanged(this.projectType);
}

class CreateProjectWeeklyHoursChanged extends CreateProjectEvent {
  final int? weeklyHours;

  @override
  List<Object?> get props => [weeklyHours];

  const CreateProjectWeeklyHoursChanged(this.weeklyHours);
}

abstract class CreateProjectExistingCategoryEvent extends CreateProjectEvent {
  final int id;

  @override
  List<Object> get props => [id];

  const CreateProjectExistingCategoryEvent(this.id);
}

abstract class CreateProjectCustomCategoryEvent extends CreateProjectEvent {
  final String category;

  @override
  List<Object> get props => [category];

  const CreateProjectCustomCategoryEvent(this.category);
}

class CreateProjectExistingCategoryAdded extends CreateProjectExistingCategoryEvent {
  final String text;

  @override
  List<Object> get props => [id, text];

  const CreateProjectExistingCategoryAdded(super.id, this.text);
}

class CreateProjectExistingCategoryRemoved extends CreateProjectExistingCategoryEvent {
  const CreateProjectExistingCategoryRemoved(super.id);
}

class CreateProjectCustomCategoryAdded extends CreateProjectCustomCategoryEvent {
  const CreateProjectCustomCategoryAdded(super.category);
}

class CreateProjectCustomCategoryRemoved extends CreateProjectCustomCategoryEvent {
  const CreateProjectCustomCategoryRemoved(super.category);
}

class CreateProjectSubmitted extends CreateProjectEvent {
  const CreateProjectSubmitted();
}