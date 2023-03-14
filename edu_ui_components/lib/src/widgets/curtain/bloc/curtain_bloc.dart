import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'curtain_event.dart';
part 'curtain_state.dart';

class CurtainBloc extends Bloc<CurtainEvent, CurtainState> {
  final AnimationController _controller;

  CurtainBloc({
    required AnimationController controller,
  }) : _controller = controller,
       super(const CurtainState.initial()) {
    on<CurtainScrolled>(_onScrolled);
    on<CurtainScrollEnded>(_onScrollEnded);
    on<CurtainExpanded>(_onExpanded);
    on<CurtainCollapsed>(_onCollapsed);
    on<_CurtainControllerUpdated>(_onControllerUpdated);

    _controller.addListener(_controllerListener);
  }

  @override
  Future<void> close() async {
    _controller.removeListener(_controllerListener);
    await super.close();
  }

  void _onScrolled(
    CurtainScrolled event,
    Emitter<CurtainState> emit,
  ) => _controller.value += event.fraction;

  void _onScrollEnded(
    CurtainScrollEnded event,
    Emitter<CurtainState> emit,
  ) {
    final velocity = event.velocity == 0
        ? (state.lastExpanded
              ? _controller.value <= 0.8 ? -1.0 : 1.0
              : _controller.value >= 0.15 ? 1.0 : -1.0
          )
        : event.velocity;

    _controller.fling(velocity: velocity);
  }

  void _onExpanded(
    CurtainExpanded event,
    Emitter<CurtainState> emit,
  ) => _controller.fling();

  void _onCollapsed(
    CurtainCollapsed event,
    Emitter<CurtainState> emit,
  ) => _controller.fling(velocity: -1);

  void _onControllerUpdated(
    _CurtainControllerUpdated event,
    Emitter<CurtainState> emit,
  ) => emit(
      state.copyWith(
        visibleFraction: _controller.value,
        lastExpanded: _controller.value == 0
            ? false
            : _controller.value == 1
            ? true
            : null,
      ),
    );

  void _controllerListener() => add(const _CurtainControllerUpdated());
}