import 'package:json_annotation/json_annotation.dart';

enum EmploymentType {
  @JsonValue(1)
  remote,

  @JsonValue(2)
  onSiteWork,

  @JsonValue(3)
  expeditions,

  @JsonValue(4)
  internships,
}