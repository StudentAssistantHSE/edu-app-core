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
  final List<Category> categories;
  final FormzStatus fieldsStatus;

  bool get isSuccess => status == CreateProjectStatus.success;
  bool get isInProgress => status == CreateProjectStatus.inProgress;

  @override
  List<Object?> get props => [status, name, description, contacts, categories, fieldsStatus];

  const CreateProjectState._({
    required this.status,
    required this.name,
    required this.description,
    required this.contacts,
    required this.categories,
    required this.fieldsStatus,
  });

  const CreateProjectState.initial() :
      status = CreateProjectStatus.notSubmitted,
      name = const NameField.pure(),
      description = const DescriptionField.pure(),
      contacts = const ContactsField.pure(),
      categories = const [],
      fieldsStatus = FormzStatus.pure;

  CreateProjectState copyWith({
    CreateProjectStatus? status,
    NameField? name,
    DescriptionField? description,
    ContactsField? contacts,
    List<Category>? categories,
    FormzStatus? fieldsStatus,
  }) => CreateProjectState._(
    status: status ?? this.status,
    name: name ?? this.name,
    description: description ?? this.description,
    contacts: contacts ?? this.contacts,
    categories: categories ?? this.categories,
    fieldsStatus: fieldsStatus ?? this.fieldsStatus,
  );
}