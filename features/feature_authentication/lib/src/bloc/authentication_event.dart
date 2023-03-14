part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => const [];

  const AuthenticationEvent();
}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final String token;

  @override
  List<Object> get props => [token];

  const AuthenticationLoggedIn(this.token);
}

class AuthenticationLoggedOut extends AuthenticationEvent {
  @override
  List<Object> get props => const [];

  const AuthenticationLoggedOut();
}