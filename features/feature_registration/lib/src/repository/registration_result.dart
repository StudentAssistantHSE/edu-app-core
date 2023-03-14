import 'package:edu_core/edu_core.dart';

class RegistrationResult {
  final String? token;
  final String? errorMessage;

  String get requireToken => token ?? (throw const UnexpectedStateException('Registration token is empty'));

  const RegistrationResult({
    this.token,
    this.errorMessage,
  });
}