import 'package:edu_core/edu_core.dart';
import 'package:edu_ui_components/src/base/navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shared_routes_navigator_state.dart';
part 'shared_routes_navigator_event.dart';

class SharedRoutesNavigatorBloc extends Bloc<SharedRoutesNavigatorEvent, SharedRoutesNavigatorState> {
  SharedRoutesNavigatorBloc({
    required int initialIndex,
    required List<String> initialRoutes,
  }) : assert(
         initialIndex >= 0 && initialIndex < initialRoutes.length,
         'SharedRoutesNavigatorCubit index is out of range ($initialIndex, items count: $initialRoutes.length)',
       ),
       super(SharedRoutesNavigatorState.initial(index: initialIndex, initialRoutes: initialRoutes)) {
    on<SharedRoutesNavigatorIndexChanged>(_onIndexChanged);
  }

  void _onIndexChanged(
    SharedRoutesNavigatorIndexChanged event,
    Emitter<SharedRoutesNavigatorState> emit,
  ) {
    if (event.index < 0 || event.index >= state.items.length) {
      throw IllegalArgumentException('SharedRoutesNavigatorBloc index is out of range (${event.index}, items count: ${state.items.length})');
    }
    if (state.index == event.index) {
      state.items[event.index].navigation.popUntil((route) => route.isFirst);
    } else {
      emit(state.changeIndex(event.index));
    }
  }
}