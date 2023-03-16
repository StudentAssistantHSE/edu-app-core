import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_apply_project/feature_apply_project.dart';
import 'package:feature_apply_project/src/bloc/message_field.dart';
import 'package:feature_apply_project/src/repository/apply_project_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'apply_project_event.dart';
part 'apply_project_state.dart';

class ApplyProjectBloc extends Bloc<ApplyProjectEvent, ApplyProjectState> {
  final ApplyProjectRepository _applyProjectRepository;
  final int _projectId;

  ApplyProjectBloc({
    required ApplyProjectRepository applyProjectRepository,
    required int projectId,
  }) : _applyProjectRepository = applyProjectRepository,
       _projectId = projectId,
       super(const ApplyProjectState.initial()) {
    on<ApplyProjectMessageFieldChanged>(_onMessageChanged);
    on<ApplyProjectSubmitted>(_onSubmitted, transformer: bloc_concurrency.droppable());
  }

  void _onMessageChanged(
    ApplyProjectMessageFieldChanged event,
    Emitter<ApplyProjectState> emit,
  ) {
    final message = MessageField.dirty(event.message);
    emit(
      state.copyWith(
        message: message,
        fieldsStatus: Formz.validate([message]),
      ),
    );
  }

  Future<void> _onSubmitted(
    ApplyProjectSubmitted event,
    Emitter<ApplyProjectState> emit,
  ) async {
    if (!state.fieldsStatus.isValidated) return;

    emit(state.copyWith(status: ApplyProjectStatus.inProgress));
    try {
      final result = await _applyProjectRepository.apply(
        projectId: _projectId,
        message: state.message.value,
      );
      switch (result) {
        case ApplyProjectResult.success:
          emit(state.copyWith(status: ApplyProjectStatus.success));
          break;
        case ApplyProjectResult.alreadyApplied:
          emit(state.copyWith(status: ApplyProjectStatus.alreadyApplied));
          break;
        case ApplyProjectResult.notAuthorized:
          emit(state.copyWith(status: ApplyProjectStatus.notAuthorized));
          break;
      }
    } on Exception catch (e) {
      emit(state.copyWith(
        status: e is DioError ? ApplyProjectStatus.connectionError : ApplyProjectStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
