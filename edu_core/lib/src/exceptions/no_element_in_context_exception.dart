class NoElementInContextException<T> implements Exception {
  Type get _type => T;

  const NoElementInContextException();

  @override
  String toString() => 'NoElementInContextException: no $_type found in context';
}