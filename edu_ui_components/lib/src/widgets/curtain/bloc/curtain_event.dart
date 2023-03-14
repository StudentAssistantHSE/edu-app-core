part of 'curtain_bloc.dart';

abstract class CurtainEvent extends Equatable {
  @override
  List<Object> get props => [];

  const CurtainEvent();
}

class _CurtainControllerUpdated extends CurtainEvent {
  const _CurtainControllerUpdated();
}

class CurtainScrolled extends CurtainEvent {
  final double fraction;

  @override
  List<Object> get props => [ fraction ];

  const CurtainScrolled(this.fraction);
}

class CurtainScrollEnded extends CurtainEvent {
  final double velocity;

  @override
  List<Object> get props => [ velocity ];

  const CurtainScrollEnded(this.velocity);
}

class CurtainExpanded extends CurtainEvent {
  const CurtainExpanded();
}

class CurtainCollapsed extends CurtainEvent {
  const CurtainCollapsed();
}