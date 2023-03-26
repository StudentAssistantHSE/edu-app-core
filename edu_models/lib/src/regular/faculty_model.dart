import 'package:edu_models/src/regular/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faculty_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FacultyModel extends BaseModel {
  final String name;
  final String shortName;

  @override
  @mustCallSuper
  List<Object?> get props => [
    ...super.props,
    name,
    shortName,
  ];

  const FacultyModel({
    required super.id,
    required this.name,
    required this.shortName,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) => _$FacultyModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FacultyModelToJson(this);
}
