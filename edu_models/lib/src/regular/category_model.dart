import 'package:edu_models/src/regular/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel extends BaseModel {
  final String category;
  final bool isCustom;

  @override
  @mustCallSuper
  List<Object?> get props => [
    ...super.props,
    category,
    isCustom,
  ];

  const CategoryModel({
    required super.id,
    required this.category,
    required this.isCustom,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
