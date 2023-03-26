part of 'profile_editing_bloc.dart';

abstract class ProfileEditingEvent extends Equatable {
  @override
  List<Object> get props => const [];

  const ProfileEditingEvent();
}

class ProfileEditingEmailFieldChanged extends ProfileEditingEvent {
  final String email;

  @override
  List<Object> get props => [email];

  const ProfileEditingEmailFieldChanged(this.email);
}

class ProfileEditingFullNameFieldChanged extends ProfileEditingEvent {
  final String fullName;

  @override
  List<Object> get props => [fullName];

  const ProfileEditingFullNameFieldChanged(this.fullName);
}

class ProfileEditingBioFieldChanged extends ProfileEditingEvent {
  final String bio;

  @override
  List<Object> get props => [bio];

  const ProfileEditingBioFieldChanged(this.bio);
}

abstract class ProfileEditingExistingCategoryEvent extends ProfileEditingEvent {
  final int id;

  @override
  List<Object> get props => [id];

  const ProfileEditingExistingCategoryEvent(this.id);
}

abstract class ProfileEditingCustomCategoryEvent extends ProfileEditingEvent {
  final String category;

  @override
  List<Object> get props => [category];

  const ProfileEditingCustomCategoryEvent(this.category);
}

class ProfileEditingExistingCategoryAdded extends ProfileEditingExistingCategoryEvent {
  final String text;

  @override
  List<Object> get props => [id, text];

  const ProfileEditingExistingCategoryAdded(super.id, this.text);
}

class ProfileEditingExistingCategoryRemoved extends ProfileEditingExistingCategoryEvent {
  const ProfileEditingExistingCategoryRemoved(super.id);
}

class ProfileEditingCustomCategoryAdded extends ProfileEditingCustomCategoryEvent {
  const ProfileEditingCustomCategoryAdded(super.category);
}

class ProfileEditingCustomCategoryRemoved extends ProfileEditingCustomCategoryEvent {
  const ProfileEditingCustomCategoryRemoved(super.category);
}

class ProfileEditingSubmitted extends ProfileEditingEvent {
  const ProfileEditingSubmitted();
}

class ProfileEditingFacultyChanged extends ProfileEditingEvent {
  final FacultyModel faculty;

  @override
  List<Object> get props => [faculty];

  const ProfileEditingFacultyChanged(this.faculty);
}