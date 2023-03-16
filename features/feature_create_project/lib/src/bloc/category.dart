import 'package:equatable/equatable.dart';

abstract class Category<T> extends Equatable {
  final T value;
  final String text;

  @override
  List<Object?> get props => [value, text];

  const Category(this.value, this.text);
}

class ExistingCategory extends Category<int> {
  const ExistingCategory(super.value, super.text);
}

class CustomCategory extends Category<String> {
  const CustomCategory(String value) : super(value, value);
}