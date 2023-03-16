import 'package:edu_models/src/regular/base_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_model.g.dart';

enum StatusType {
  @JsonValue(1)
  applied,
  @JsonValue(2)
  rejected,
  @JsonValue(3)
  accepted,
}

extension StatusTypeX on StatusType {
  bool get isApplied => this == StatusType.applied;
  bool get isRejected => this == StatusType.rejected;
  bool get isAccepted => this == StatusType.accepted;
}

@JsonSerializable(explicitToJson: true)
class ApplicationModel extends BaseModel {
  final int projectId;
  final int applicantId;
  final String message;
  final StatusType status;

  @override
  @mustCallSuper
  List<Object?> get props => [
    ...super.props,
    projectId,
    applicantId,
    message,
    status,
  ];

  const ApplicationModel({
    required super.id,
    required this.projectId,
    required this.applicantId,
    required this.message,
    required this.status,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApplicationModelToJson(this);
}
