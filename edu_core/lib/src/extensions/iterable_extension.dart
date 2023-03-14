extension IterableExtension<T> on Iterable<T>? {
  T? get firstOrNull {
    final list = this;
    if (list == null) {
      return null;
    }
    return list.isEmpty ? null : list.first;
  }

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = this;
    if (list == null) {
      return null;
    }

    for (final element in list) {
      if (test(element)) return element;
    }

    return null;
  }
}

extension NotNullIterableExtension<T> on Iterable<T?> {
  Iterable<T> get whereNotNull => [
    for (final element in this)
      if (element != null)
        element,
  ];
}