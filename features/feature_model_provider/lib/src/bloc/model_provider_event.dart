part of 'model_provider_bloc.dart';

abstract class ModelProviderEvent extends Equatable {
  @override
  List<Object?> get props => [];

  const ModelProviderEvent();
}

class ModelProviderLoadingRequested extends ModelProviderEvent {
  final bool refreshState;

  @override
  List<Object?> get props => [refreshState];

  const ModelProviderLoadingRequested({ this.refreshState = false });
}