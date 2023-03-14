part of 'shared_routes_navigator_bloc.dart';

class _SharedRoutesNavigatorItem extends Equatable {
  final String initialRoute;
  final Navigation navigation;

  @override
  List<Object?> get props => [initialRoute, navigation];

  const _SharedRoutesNavigatorItem(
    this.initialRoute,
    this.navigation,
  );
}

class SharedRoutesNavigatorState extends Equatable {
  final int index;
  final List<_SharedRoutesNavigatorItem> items;

  @override
  List<Object?> get props => [index, items];

  const SharedRoutesNavigatorState._({
    required this.index,
    required this.items,
  });

  SharedRoutesNavigatorState.initial({
    required this.index,
    List<String> initialRoutes = const [],
  }) : items = List.generate(
    initialRoutes.length,
    (index) => _SharedRoutesNavigatorItem(initialRoutes[index], Navigation()),
  );

  SharedRoutesNavigatorState changeIndex(int index) => SharedRoutesNavigatorState._(
    index: index,
    items: items,
  );
}