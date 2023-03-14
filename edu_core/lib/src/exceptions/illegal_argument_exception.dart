class IllegalArgumentException implements Exception {
  final String message;

  const IllegalArgumentException(this.message);

  @override
  String toString() => 'IllegalArgumentException: $message';
}