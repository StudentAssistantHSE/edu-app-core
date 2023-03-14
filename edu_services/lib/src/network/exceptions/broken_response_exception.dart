import 'package:dio/dio.dart';

class BrokenResponseException implements Exception {
  final String details;
  final Response? response;

  const BrokenResponseException(this.details, { this.response });

  @override
  String toString() => 'BrokenResponseException: response is broken because of $details${response == null ? '' : ', $response'}';
}