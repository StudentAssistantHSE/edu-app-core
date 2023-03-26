import 'package:json_annotation/json_annotation.dart';

enum CampusType {
  @JsonValue(1)
  moscow,

  @JsonValue(2)
  nizhniyNovgorod,

  @JsonValue(3)
  perm,

  @JsonValue(4)
  saintPetersburg,
}