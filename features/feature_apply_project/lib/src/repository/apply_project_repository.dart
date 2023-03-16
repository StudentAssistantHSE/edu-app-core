import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_apply_project/src/repository/apply_project_body_parameters.dart';
import 'package:feature_apply_project/src/repository/apply_project_paths.dart';
import 'package:feature_apply_project/src/repository/apply_project_result.dart';

class ApplyProjectRepository {
  final NetworkRepository _networkRepository;

  const ApplyProjectRepository(
    this._networkRepository,
  );

  Future<ApplyProjectResult> apply({
    required int projectId,
    required String message,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      ApplyProjectPaths.apply,
      Method.post,
      body: <String, dynamic> {
        ApplyProjectBodyParameters.projectId: projectId,
        ApplyProjectBodyParameters.message: message,
      },
    );

    if (response.isSuccess) {
      return ApplyProjectResult.success;
    }

    if (response.statusCode == 403) {
      return ApplyProjectResult.notAuthorized;
    }

    return ApplyProjectResult.alreadyApplied;
  }
}