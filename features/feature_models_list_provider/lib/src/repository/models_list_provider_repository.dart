import 'package:edu_models/edu_models.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_path.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_query_parameters.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_result.dart';

typedef FromJson<T extends BaseModel> = T Function(Map<String, dynamic> json);

class ModelsListProviderRepository<T extends BaseModel> {
  static const _defaultPageSize = 10;

  final NetworkRepository _networkRepository;
  final FromJson<T> _fromJson;

  const ModelsListProviderRepository(
    this._networkRepository,
    this._fromJson,
  );

  Future<ModelsListProviderResult<T>> loadPage({
    required ModelsListProviderPath path,
    required int page,
    int? pageSize,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _networkRepository.sendApiRequest(
      path.asPath,
      Method.get,
      queryParameters: <String, dynamic>{
        ...?queryParameters,
        ModelsListProviderQueryParameters.skip: (page - 1) * (pageSize ?? _defaultPageSize),
        ModelsListProviderQueryParameters.take: pageSize ?? _defaultPageSize,
      },
    );

    if (response.isSuccess) {
      final data = (response.requireData[path.asKey] as List<Object?>).map((e) => _fromJson(e as Map<String, dynamic>)).toList();
      return ModelsListProviderResult<T>(
        resultType: ModelsListProviderResultType.success,
        models: data,
        count: (response.requireData['count'] as int?) ?? data.length,
      );
    }

    return ModelsListProviderResult<T>(resultType: ModelsListProviderResultType.notAuthorized);
  }
}