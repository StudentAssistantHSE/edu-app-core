part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  @override
  List<Object?> get props => const [];

  const RegistrationEvent();
}

class RegistrationEmailFieldChanged extends RegistrationEvent {
  final String email;

  @override
  List<Object?> get props => [email];

  const RegistrationEmailFieldChanged(this.email);
}

class RegistrationFullNameFieldChanged extends RegistrationEvent {
  final String fullName;

  @override
  List<Object?> get props => [fullName];

  const RegistrationFullNameFieldChanged(this.fullName);
}

class RegistrationPasswordFieldChanged extends RegistrationEvent {
  final String password;

  @override
  List<Object?> get props => [password];

  const RegistrationPasswordFieldChanged(this.password);
}

class RegistrationRepeatedPasswordFieldChanged extends RegistrationEvent {
  final String repeatedPassword;

  @override
  List<Object?> get props => [repeatedPassword];

  const RegistrationRepeatedPasswordFieldChanged(this.repeatedPassword);
}

class RegistrationSubmitted extends RegistrationEvent {
  const RegistrationSubmitted();
}