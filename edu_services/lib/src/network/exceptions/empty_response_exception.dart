import 'package:edu_services/src/network/network_response.dart';

class EmptyResponseException<T> implements Exception {
  final NetworkResponse<T>? response;

  const EmptyResponseException({ this.response });

  @override
  String toString() => 'EmptyResponseException: response data is null${response == null ? '' : ', $response'}';
}