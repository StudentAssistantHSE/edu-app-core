part of 'apply_project_bloc.dart';

enum ApplyProjectStatus {
  notSubmitted,
  inProgress,
  success,
  alreadyApplied,
  notAuthorized,
  connectionError,
  undefinedError,
}

class ApplyProjectState extends Equatable {
  final ApplyProjectStatus status;
  final MessageField message;

  bool get isSuccess => status == ApplyProjectStatus.success;
  bool get isInProgress => status == ApplyProjectStatus.inProgress;

  @override
  List<Object?> get props => [status, message];

  const ApplyProjectState._({
    required this.status,
    required this.message,
  });

  const ApplyProjectState.initial() :
      status = ApplyProjectStatus.notSubmitted,
      message = const MessageField.pure();

  ApplyProjectState copyWith({
    ApplyProjectStatus? status,
    MessageField? message,
  }) => ApplyProjectState._(
    status: status ?? this.status,
    message: message ?? this.message,
  );
}