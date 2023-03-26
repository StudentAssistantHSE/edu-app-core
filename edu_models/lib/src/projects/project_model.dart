import 'package:edu_models/src/date_time_converter.dart';
import 'package:edu_models/src/regular/base_model.dart';
import 'package:edu_models/src/regular/campus_type.dart';
import 'package:edu_models/src/regular/category_model.dart';
import 'package:edu_models/src/regular/employment_type.dart';
import 'package:edu_models/src/regular/project_type.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@DateTimeConverter()
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ProjectModel extends BaseModel {
  final String name;
  final String description;
  final String? contacts;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? applicationDeadline;
  final EmploymentType? employmentType;
  final String? territory;
  final String? skills;
  final int? creditNumber;
  final CampusType? campus;
  final int? participantsNumber;
  final ProjectType? projectType;
  final int? weeklyHours;
  final bool isClosed;
  final String? userFullName;

  @JsonKey(defaultValue: <CategoryModel> [])
  final List<CategoryModel> categories;

  @override
  @mustCallSuper
  List<Object?> get props => [
    ...super.props,
    name,
    description,
    contacts,
    startDate,
    endDate,
    applicationDeadline,
    employmentType,
    territory,
    skills,
    creditNumber,
    campus,
    participantsNumber,
    projectType,
    weeklyHours,
    isClosed,
    userFullName,
    categories,
  ];

  const ProjectModel({
    required super.id,
    required this.name,
    required this.description,
    required this.contacts,
    required this.startDate,
    required this.endDate,
    required this.applicationDeadline,
    required this.employmentType,
    required this.territory,
    required this.skills,
    required this.creditNumber,
    required this.campus,
    required this.participantsNumber,
    required this.projectType,
    required this.weeklyHours,
    required this.isClosed,
    required this.userFullName,
    required this.categories,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
