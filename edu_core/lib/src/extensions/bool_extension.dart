extension BoolExtension on bool {
  bool implicates(Object? other) {
    if (!this) {
      return true;
    }
    return (other is bool) ? other : other != null;
  }
}