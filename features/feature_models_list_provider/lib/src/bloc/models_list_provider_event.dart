part of 'models_list_provider_bloc.dart';

abstract class ModelsListProviderEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const ModelsListProviderEvent();
}

abstract class ModelsListProviderLoadingEvent extends ModelsListProviderEvent {
  final Map<String, dynamic>? queryParameters;

  @override
  List<Object?> get props => [queryParameters];

  const ModelsListProviderLoadingEvent({
    this.queryParameters,
  });
}

class ModelsListProviderRefreshRequested extends ModelsListProviderLoadingEvent {
  final bool refreshState;

  @override
  List<Object?> get props => [refreshState, super.queryParameters];

  const ModelsListProviderRefreshRequested({
    this.refreshState = false,
    super.queryParameters,
  });
}

class ModelsListProviderNextPageRequested extends ModelsListProviderLoadingEvent {
  const ModelsListProviderNextPageRequested({
    super.queryParameters,
  });
}

class ModelsListProviderPageReloadRequested extends ModelsListProviderLoadingEvent {
  final int page;

  @override
  List<Object?> get props => [page, super.queryParameters];

  const ModelsListProviderPageReloadRequested({
    required this.page,
    super.queryParameters,
  });
}