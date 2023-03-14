part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => const [];

  const LoginEvent();
}

class LoginEmailFieldChanged extends LoginEvent {
  final String email;

  @override
  List<Object> get props => [email];

  const LoginEmailFieldChanged(this.email);
}

class LoginPasswordFieldChanged extends LoginEvent {
  final String password;

  @override
  List<Object> get props => [password];

  const LoginPasswordFieldChanged(this.password);
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}