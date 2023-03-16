import 'package:edu_models/edu_models.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_process_application_project/feature_process_application.dart';
import 'package:feature_process_application_project/src/repository/process_application_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'process_application_event.dart';
part 'process_application_state.dart';

class ProcessApplicationBloc extends Bloc<ProcessApplicationEvent, ProcessApplicationState> {
  final ProcessApplicationRepository _processApplicationRepository;
  final int _applicationId;

  ProcessApplicationBloc({
    required ProcessApplicationRepository processApplicationRepository,
    required int applicationId,
  }) : _processApplicationRepository = processApplicationRepository,
       _applicationId = applicationId,
       super(const ProcessApplicationState.initial()) {
    on<ProcessApplicationAccept>(_onAccept);
    on<ProcessApplicationReject>(_onReject);
  }

  Future<void> _onAccept(
    ProcessApplicationAccept event,
    Emitter<ProcessApplicationState> emit,
  ) => _process(StatusType.accepted, emit);

  Future<void> _onReject(
    ProcessApplicationReject event,
    Emitter<ProcessApplicationState> emit,
  ) => _process(StatusType.rejected, emit);

  Future<void> _process(
    StatusType status,
    Emitter<ProcessApplicationState> emit,
  ) async {
    emit(state.copyWith(status: ProcessApplicationStatus.inProgress));
    try {
      final result = await _processApplicationRepository.processApplication(
        action: status,
        applicationId: _applicationId,
      );
      switch (result) {
        case ProcessApplicationResult.success:
          emit(state.copyWith(status: ProcessApplicationStatus.success));
          break;
        case ProcessApplicationResult.error:
          emit(state.copyWith(status: ProcessApplicationStatus.undefinedError));
          break;
        case ProcessApplicationResult.notAuthorized:
          emit(state.copyWith(status: ProcessApplicationStatus.notAuthorized));
          break;
      }
    } on Exception catch (e) {
      emit(state.copyWith(
        status: e is DioError ? ProcessApplicationStatus.connectionError : ProcessApplicationStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
