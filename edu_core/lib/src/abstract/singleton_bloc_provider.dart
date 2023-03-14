import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SingletonBlocProvider<T extends BlocBase<State>, State> {
  final T _bloc;

  @protected
  T get bloc => _bloc;

  @mustCallSuper
  const SingletonBlocProvider(this._bloc);

  T read(BuildContext context) => context.read<T>();
  T watch(BuildContext context) => context.watch<T>();
  State select(BuildContext context, State Function(T value) selector) => context.select<T, State>(selector);

  BlocProvider<T> getProvider() => BlocProvider<T>.value(
    value: _bloc,
  );

  Future<void> dispose();
}