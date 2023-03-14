import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edu_core/edu_core.dart';
import 'package:edu_services/src/network/exceptions/broken_response_exception.dart';
import 'package:edu_services/src/network/method.dart';
import 'package:edu_services/src/network/network_response.dart';
import 'package:edu_services/src/network/upload_file.dart';
import 'package:flutter/foundation.dart';

abstract class NetworkRequest<T> {
  final String path;
  final Method method;
  final Map<String, String>? headers;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? body;

  const NetworkRequest({
    required this.path,
    required this.method,
    this.headers,
    this.queryParameters,
    this.body,
  });

  Future<NetworkResponse<T>> send(Dio client);

  @protected
  DateTime timeStampFromHeaders(Headers headers) {
    final timeStampString = headers.map[HttpHeaders.dateHeader].firstOrNull;
    if (timeStampString == null) {
      return DateTime.now().toUtc();
    } else {
      return HttpDate.parse(timeStampString).toUtc();
    }
  }
}

class ExternalNetworkRequest<T> extends NetworkRequest<T> {
  final T? Function(Object?) fromData;
  final bool decodeDataAsJson;

  const ExternalNetworkRequest({
    required super.path,
    required super.method,
    required this.fromData,
    super.headers,
    super.queryParameters,
    super.body,
    this.decodeDataAsJson = true,
  });

  @override
  Future<ExternalNetworkResponse<T>> send(Dio client) async {
    final response = await client.request<Uint8List>(
      path,
      queryParameters: queryParameters,
      data: body,
      options: Options(
        method: method.asString,
        headers: headers,
      ),
    );

    T? data;
    if (response.data != null) {
      try {
        data = fromData(
          decodeDataAsJson
              ? jsonDecode(utf8.decode(response.data!))
              : response.data!,
        );
      }
      on FormatException catch (_) {}
    }

    final statusCode = response.statusCode;
    if (statusCode == null) {
      throw BrokenResponseException('status code is null', response: response);
    }

    return ExternalNetworkResponse<T>(
      path: response.requestOptions.path,
      headers: response.headers,
      statusCode: statusCode,
      data: data,
      timeStamp: timeStampFromHeaders(response.headers),
    );
  }
}

class ApiNetworkRequest extends NetworkRequest<Map<String, dynamic>> {
  final Map<String, UploadFile>? files;

  String get _appendedSlashPath => '$path${method != Method.get && path[path.length - 1] != '/' ? '/' : ''}';

  const ApiNetworkRequest({
    required super.path,
    required super.method,
    super.headers,
    super.queryParameters,
    super.body,
    this.files,
  });

  @override
  Future<ApiNetworkResponse> send(Dio client) async {
    final response = await client.request<Uint8List>(
      _appendedSlashPath,
      queryParameters: queryParameters,
      data: _createData(),
      options: Options(
        method: method.asString,
        headers: headers,
      ),
    );

    Map<String, dynamic>? data;
    String? errorMessage;
    if (response.data != null) {
      try {
        data = jsonDecode(utf8.decode(response.data!)) as Map<String, dynamic>;
        final statusCode = response.statusCode;
        final isSuccess = statusCode != null && (statusCode ~/ 100 == 2 || statusCode == 304);
        if (data.containsKey('message') && !isSuccess) {
          errorMessage = data['message'] as String?;
        }
      }
      on FormatException catch (_) {}
    }

    final statusCode = response.statusCode;
    if (statusCode == null) {
      throw BrokenResponseException('status code is null', response: response);
    }

    return ApiNetworkResponse(
      path: response.requestOptions.path,
      headers: response.headers,
      statusCode: statusCode,
      data: data,
      errorMessage: errorMessage,
      timeStamp: timeStampFromHeaders(response.headers),
    );
  }

  dynamic _createData() {
    final isFormDataOptions = files?.isNotEmpty ?? false;
    final dynamic data = isFormDataOptions ? FormData() : body;
    if (data is FormData) {
      data.fields.addAll(body?.entries.map((e) => MapEntry(e.key, jsonEncode(e.value))) ?? const []);
      data.files.addAll(files?.entries.map((e) => MapEntry(
        e.key, MultipartFile.fromBytes(e.value.bytes, filename: e.value.name),
      )) ?? const []);
    }

    return data;
  }
}
