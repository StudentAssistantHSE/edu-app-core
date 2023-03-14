import 'package:edu_core/edu_core.dart';

class LoginResult {
  final String? token;
  final String? errorMessage;

  String get requireToken => token ?? (throw const UnexpectedStateException('Login token is empty'));

  const LoginResult({
    this.token,
    this.errorMessage,
  });
}