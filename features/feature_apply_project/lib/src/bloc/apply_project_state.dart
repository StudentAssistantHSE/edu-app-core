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
  final FormzStatus fieldsStatus;

  bool get isSuccess => status == ApplyProjectStatus.success;
  bool get isInProgress => status == ApplyProjectStatus.inProgress;

  @override
  List<Object?> get props => [status, message, fieldsStatus];

  const ApplyProjectState._({
    required this.status,
    required this.message,
    required this.fieldsStatus,
  });

  const ApplyProjectState.initial() :
      status = ApplyProjectStatus.notSubmitted,
      message = const MessageField.pure(),
      fieldsStatus = FormzStatus.pure;

  ApplyProjectState copyWith({
    ApplyProjectStatus? status,
    MessageField? message,
    FormzStatus? fieldsStatus,
  }) => ApplyProjectState._(
    status: status ?? this.status,
    message: message ?? this.message,
    fieldsStatus: fieldsStatus ?? this.fieldsStatus,
  );
}