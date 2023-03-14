import 'dart:convert';

abstract class Decoders {
  const Decoders._();

  static Map<String, Object?>? decodeMap(String? value, { Map<String, Object?>? defaultValue }) {
    if (value == null) {
      return defaultValue;
    }
    try {
      final dynamic decodedMap = jsonDecode(value);
      if (decodedMap is Map<String, Object?>) {
        return decodedMap;
      }
      return defaultValue;
    } on FormatException catch (_) {
      return defaultValue;
    }
  }

  static List<Object?>? decodeList(String? value, { List<Object?>? defaultValue }) {
    if (value == null) {
      return defaultValue;
    }
    try {
      final dynamic decodedList = jsonDecode(value);
      if (decodedList is List<Object?>) {
        return decodedList;
      }
      return defaultValue;
    } on FormatException catch (_) {
      return defaultValue;
    }
  }
}