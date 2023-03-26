import 'package:equatable/equatable.dart';

class Pair<T, K> extends Equatable {
  final T first;
  final K second;

  @override
  List<Object?> get props => [first, second];

  const Pair(this.first, this.second);
}