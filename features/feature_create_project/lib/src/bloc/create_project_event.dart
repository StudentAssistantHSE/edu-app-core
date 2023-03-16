part of 'create_project_bloc.dart';

abstract class CreateProjectEvent extends Equatable {
  @override
  List<Object> get props => [];

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