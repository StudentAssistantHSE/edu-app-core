import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_core/edu_core.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_settings/feature_settings.dart';
import 'package:feature_settings/src/repository/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsBloc({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository,
       super(SettingsState(settings: settingsRepository.settings)) {
    on<SettingsThemeTypeChanged>(_onThemeTypeChanged, transformer: bloc_concurrency.restartable());
  }

  Future<void> _onThemeTypeChanged(
    SettingsThemeTypeChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final newSettings = Settings(
      themeType: event.themeType,
    );
    emit(state.copyWith(settings: newSettings));
    await _settingsRepository.setSettings(newSettings);
  }
}
