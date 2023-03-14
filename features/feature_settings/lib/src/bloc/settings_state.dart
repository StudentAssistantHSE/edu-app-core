part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Settings settings;

  @override
  List<Object?> get props => [settings];

  const SettingsState({
    required this.settings,
  });

  SettingsState copyWith({
    Settings? settings,
  }) => SettingsState(
    settings: settings ?? this.settings,
  );
}