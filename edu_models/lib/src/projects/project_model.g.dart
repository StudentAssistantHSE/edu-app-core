// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      contacts: json['contacts'] as String?,
      startDate: _$JsonConverterFromJson<String, DateTime>(
          json['startDate'], const DateTimeConverter().fromJson),
      endDate: _$JsonConverterFromJson<String, DateTime>(
          json['endDate'], const DateTimeConverter().fromJson),
      applicationDeadline: _$JsonConverterFromJson<String, DateTime>(
          json['applicationDeadline'], const DateTimeConverter().fromJson),
      employmentType:
          $enumDecodeNullable(_$EmploymentTypeEnumMap, json['employmentType']),
      territory: json['territory'] as String?,
      skills: json['skills'] as String?,
      creditNumber: json['creditNumber'] as int?,
      campus: $enumDecodeNullable(_$CampusTypeEnumMap, json['campus']),
      participantsNumber: json['participantsNumber'] as int?,
      projectType:
          $enumDecodeNullable(_$ProjectTypeEnumMap, json['projectType']),
      weeklyHours: json['weeklyHours'] as int?,
      isClosed: json['isClosed'] as bool,
      userFullName: json['userFullName'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('contacts', instance.contacts);
  writeNotNull(
      'startDate',
      _$JsonConverterToJson<String, DateTime>(
          instance.startDate, const DateTimeConverter().toJson));
  writeNotNull(
      'endDate',
      _$JsonConverterToJson<String, DateTime>(
          instance.endDate, const DateTimeConverter().toJson));
  writeNotNull(
      'applicationDeadline',
      _$JsonConverterToJson<String, DateTime>(
          instance.applicationDeadline, const DateTimeConverter().toJson));
  writeNotNull(
      'employmentType', _$EmploymentTypeEnumMap[instance.employmentType]);
  writeNotNull('territory', instance.territory);
  writeNotNull('skills', instance.skills);
  writeNotNull('creditNumber', instance.creditNumber);
  writeNotNull('campus', _$CampusTypeEnumMap[instance.campus]);
  writeNotNull('participantsNumber', instance.participantsNumber);
  writeNotNull('projectType', _$ProjectTypeEnumMap[instance.projectType]);
  writeNotNull('weeklyHours', instance.weeklyHours);
  val['isClosed'] = instance.isClosed;
  writeNotNull('userFullName', instance.userFullName);
  val['categories'] = instance.categories.map((e) => e.toJson()).toList();
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$EmploymentTypeEnumMap = {
  EmploymentType.remote: 1,
  EmploymentType.onSiteWork: 2,
  EmploymentType.expeditions: 3,
  EmploymentType.internships: 4,
};

const _$CampusTypeEnumMap = {
  CampusType.moscow: 1,
  CampusType.nizhniyNovgorod: 2,
  CampusType.perm: 3,
  CampusType.saintPetersburg: 4,
};

const _$ProjectTypeEnumMap = {
  ProjectType.research: 1,
  ProjectType.application: 2,
  ProjectType.service: 3,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
