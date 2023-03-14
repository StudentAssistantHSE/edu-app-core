import 'package:edu_models/src/regular/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends BaseModel {
  final String email;
  final String fullName;

  @override
  @mustCallSuper
  List<Object?> get props => [
    ...super.props,
    email,
    fullName,
  ];

  const UserModel({
    required super.id,
    required this.email,
    required this.fullName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
