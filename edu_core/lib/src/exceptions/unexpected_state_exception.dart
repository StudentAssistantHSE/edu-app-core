class UnexpectedStateException implements Exception {
  final String message;

  const UnexpectedStateException(this.message);

  @override
  String toString() => 'UnexpectedStateException: $message';
}