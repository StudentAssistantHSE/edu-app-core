import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_profile_editing/src/repository/profile_editing_body_parameters.dart';
import 'package:feature_profile_editing/src/repository/profile_editing_paths.dart';
import 'package:feature_profile_editing/src/repository/profile_editing_result.dart';

class ProfileEditingRepository {
  final NetworkRepository _networkRepository;

  const ProfileEditingRepository(this._networkRepository);

  Future<ProfileEditingResult> patch({
    required String email,
    required String fullName,
    required int? facultyId,
    required String? bio,
    required List<int> categories,
    required List<String> customCategories,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      ProfileEditingPaths.patch,
      Method.patch,
      body: <String, dynamic>{
        ProfileEditingBodyParameters.email: email.toLowerCase(),
        ProfileEditingBodyParameters.fullName: fullName,
        if (facultyId != null)
          ProfileEditingBodyParameters.facultyId: facultyId,
        if (bio != null)
          ProfileEditingBodyParameters.bio: bio,
        ProfileEditingBodyParameters.categories: categories,
        ProfileEditingBodyParameters.customCategories: customCategories,
      },
    );

    if (response.isSuccess) {
      return ProfileEditingResult.success;
    }

    if (response.statusCode == 403) {
      return ProfileEditingResult.notAuthorized;
    }

    return ProfileEditingResult.error;
  }
}