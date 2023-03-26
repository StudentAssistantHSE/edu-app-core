// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      bio: json['bio'] as String?,
      facultyId: json['facultyId'] as int?,
      faculty: json['faculty'] == null
          ? null
          : FacultyModel.fromJson(json['faculty'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'bio': instance.bio,
      'facultyId': instance.facultyId,
      'faculty': instance.faculty?.toJson(),
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
