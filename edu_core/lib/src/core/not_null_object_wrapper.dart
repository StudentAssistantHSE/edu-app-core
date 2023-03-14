import 'package:equatable/equatable.dart';

class NotNullObjectWrapper<T> extends Equatable {
  final T? _value;

  @override
  List<Object?> get props => [value];

  T? get value => _value;

  const NotNullObjectWrapper(this._value);
}

extension NotNullObjectWrapperExtension<T> on T? {
  NotNullObjectWrapper<T> get asNotNull => NotNullObjectWrapper<T>(this);
}