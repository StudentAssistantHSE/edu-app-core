part of 'curtain_bloc.dart';

enum CurtainStatus {
  collapsed,
  expanding,
  expanded,
  collapsing,
}

extension CurtainStatusX on CurtainStatus {
  bool get isCollapsed => this == CurtainStatus.collapsed;
  bool get isExpanding => this == CurtainStatus.expanding;
  bool get isExpanded => this == CurtainStatus.expanded;
  bool get isCollapsing => this == CurtainStatus.collapsing;
}

class CurtainState extends Equatable {
  final double visibleFraction;
  final bool lastExpanded;

  @override
  List<Object> get props => [visibleFraction, lastExpanded];

  const CurtainState._({
    required this.visibleFraction,
    required this.lastExpanded,
  });

  const CurtainState.initial() : visibleFraction = 0, lastExpanded = false;

  CurtainState copyWith({
    double? visibleFraction,
    bool? lastExpanded,
  }) => CurtainState._(
    visibleFraction: visibleFraction ?? this.visibleFraction,
    lastExpanded: lastExpanded ?? this.lastExpanded,
  );
}