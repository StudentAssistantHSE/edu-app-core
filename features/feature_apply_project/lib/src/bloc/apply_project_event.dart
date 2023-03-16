part of 'apply_project_bloc.dart';

abstract class ApplyProjectEvent extends Equatable {
  @override
  List<Object> get props => [];

  const ApplyProjectEvent();
}

class ApplyProjectMessageFieldChanged extends ApplyProjectEvent {
  final String message;

  @override
  List<Object> get props => [message];

  const ApplyProjectMessageFieldChanged(this.message);
}

class ApplyProjectSubmitted extends ApplyProjectEvent {
  const ApplyProjectSubmitted();
}