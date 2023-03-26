import 'package:edu_core/edu_core.dart';
import 'package:edu_models/edu_models.dart';

enum ModelProviderResultType {
  success,
  error,
  notAuthorized,
}

class ModelProviderResult<T extends BaseModel> {
  final ModelProviderResultType resultType;
  final T? model;

  T get requireModel => model
      ?? (throw const UnexpectedStateException('ModelProviderResult result is empty'));

  const ModelProviderResult({
    required this.resultType,
    this.model,
  });
}