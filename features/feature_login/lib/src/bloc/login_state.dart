part of 'login_bloc.dart';

enum LoginStatus {
  notSubmitted,
  inProgress,
  success,
  incorrectCredentials,
  connectionError,
  undefinedError,
}

extension LoginStatusX on LoginStatus {
  bool get isInProgress => this == LoginStatus.inProgress;
  bool get isSuccess => this == LoginStatus.success;
}

class LoginState extends Equatable {
  final LoginStatus status;
  final EmailField email;
  final PasswordField password;
  final NotNullObjectWrapper<String> resultToken;

  bool get isInProgress => status.isInProgress;
  bool get isSuccess => status.isSuccess;

  @override
  List<Object?> get props => [status, email, password, resultToken];

  const LoginState._({
    required this.status,
    required this.email,
    required this.password,
    required this.resultToken,
  });

  const LoginState.initial() :
    status = LoginStatus.notSubmitted,
    email = const EmailField.pure(),
    password = const PasswordField.pure(),
    resultToken = const NotNullObjectWrapper(null);

  LoginState copyWith({
    LoginStatus? status,
    EmailField? email,
    PasswordField? password,
    NotNullObjectWrapper<String>? resultToken,
  }) => LoginState._(
    status: status ?? this.status,
    email: email ?? this.email,
    password: password ?? this.password,
    resultToken: resultToken ?? this.resultToken,
  );
}