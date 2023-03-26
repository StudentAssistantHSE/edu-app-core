part of 'registration_bloc.dart';

enum RegistrationStatus {
  filling,
  inProgress,
  success,
  noRepeatedPasswordMatch,
  registrationError,
  connectionError,
  undefinedError,
}

extension RegistrationStatusX on RegistrationStatus {
  bool get isSuccess => this == RegistrationStatus.success;
  bool get isInProgress => this == RegistrationStatus.inProgress;
}

class RegistrationState extends Equatable {
  final RegistrationStatus status;
  final EmailField email;
  final FullNameField fullName;
  final PasswordField password;
  final RepeatedPasswordField repeatedPassword;
  final NotNullObjectWrapper<String> resultToken;

  bool get isSuccess => status.isSuccess;
  bool get isInProgress => status.isInProgress;

  @override
  List<Object?> get props => [
    status,
    email,
    fullName,
    password,
    repeatedPassword,
    resultToken,
  ];

  const RegistrationState._({
    required this.status,
    required this.email,
    required this.fullName,
    required this.password,
    required this.repeatedPassword,
    required this.resultToken,
  });

  const RegistrationState.initial() :
    status = RegistrationStatus.filling,
    email = const EmailField.pure(),
    fullName = const FullNameField.pure(),
    password = const PasswordField.pure(),
    repeatedPassword = const RepeatedPasswordField.pure(),
    resultToken = const NotNullObjectWrapper(null);

  RegistrationState copyWith({
    RegistrationStatus? status,
    EmailField? email,
    FullNameField? fullName,
    PasswordField? password,
    RepeatedPasswordField? repeatedPassword,
    NotNullObjectWrapper<String>? resultToken,
  }) => RegistrationState._(
    status: status ?? this.status,
    email: email ?? this.email,
    fullName: fullName ?? this.fullName,
    password: password ?? this.password,
    repeatedPassword: repeatedPassword ?? this.repeatedPassword,
    resultToken: resultToken ?? this.resultToken,
  );
}