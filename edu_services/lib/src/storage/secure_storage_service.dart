import 'dart:convert';

import 'package:edu_services/src/storage/decoders.dart';
import 'package:edu_services/src/storage/storage_key.dart';
import 'package:edu_services/src/storage/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService extends StorageService {
  static const _false = 'false';
  static const _true = 'true';

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: IOSAccessibility.first_unlock),
  );

  const SecureStorageService();

  @override
  Future<bool> remove(StorageKey key) async {
    await _secureStorage.delete(key: key.asString);
    return true;
  }

  @override
  Future<bool> removeAll() async {
    await _secureStorage.deleteAll();
    return true;
  }

  @override
  Future<T?> getValue<T>(StorageKey key, { T? defaultValue }) async {
    final value = await _secureStorage.read(key: key.asString);
    if (value == null) {
      return defaultValue;
    }

    if (T == String) {
      return value as T;
    } else if (T == int) {
      final parsedValue = int.tryParse(value);
      return (parsedValue as T?) ?? defaultValue;
    } else if (T == bool) {
      if (value == _true) {
        return true as T;
      }
      if (value == _false) {
        return false as T;
      }
      return defaultValue;
    } else if (T == Map<String, Object?>) {
      return Decoders.decodeMap(value, defaultValue: defaultValue as Map<String, Object?>?) as T?;
    } else if (T == List<Object?>) {
      return Decoders.decodeList(value, defaultValue: defaultValue as List<Object?>?) as T?;
    }

    throw UnimplementedError('Secure storage: not implemented value type: ${T.runtimeType}');
  }

  @override
  Future<bool> setValue<T>(StorageKey key, T? value) async {
    if (value == null) {
      await _secureStorage.delete(key: key.asString);
      return true;
    }

    if (value is String) {
      await _secureStorage.write(key: key.asString, value: value);
      return true;
    } else if (value is int) {
      await _secureStorage.write(key: key.asString, value: value.toString());
      return true;
    } else if (value is bool) {
      await _secureStorage.write(key: key.asString, value: value ? _true : _false);
      return true;
    } else if (value is Map<String, Object?>) {
      await _secureStorage.write(key: key.asString, value: jsonEncode(value));
      return true;
    } else if (value is List<Object?>) {
      await _secureStorage.write(key: key.asString, value: jsonEncode(value));
      return true;
    }

    throw UnimplementedError('Secure storage: not implemented value type: ${value.runtimeType}');
  }
}