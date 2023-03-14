part of 'shared_routes_navigator_bloc.dart';

abstract class SharedRoutesNavigatorEvent extends Equatable {
  @override
  List<Object> get props => [];

  const SharedRoutesNavigatorEvent();
}

class SharedRoutesNavigatorIndexChanged extends SharedRoutesNavigatorEvent {
  final int index;

  @override
  List<Object> get props => [index];

  const SharedRoutesNavigatorIndexChanged(this.index);
}