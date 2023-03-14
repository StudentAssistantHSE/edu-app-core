import 'package:dio/dio.dart';
import 'package:edu_services/src/network/method.dart';
import 'package:edu_services/src/network/network_request.dart';
import 'package:edu_services/src/network/network_response.dart';
import 'package:edu_services/src/network/upload_file.dart';

class ApiNetworkService {
  final Dio _client;

  ApiNetworkService() : _client = Dio(
    BaseOptions(
      responseType: ResponseType.bytes,
      validateStatus: (_) => true,
    ),
  );

  Future<ApiNetworkResponse> send(
    String path,
    Method method, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, UploadFile>? files,
  }) async {
    final request = ApiNetworkRequest(
      path: path,
      method: method,
      body: body,
      files: files,
      headers: headers,
      queryParameters: queryParameters,
    );
    final response = await request.send(_client);
    return response;
  }
}