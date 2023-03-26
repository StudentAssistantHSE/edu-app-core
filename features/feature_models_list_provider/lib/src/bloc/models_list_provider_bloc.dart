import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_core/edu_core.dart';
import 'package:edu_models/edu_models.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_path.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_repository.dart';
import 'package:feature_models_list_provider/src/repository/models_list_provider_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'models_list_provider_event.dart';
part 'models_list_provider_state.dart';

class ModelsListProviderBloc<T extends BaseModel> extends Bloc<ModelsListProviderEvent, ModelsListProviderState<T>> {
  final ModelsListProviderPath _path;
  final ModelsListProviderRepository<T> _modelsListProviderRepository;
  final int? _pageSize;

  ModelsListProviderBloc({
    required ModelsListProviderPath path,
    required ModelsListProviderRepository<T> modelsListProviderRepository,
    int? pageSize,
  }) : _path = path,
       _modelsListProviderRepository = modelsListProviderRepository,
       _pageSize = pageSize,
       super(ModelsListProviderState<T>.initial()) {
    on<ModelsListProviderRefreshRequested>(
      _onRefreshRequested,
      transformer: bloc_concurrency.restartable(),
    );
    on<ModelsListProviderNextPageRequested>(
      _onNextPageRequested,
      transformer: bloc_concurrency.droppable(),
    );
    on<ModelsListProviderPageReloadRequested>(
      _onPageReloadRequested,
      transformer: bloc_concurrency.restartable(),
    );
  }

  Future<void> _onRefreshRequested(
    ModelsListProviderRefreshRequested event,
    Emitter<ModelsListProviderState<T>> emit,
  ) async {
    emit(
      event.refreshState
          ? ModelsListProviderState<T>.initial()
          : state.copyWith(status: ModelsListProviderStatus.refreshing,
      ),
    );

    try {
      final result = await _modelsListProviderRepository.loadPage(
        path: _path,
        page: 1,
        pageSize: _pageSize,
        queryParameters: event.queryParameters,
      );
      switch (result.resultType) {
        case ModelsListProviderResultType.success:
          emit(state.copyWith(
            status: ModelsListProviderStatus.refreshingSuccess,
            models: result.models.asNotNull,
            count: result.count.asNotNull,
            page: 1,
          ));
          break;
        case ModelsListProviderResultType.notAuthorized:
          emit(state.copyWith(status: ModelsListProviderStatus.notAuthorized));
          break;
        case ModelsListProviderResultType.error:
          emit(state.copyWith(status: ModelsListProviderStatus.refreshingUndefinedError));
          break;
      }
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError
            ? ModelsListProviderStatus.refreshingConnectionError
            : ModelsListProviderStatus.refreshingUndefinedError,
      ));
      rethrow;
    }
  }

  Future<void> _onNextPageRequested(
    ModelsListProviderNextPageRequested event,
    Emitter<ModelsListProviderState<T>> emit,
  ) async {
    emit(state.copyWith(status: ModelsListProviderStatus.loadingNextPage));

    try {
      final result = await _modelsListProviderRepository.loadPage(
        path: _path,
        page: state.page + 1,
        pageSize: _pageSize,
        queryParameters: event.queryParameters,
      );
      switch (result.resultType) {
        case ModelsListProviderResultType.success:
          emit(state.copyWith(
            status: ModelsListProviderStatus.loadingNextPageSuccess,
            models: [
              ...?state.models.value,
              ...?result.models,
            ].asNotNull,
            count: result.count.asNotNull,
            page: state.page + 1,
          ));
          break;
        case ModelsListProviderResultType.notAuthorized:
          emit(state.copyWith(status: ModelsListProviderStatus.notAuthorized));
          break;
        case ModelsListProviderResultType.error:
          emit(state.copyWith(status: ModelsListProviderStatus.loadingNextPageUndefinedError));
          break;
      }
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError
            ? ModelsListProviderStatus.loadingNextPageConnectionError
            : ModelsListProviderStatus.loadingNextPageUndefinedError,
      ));
      rethrow;
    }
  }

  Future<void> _onPageReloadRequested(
    ModelsListProviderPageReloadRequested event,
    Emitter<ModelsListProviderState<T>> emit,
  ) async {
    emit(state.copyWith(status: ModelsListProviderStatus.reloadingPage));

    try {
      final result = await _modelsListProviderRepository.loadPage(
        path: _path,
        page: event.page,
        pageSize: _pageSize,
      );

      switch (result.resultType) {
        case ModelsListProviderResultType.success:
          final resultModels = [...?result.models];
          final stateModels = [...?state.models.value];
          for (var i = 0; i < resultModels.length; i++) {
            final modelIndex = stateModels.indexWhere((e) => e.id == resultModels[i].id);
            if (modelIndex != -1) {
              stateModels[modelIndex] = resultModels[i];
            } else {
              stateModels.add(resultModels[i]);
            }
          }
          emit(state.copyWith(
            status: ModelsListProviderStatus.reloadingPageSuccess,
            models: stateModels.asNotNull,
            count: result.count.asNotNull,
          ));
          break;
        case ModelsListProviderResultType.notAuthorized:
          emit(state.copyWith(status: ModelsListProviderStatus.notAuthorized));
          break;
        case ModelsListProviderResultType.error:
          emit(state.copyWith(status: ModelsListProviderStatus.reloadingPageUndefinedError));
          break;
      }
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError
            ? ModelsListProviderStatus.reloadingPageConnectionError
            : ModelsListProviderStatus.reloadingPageUndefinedError,
      ));
      rethrow;
    }
  }
}