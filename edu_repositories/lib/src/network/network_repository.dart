import 'dart:async';
import 'dart:io';

import 'package:edu_core/edu_core.dart';
import 'package:edu_services/edu_services.dart';

class NetworkRepository {
  final String? _token;
  final Env _environment;
  final ApiNetworkService _apiNetworkService;
  final ExternalNetworkService _externalNetworkService;

  const NetworkRepository(
    this._token,
    this._environment,
    this._apiNetworkService,
    this._externalNetworkService,
  );

  Future<ApiNetworkResponse> sendApiRequest(
    String path,
    Method method, {
    bool relative = true,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, UploadFile>? files,
  }) async {
    final token = _token;
    final headers = <String, String> {
      if (token != null && token.isEmpty)
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    final response = await _apiNetworkService.send(
      '${relative ? _environment.apiAddress : ''}$path',
      method,
      body: body,
      files: files,
      headers: headers,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<ExternalNetworkResponse<T>> sendExternalRequest<T>(
    String path,
    Method method,
    T? Function(Object?) fromData, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    bool decodeDataAsJson = true,
  }) => _externalNetworkService.send(
    path,
    method,
    fromData,
    headers: headers,
    queryParameters: queryParameters,
    body: body,
    decodeDataAsJson: decodeDataAsJson,
  );
}