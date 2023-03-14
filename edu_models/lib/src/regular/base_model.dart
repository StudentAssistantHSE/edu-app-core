import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class BaseModel extends Equatable {
  final int id;

  @override
  @mustCallSuper
  List<Object?> get props => [id];

  const BaseModel({ required this.id });

  Object toJson();
}
