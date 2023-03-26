import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_core/edu_core.dart';
import 'package:edu_models/edu_models.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_model_provider/src/repository/model_provider_path.dart';
import 'package:feature_model_provider/src/repository/model_provider_repository.dart';
import 'package:feature_model_provider/src/repository/model_provider_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'model_provider_event.dart';
part 'model_provider_state.dart';

class ModelProviderBloc<T extends BaseModel> extends Bloc<ModelProviderEvent, ModelProviderState<T>> {
  final ModelProviderPath _path;
  final ModelProviderRepository<T> _modelProviderRepository;

  ModelProviderBloc({
    required ModelProviderPath path,
    required ModelProviderRepository<T> modelProviderRepository,
  }) : _path = path,
       _modelProviderRepository = modelProviderRepository,
       super(ModelProviderState<T>.initial()) {
    on<ModelProviderLoadingRequested>(
      _onLoadingRequested,
      transformer: bloc_concurrency.restartable(),
    );
  }

  Future<void> _onLoadingRequested(
    ModelProviderLoadingRequested event,
    Emitter<ModelProviderState<T>> emit,
  ) async {
    emit(
      event.refreshState
          ? ModelProviderState<T>.initial()
          : state.copyWith(status: ModelProviderStatus.loading,
      ),
    );

    try {
      final result = await _modelProviderRepository.load(path: _path);
      switch (result.resultType) {
        case ModelProviderResultType.success:
          emit(state.copyWith(
            status: ModelProviderStatus.success,
            model: result.model.asNotNull,
          ));
          break;
        case ModelProviderResultType.notAuthorized:
          emit(state.copyWith(status: ModelProviderStatus.notAuthorized));
          break;
        case ModelProviderResultType.error:
          emit(state.copyWith(status: ModelProviderStatus.undefinedError));
          break;
      }
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError
            ? ModelProviderStatus.connectionError
            : ModelProviderStatus.undefinedError,
      ));
      rethrow;
    }
  }
}