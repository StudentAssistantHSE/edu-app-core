import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_create_project/src/repository/create_project_body_parameters.dart';
import 'package:feature_create_project/src/repository/create_project_paths.dart';
import 'package:feature_create_project/src/repository/create_project_result.dart';

class CreateProjectRepository {
  final NetworkRepository _networkRepository;

  const CreateProjectRepository(
    this._networkRepository,
  );

  Future<CreateProjectResult> create({
    required String name,
    required String description,
    required String contacts,
    required List<int> categories,
    required List<String> customCategories,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      CreateProjectPaths.create,
      Method.post,
      body: <String, dynamic> {
        CreateProjectBodyParameters.name: name,
        CreateProjectBodyParameters.description: description,
        CreateProjectBodyParameters.contacts: contacts,
        CreateProjectBodyParameters.categories: categories,
        CreateProjectBodyParameters.customCategories: customCategories,
      },
    );

    if (response.isSuccess) {
      return CreateProjectResult.success;
    }

    if (response.statusCode == 403) {
      return CreateProjectResult.notAuthorized;
    }

    return CreateProjectResult.error;
  }
}