import 'package:edu_core/edu_core.dart';
import 'package:edu_models/edu_models.dart';

enum ModelsListProviderResultType {
  success,
  error,
  notAuthorized,
}

class ModelsListProviderResult<T extends BaseModel> {
  final ModelsListProviderResultType resultType;
  final List<T>? models;
  final int? count;

  List<T> get requireModels => models
      ?? (throw const UnexpectedStateException('ModelsListProviderResult result is empty'));

  const ModelsListProviderResult({
    required this.resultType,
    this.models,
    this.count,
  });
}