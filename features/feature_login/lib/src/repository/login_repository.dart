import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_login/src/repository/login_body_parameters.dart';
import 'package:feature_login/src/repository/login_paths.dart';
import 'package:feature_login/src/repository/login_result.dart';

class LoginRepository {
  final NetworkRepository _networkRepository;

  const LoginRepository(this._networkRepository);

  Future<LoginResult> login({
    required String email,
    required String password,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      LoginPaths.login,
      Method.post,
      body: <String, String>{
        LoginBodyParameters.email: email.toLowerCase(),
        LoginBodyParameters.password: password,
      },
    );

    if (response.isSuccess) {
      final token = response.requireData['token'] as String;
      return LoginResult(token: token);
    }

    return LoginResult(
      errorMessage: response.errorMessage,
    );
  }
}