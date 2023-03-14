part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsThemeTypeChanged extends SettingsEvent {
  final ThemeType themeType;

  @override
  List<Object> get props => [themeType];

  const SettingsThemeTypeChanged(this.themeType);
}
