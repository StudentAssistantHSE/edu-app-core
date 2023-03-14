import 'package:edu_core/edu_core.dart';
import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final ThemeType themeType;

  @override
  List<Object?> get props => [themeType];

  const Settings({
    required this.themeType,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    themeType: ThemeTypeConverter.fromString(json['theme_type'] as String),
  );

  Map<String, dynamic> toJson() => <String, dynamic> {
    'theme_type': themeType.asString,
  };
}