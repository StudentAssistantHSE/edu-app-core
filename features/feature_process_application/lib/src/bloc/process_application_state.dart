part of 'process_application_bloc.dart';

enum ProcessApplicationStatus {
  notSubmitted,
  inProgress,
  success,
  notAuthorized,
  connectionError,
  undefinedError,
}

class ProcessApplicationState extends Equatable {
  final ProcessApplicationStatus status;

  bool get isSuccess => status == ProcessApplicationStatus.success;
  bool get isInProgress => status == ProcessApplicationStatus.inProgress;

  @override
  List<Object?> get props => [status];

  const ProcessApplicationState._({
    required this.status,
  });

  const ProcessApplicationState.initial() :
      status = ProcessApplicationStatus.notSubmitted;

  ProcessApplicationState copyWith({
    ProcessApplicationStatus? status,
  }) => ProcessApplicationState._(
    status: status ?? this.status,
  );
}