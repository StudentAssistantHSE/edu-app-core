part of 'process_application_bloc.dart';

abstract class ProcessApplicationEvent extends Equatable {
  @override
  List<Object> get props => [];

  const ProcessApplicationEvent();
}

class ProcessApplicationAccept extends ProcessApplicationEvent {
  const ProcessApplicationAccept();
}

class ProcessApplicationReject extends ProcessApplicationEvent {
  const ProcessApplicationReject();
}