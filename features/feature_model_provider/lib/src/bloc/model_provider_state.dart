part of 'model_provider_bloc.dart';

enum ModelProviderStatus {
  notStarted,
  loading,
  success,
  connectionError,
  undefinedError,

  notAuthorized,
}

class ModelProviderState<T extends BaseModel> extends Equatable {
  final ModelProviderStatus status;
  final NotNullObjectWrapper<T> model;

  @override
  List<Object?> get props => [status, model];

  const ModelProviderState._({
    required this.status,
    required this.model,
  });

  const ModelProviderState.initial() :
      status = ModelProviderStatus.notStarted,
      model = const NotNullObjectWrapper(null);

  ModelProviderState<T> copyWith({
    ModelProviderStatus? status,
    NotNullObjectWrapper<T>? model,
  }) => ModelProviderState<T>._(
    status: status ?? this.status,
    model: model ?? this.model,
  );
}