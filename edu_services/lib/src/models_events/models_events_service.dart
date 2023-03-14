import 'dart:async';

import 'package:edu_models/edu_models.dart';
import 'package:edu_services/src/models_events/model_event.dart';
import 'package:injectable/injectable.dart';

class ModelsEventsService {
  final StreamController<ModelEvent> _streamController = StreamController.broadcast();

  ModelsEventsService();

  Stream<ModelEvent<T>> eventsStreamOf<T extends BaseModel>() => _streamController.stream.where(
    (event) => event is ModelEvent<T>,
  ).map((event) => event as ModelEvent<T>);

  void onModelUpdated<T extends BaseModel>(T model, DateTime timeStamp) => _streamController.add(
    ModelUpdatedEvent<T>(model: model, timeStamp: timeStamp),
  );

  void onModelDeleted<T extends BaseModel>(String uuid, DateTime timeStamp) => _streamController.add(
    ModelDeletedEvent(uuid: uuid, timeStamp: timeStamp),
  );

  @disposeMethod
  void dispose() {
    _streamController.close();
  }
}