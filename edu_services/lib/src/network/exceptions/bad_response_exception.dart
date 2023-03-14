import 'package:edu_services/src/network/network_response.dart';

class BadResponseException<T> implements Exception {
  final String method;
  final String details;
  final NetworkResponse<T>? response;

  const BadResponseException._({
    required this.method,
    required this.details,
    this.response,
  });

  factory BadResponseException.unknownError({
    required String method,
    NetworkResponse<T>? response,
  }) => BadResponseException._(
    method: method,
    details: 'unknown error',
    response: response,
  );

  factory BadResponseException.unexpectedState({
    required String method,
    NetworkResponse<T>? response,
  }) => BadResponseException._(
    method: method,
    details: 'unexpected state',
    response: response,
  );

  @override
  String toString() {
    final string = 'BadResponseException: bad response for $method, $details';
    if (response != null) {
      return '$string, response: $response';
    }
    return string;
  }
}