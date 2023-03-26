import 'package:edu_models/src/regular/base_model.dart';
import 'package:edu_models/src/regular/category_model.dart';
import 'package:edu_models/src/regular/faculty_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends BaseModel {
  final String email;
  final String fullName;
  final String? bio;
  final int? facultyId;
  final FacultyModel? faculty;

  @JsonKey(defaultValue: <CategoryModel> [])
  final List<CategoryModel> categories;

  @override
  @mustCallSuper
  List<Object?> get props => [
    ...super.props,
    email,
    fullName,
    bio,
    facultyId,
    faculty,
    categories,
  ];

  const UserModel({
    required super.id,
    required this.email,
    required this.fullName,
    required this.bio,
    required this.facultyId,
    required this.faculty,
    required this.categories,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
