class NoElementInMapException<Key, Value> implements Exception {
  final Key key;
  final Map<Key, Value>? map;

  const NoElementInMapException(this.key, { this.map });

  @override
  String toString() => 'NoElementInMapException: no $key found in map${map == null ? '' : ': $map'}';
}