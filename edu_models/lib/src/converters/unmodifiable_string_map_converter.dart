import 'package:json_annotation/json_annotation.dart';

class UnmodifiableStringMapConverter extends JsonConverter<Map<String, String>, Map<String, dynamic>> {
  const UnmodifiableStringMapConverter();

  @override
  Map<String, String> fromJson(Map<String, dynamic> json) => Map.unmodifiable(Map<String, String>.from(json));

  @override
  Map<String, String> toJson(Map<String, String> object) => object;
}