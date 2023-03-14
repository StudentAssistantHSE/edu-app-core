part of 'models_list_provider_bloc.dart';

enum ModelsListProviderStatus {
  notStarted,
  refreshing,
  refreshingSuccess,
  loadingNextPage,
  loadingNextPageSuccess,
  reloadingPage,
  reloadingPageSuccess,
  refreshingConnectionError,
  refreshingUndefinedError,
  loadingNextPageConnectionError,
  loadingNextPageUndefinedError,
  reloadingPageConnectionError,
  reloadingPageUndefinedError,

  notAuthorized,
}

extension ModelsListProviderStatusX on ModelsListProviderStatus {
  bool get canRefresh => this != ModelsListProviderStatus.loadingNextPage;
  bool get canLoadNextPage => this != ModelsListProviderStatus.refreshing;
}

class ModelsListProviderState<T extends BaseModel> extends Equatable {
  final ModelsListProviderStatus status;
  final NotNullObjectWrapper<List<T>> models;
  final NotNullObjectWrapper<int> count;
  final int page;

  @override
  List<Object?> get props => [status, models, count, page];

  bool get canLoadNextPage => status.canLoadNextPage;

  const ModelsListProviderState._({
    required this.status,
    required this.models,
    required this.count,
    required this.page,
  });

  const ModelsListProviderState.initial() :
      status = ModelsListProviderStatus.notStarted,
      models = const NotNullObjectWrapper(null),
      count = const NotNullObjectWrapper(null),
      page = 1;

  ModelsListProviderState<T> copyWith({
    ModelsListProviderStatus? status,
    NotNullObjectWrapper<List<T>>? models,
    NotNullObjectWrapper<int>? count,
    int? page,
  }) => ModelsListProviderState<T>._(
    status: status ?? this.status,
    models: models ?? this.models,
    count: count ?? this.count,
    page: page ?? this.page,
  );
}