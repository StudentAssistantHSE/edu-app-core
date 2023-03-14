import 'dart:async';

import 'package:edu_services/src/storage/storage_key.dart';
import 'package:flutter/foundation.dart';

abstract class StorageService {
  const StorageService();

  Future<bool> remove(StorageKey key);
  Future<bool> removeAll();

  FutureOr<bool> setString(StorageKey key, String? value) =>
      setValue<String>(key, value);

  FutureOr<bool> setInt(StorageKey key, int? value) =>
      setValue<int>(key, value);

  // ignore: avoid_positional_boolean_parameters
  FutureOr<bool> setBool(StorageKey key, bool? value) =>
      setValue<bool>(key, value);

  FutureOr<bool> setMap(StorageKey key, Map<String, Object?>? value) =>
      setValue<Map<String, Object?>>(key, value);

  FutureOr<bool> setList(StorageKey key, List<Object?>? value) =>
      setValue<List<Object?>>(key, value);

  FutureOr<String?> getString(StorageKey key, { String? defaultValue }) =>
      getValue<String>(key, defaultValue: defaultValue);

  FutureOr<int?> getInt(StorageKey key, { int? defaultValue }) =>
      getValue<int>(key, defaultValue: defaultValue);

  FutureOr<bool?> getBool(StorageKey key, { bool? defaultValue }) =>
      getValue<bool>(key, defaultValue: defaultValue);

  FutureOr<Map<String, Object?>?> getMap(StorageKey key, { Map<String, Object?>? defaultValue }) =>
      getValue<Map<String, Object?>>(key, defaultValue: defaultValue);

  FutureOr<List<Object?>?> getList(StorageKey key, { List<Object?>? defaultValue }) =>
      getValue<List<Object?>>(key, defaultValue: defaultValue);

  @protected
  FutureOr<T?> getValue<T>(StorageKey key, { T? defaultValue });

  @protected
  FutureOr<bool> setValue<T>(StorageKey key, T? value);
}