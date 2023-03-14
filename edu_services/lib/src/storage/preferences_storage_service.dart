import 'dart:convert';

import 'package:edu_services/src/storage/decoders.dart';
import 'package:edu_services/src/storage/storage_key.dart';
import 'package:edu_services/src/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStorageService extends StorageService {
  final SharedPreferences _sharedPreferences;
  
  const PreferencesStorageService._(this._sharedPreferences);

  @override
  Future<bool> remove(StorageKey key) => _sharedPreferences.remove(key.asString);

  @override
  Future<bool> removeAll() => _sharedPreferences.clear();

  @override
  T? getValue<T>(StorageKey key, { T? defaultValue }) {
    if (T == String) {
      return (_sharedPreferences.getString(key.asString) as T?) ?? defaultValue;
    } else if (T == int) {
      return (_sharedPreferences.getInt(key.asString) as T?) ?? defaultValue;
    } else if (T == bool) {
      return (_sharedPreferences.getBool(key.asString) as T?) ?? defaultValue;
    } else if (T == Map<String, Object?>) {
      return Decoders.decodeMap(
        _sharedPreferences.getString(key.asString),
        defaultValue: defaultValue as Map<String, Object?>?,
      ) as T?;
    } else if (T == List<Object?>) {
      return Decoders.decodeList(
        _sharedPreferences.getString(key.asString),
        defaultValue: defaultValue as List<Object?>?,
      ) as T?;
    }

    throw UnimplementedError('Preferences storage: not implemented value type: ${T.runtimeType}');
  }

  @override
  Future<bool> setValue<T>(StorageKey key, T? value) {
    if (value == null) {
      return _sharedPreferences.remove(key.asString);
    }

    if (value is String) {
      return _sharedPreferences.setString(key.asString, value);
    } else if (value is int) {
      return _sharedPreferences.setInt(key.asString, value);
    } else if (value is bool) {
      return _sharedPreferences.setBool(key.asString, value);
    } else if (value is Map<String, Object?>) {
      return _sharedPreferences.setString(key.asString, jsonEncode(value));
    } else if (value is List<Object?>) {
      return _sharedPreferences.setString(key.asString, jsonEncode(value));
    }

    throw UnimplementedError('Preferences storage: not implemented value type: ${value.runtimeType}');
  }

  static Future<PreferencesStorageService> create() async => PreferencesStorageService._(
    await SharedPreferences.getInstance(),
  );
}