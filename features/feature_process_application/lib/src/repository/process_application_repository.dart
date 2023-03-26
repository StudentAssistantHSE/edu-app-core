import 'package:edu_models/edu_models.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_process_application/src/repository/process_application_body_parameters.dart';
import 'package:feature_process_application/src/repository/process_application_paths.dart';
import 'package:feature_process_application/src/repository/process_application_result.dart';

class ProcessApplicationRepository {
  final NetworkRepository _networkRepository;

  const ProcessApplicationRepository(
    this._networkRepository,
  );

  Future<ProcessApplicationResult> processApplication({
    required int applicationId,
    required StatusType action,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      ProcessApplicationPaths.processApplication,
      Method.post,
      body: <String, dynamic> {
        ProcessApplicationBodyParameters.applicationId: applicationId,
        ProcessApplicationBodyParameters.action: action.isRejected
            ? 2
            : action.isAccepted
            ? 3
            : throw UnimplementedError('Not implemented process application action $action'),
      },
    );

    if (response.isSuccess) {
      return ProcessApplicationResult.success;
    }

    if (response.statusCode == 403) {
      return ProcessApplicationResult.notAuthorized;
    }

    return ProcessApplicationResult.error;
  }
}