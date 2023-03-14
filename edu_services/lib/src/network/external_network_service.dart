import 'package:dio/dio.dart';
import 'package:edu_services/src/network/method.dart';
import 'package:edu_services/src/network/network_request.dart';
import 'package:edu_services/src/network/network_response.dart';

class ExternalNetworkService {
  final Dio _client;

  ExternalNetworkService() : _client = Dio(
    BaseOptions(
      responseType: ResponseType.bytes,
    ),
  );

  Future<ExternalNetworkResponse<T>> send<T>(
    String path,
    Method method,
    T? Function(Object?) fromData, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    bool decodeDataAsJson = true,
  }) async {
    final request = ExternalNetworkRequest<T>(
      path: path,
      method: method,
      fromData: fromData,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
      decodeDataAsJson: decodeDataAsJson,
    );
    final response = await request.send(_client);
    return response;
  }
}