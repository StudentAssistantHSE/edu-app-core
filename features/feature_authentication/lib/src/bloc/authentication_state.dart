part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final NotNullObjectWrapper<String> token;

  bool get isAuthenticated => token.value?.isNotEmpty ?? false;

  @override
  List<Object?> get props => [token];

  const AuthenticationState({
    required this.token,
  });

  AuthenticationState copyWith({
    NotNullObjectWrapper<String>? token,
  }) => AuthenticationState(
    token: token ?? this.token,
  );
}