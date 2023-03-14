import 'dart:async';

import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_registration/src/repository/registration_body_parameters.dart';
import 'package:feature_registration/src/repository/registration_paths.dart';
import 'package:feature_registration/src/repository/registration_result.dart';

class RegistrationRepository {
  final NetworkRepository _networkRepository;

  const RegistrationRepository(this._networkRepository);

  Future<RegistrationResult> register({
    required String email,
    required String fullName,
    required String password,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      RegistrationPaths.registration,
      Method.post,
      body: <String, dynamic>{
        RegistrationBodyParameters.email: email.toLowerCase(),
        RegistrationBodyParameters.fullName: fullName,
        RegistrationBodyParameters.password: password,
      },
    );

    if (response.isSuccess) {
      final token = response.requireData['token'] as String;
      return RegistrationResult(token: token);
    }

    return RegistrationResult(
      errorMessage: response.errorMessage,
    );
  }
}