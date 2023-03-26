import 'package:edu_models/edu_models.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_model_provider/src/repository/model_provider_path.dart';
import 'package:feature_model_provider/src/repository/model_provider_result.dart';

typedef FromJson<T extends BaseModel> = T Function(Map<String, dynamic> json);

class ModelProviderRepository<T extends BaseModel> {
  final NetworkRepository _networkRepository;
  final FromJson<T> _fromJson;

  const ModelProviderRepository(
    this._networkRepository,
    this._fromJson,
  );

  Future<ModelProviderResult<T>> load({
    required ModelProviderPath path,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      path.asPath,
      Method.get,
    );

    if (response.isSuccess) {
      return ModelProviderResult<T>(
        resultType: ModelProviderResultType.success,
        model: _fromJson(response.requireData),
      );
    }

    if (response.statusCode == 403) {
      return ModelProviderResult<T>(resultType: ModelProviderResultType.notAuthorized);
    }

    return ModelProviderResult<T>(resultType: ModelProviderResultType.error);
  }
}