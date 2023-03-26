import 'package:edu_models/edu_models.dart';
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
    required int? initialId,
    required String name,
    required String description,
    required String contacts,
    required DateTime? startDateTime,
    required DateTime? endDateTime,
    required DateTime? applicationDeadline,
    required EmploymentType? employmentType,
    required String territory,
    required String skills,
    required int? creditNumber,
    required CampusType? campus,
    required int? participantsNumber,
    required ProjectType? projectType,
    required int? weeklyHours,
    required List<int> categories,
    required List<String> customCategories,
  }) async {
    final project = ProjectModel(
      id: -1,
      name: name.trim(),
      description: description.trim(),
      contacts: contacts.trim(),
      startDate: startDateTime,
      endDate: endDateTime,
      applicationDeadline: applicationDeadline,
      employmentType: employmentType,
      territory: territory.trim().isEmpty ? null : territory.trim(),
      skills: skills.trim().isEmpty ? null : skills.trim(),
      creditNumber: creditNumber,
      campus: campus,
      participantsNumber: participantsNumber,
      projectType: projectType,
      weeklyHours: weeklyHours,
      isClosed: false,
      userFullName: null,
      categories: const [],
    ).toJson();

    final response = await _networkRepository.sendApiRequest(
      CreateProjectPaths.create,
      initialId != null ? Method.patch : Method.post,
      body: <String, dynamic> {
        ...project..remove('id')..remove('isClosed')..remove('userFullName')..remove('categories'),
        if (initialId != null)
          CreateProjectBodyParameters.projectId: initialId,
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