part of 'create_project_bloc.dart';

enum CreateProjectStatus {
  notSubmitted,
  inProgress,
  success,
  notAuthorized,
  connectionError,
  undefinedError,
}

class CreateProjectState extends Equatable {
  final CreateProjectStatus status;
  final NameField name;
  final DescriptionField description;
  final ContactsField contacts;
  final NotNullObjectWrapper<DateTime> startDateTime;
  final NotNullObjectWrapper<DateTime> endDateTime;
  final NotNullObjectWrapper<DateTime> applicationDeadline;
  final NotNullObjectWrapper<EmploymentType> employmentType;
  final TerritoryField territory;
  final SkillsField skills;
  final NotNullObjectWrapper<int> creditNumber;
  final NotNullObjectWrapper<CampusType> campus;
  final NotNullObjectWrapper<int> participantsNumber;
  final NotNullObjectWrapper<ProjectType> projectType;
  final NotNullObjectWrapper<int> weeklyHours;
  final List<Category> categories;

  bool get isSuccess => status == CreateProjectStatus.success;
  bool get isInProgress => status == CreateProjectStatus.inProgress;

  @override
  List<Object?> get props => [
    status,
    name,
    description,
    contacts,
    startDateTime,
    endDateTime,
    applicationDeadline,
    employmentType,
    territory,
    skills,
    creditNumber,
    campus,
    participantsNumber,
    projectType,
    weeklyHours,
    categories,
    categories,
  ];

  const CreateProjectState._({
    required this.status,
    required this.name,
    required this.description,
    required this.contacts,
    required this.startDateTime,
    required this.endDateTime,
    required this.applicationDeadline,
    required this.employmentType,
    required this.territory,
    required this.skills,
    required this.creditNumber,
    required this.campus,
    required this.participantsNumber,
    required this.projectType,
    required this.weeklyHours,
    required this.categories,
  });

  const CreateProjectState.initial() :
      status = CreateProjectStatus.notSubmitted,
      name = const NameField.pure(),
      description = const DescriptionField.pure(),
      contacts = const ContactsField.pure(),
      startDateTime = const NotNullObjectWrapper(null),
      endDateTime = const NotNullObjectWrapper(null),
      applicationDeadline = const NotNullObjectWrapper(null),
      employmentType = const NotNullObjectWrapper(null),
      territory = const TerritoryField.pure(),
      skills = const SkillsField.pure(),
      creditNumber = const NotNullObjectWrapper(null),
      campus = const NotNullObjectWrapper(null),
      participantsNumber = const NotNullObjectWrapper(null),
      projectType = const NotNullObjectWrapper(null),
      weeklyHours = const NotNullObjectWrapper(null),
      categories = const [];

  CreateProjectState copyWith({
    CreateProjectStatus? status,
    NameField? name,
    DescriptionField? description,
    ContactsField? contacts,
    NotNullObjectWrapper<DateTime>? startDateTime,
    NotNullObjectWrapper<DateTime>? endDateTime,
    NotNullObjectWrapper<DateTime>? applicationDeadline,
    NotNullObjectWrapper<EmploymentType>? employmentType,
    TerritoryField? territory,
    SkillsField? skills,
    NotNullObjectWrapper<int>? creditNumber,
    NotNullObjectWrapper<CampusType>? campus,
    NotNullObjectWrapper<int>? participantsNumber,
    NotNullObjectWrapper<ProjectType>? projectType,
    NotNullObjectWrapper<int>? weeklyHours,
    List<Category>? categories,
  }) => CreateProjectState._(
    status: status ?? this.status,
    name: name ?? this.name,
    description: description ?? this.description,
    contacts: contacts ?? this.contacts,
    startDateTime: startDateTime ?? this.startDateTime,
    endDateTime: endDateTime ?? this.endDateTime,
    applicationDeadline: applicationDeadline ?? this.applicationDeadline,
    employmentType: employmentType ?? this.employmentType,
    territory: territory ?? this.territory,
    skills: skills ?? this.skills,
    creditNumber: creditNumber ?? this.creditNumber,
    campus: campus ?? this.campus,
    participantsNumber: participantsNumber ?? this.participantsNumber,
    projectType: projectType ?? this.projectType,
    weeklyHours: weeklyHours ?? this.weeklyHours,
    categories: categories ?? this.categories,
  );
}