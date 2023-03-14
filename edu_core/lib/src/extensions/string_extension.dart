extension StringExtension on String? {
  String? get notEmptyOrNull => (this?.isEmpty ?? true) ? null : this;
}