import 'package:edu_core/edu_core.dart';
import 'package:edu_services/edu_services.dart';
import 'package:feature_settings/src/repository/settings.dart';

class SettingsRepository {
  final PreferencesStorageService _preferencesStorageService;

  Settings get settings {
    final settings = _settings;
    if (settings == null) {
      return const Settings(
        themeType: ThemeType.platform,
      );
    }
    return settings;
  }

  Settings? _settings;

  SettingsRepository._(this._preferencesStorageService, this._settings);

  static Future<SettingsRepository> create(PreferencesStorageService preferencesStorageService) async {
    final settingsJson = await preferencesStorageService.getMap(
      StorageKey.settings,
    );

    Settings? settings;
    if (settingsJson != null) {
      try {
        settings = Settings.fromJson(settingsJson);
      } on Object catch (_) { }
    }

    await preferencesStorageService.setMap(
      StorageKey.settings,
      settings?.toJson(),
    );
    return SettingsRepository._(preferencesStorageService, settings);
  }

  Future<void> setSettings(Settings settings) async {
    _settings = settings;
    await _preferencesStorageService.setMap(
      StorageKey.settings,
      settings.toJson(),
    );
  }
}