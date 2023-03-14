import 'package:edu_models/src/projects/category_model.dart';
import 'package:edu_models/src/regular/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectModel extends BaseModel {
  final String name;
  final String description;
  final String? contacts;
  final bool isClosed;
  final String userFullName;
  final List<CategoryModel> categories;

  @override
  @mustCallSuper
  List<Object?> get props => [
    ...super.props,
    name,
    description,
    contacts,
    isClosed,
    userFullName,
    categories,
  ];

  const ProjectModel({
    required super.id,
    required this.name,
    required this.description,
    required this.contacts,
    required this.isClosed,
    required this.userFullName,
    required this.categories,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
