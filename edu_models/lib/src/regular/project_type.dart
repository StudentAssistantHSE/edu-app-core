import 'package:json_annotation/json_annotation.dart';

enum ProjectType {
  @JsonValue(1)
  research,

  @JsonValue(2)
  application,

  @JsonValue(3)
  service,
}