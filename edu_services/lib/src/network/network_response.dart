import 'package:dio/dio.dart';
import 'package:edu_services/src/network/exceptions/empty_response_exception.dart';

abstract class NetworkResponse<T> {
  final String path;
  final Headers headers;
  final int statusCode;
  final T? data;
  final DateTime timeStamp;

  bool get isSuccess => statusCode ~/ 100 == 2 || statusCode == 304;

  T get requireData {
    final data = this.data;
    if (data == null) {
      throw EmptyResponseException<T>(response: this);
    }
    return data;
  }

  const NetworkResponse({
    required this.path,
    required this.headers,
    required this.statusCode,
    required this.timeStamp,
    this.data,
  });
}

class ExternalNetworkResponse<T> extends NetworkResponse<T> {
  const ExternalNetworkResponse({
    required super.path,
    required super.headers,
    required super.statusCode,
    required super.timeStamp,
    super.data,
  });

  @override
  String toString() => 'ExternalNetworkResponse (path: $path, statusCode: $statusCode, timeStamp: $timeStamp, data: $data';
}

class ApiNetworkResponse extends NetworkResponse<Map<String, dynamic>> {
  final String? errorMessage;

  @override
  bool get isSuccess => super.isSuccess && errorMessage == null;

  const ApiNetworkResponse({
    required super.path,
    required super.headers,
    required super.statusCode,
    required super.timeStamp,
    super.data,
    this.errorMessage,
  });

  @override
  String toString() => 'ApiNetworkResponse (path: $path, statusCode: $statusCode, timeStamp: $timeStamp, data: $data, errorMessage: $errorMessage';
}
