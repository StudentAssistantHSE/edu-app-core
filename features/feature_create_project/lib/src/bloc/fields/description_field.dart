import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum DescriptionValidationError { incorrect }

class DescriptionField extends FormzInput<String, DescriptionValidationError> {
  const DescriptionField.pure([ super.value = '' ]) : super.pure();
  const DescriptionField.dirty([ super.value = '' ]) : super.dirty();

  @override
  DescriptionValidationError? validator(String? value) {
    return StringValidator.minLength(minLength: 3).validate(value).isValid ? null : DescriptionValidationError.incorrect;
  }
}