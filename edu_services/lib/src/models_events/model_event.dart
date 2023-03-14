import 'package:edu_models/edu_models.dart';
import 'package:equatable/equatable.dart';

abstract class ModelEvent<T extends BaseModel> extends Equatable {
  final DateTime timeStamp;

  @override
  List<Object> get props => [timeStamp];

  const ModelEvent({ required this.timeStamp });
}

class ModelUpdatedEvent<T extends BaseModel> extends ModelEvent<T> {
  final T model;

  const ModelUpdatedEvent({ required this.model, required super.timeStamp });
}

class ModelDeletedEvent<T extends BaseModel> extends ModelEvent<T> {
  final String uuid;

  const ModelDeletedEvent({ required this.uuid, required super.timeStamp });
}