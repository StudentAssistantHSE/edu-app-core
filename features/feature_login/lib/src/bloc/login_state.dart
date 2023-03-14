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
  final FormzStatus fieldsStatus;
  final NotNullObjectWrapper<String> resultToken;

  bool get isInProgress => status.isInProgress;
  bool get isSuccess => status.isSuccess;

  @override
  List<Object?> get props => [status, email, password, fieldsStatus, resultToken];

  const LoginState._({
    required this.status,
    required this.email,
    required this.password,
    required this.fieldsStatus,
    required this.resultToken,
  });

  const LoginState.initial() :
    status = LoginStatus.notSubmitted,
    email = const EmailField.pure(),
    password = const PasswordField.pure(),
    fieldsStatus = FormzStatus.pure,
    resultToken = const NotNullObjectWrapper(null);

  LoginState copyWith({
    LoginStatus? status,
    FormzStatus? fieldsStatus,
    EmailField? email,
    PasswordField? password,
    NotNullObjectWrapper<String>? resultToken,
  }) => LoginState._(
    status: status ?? this.status,
    fieldsStatus: fieldsStatus ?? this.fieldsStatus,
    email: email ?? this.email,
    password: password ?? this.password,
    resultToken: resultToken ?? this.resultToken,
  );
}