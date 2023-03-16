import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum NameValidationError { incorrect }

class NameField extends FormzInput<String, NameValidationError> {
  const NameField.pure() : super.pure('');
  const NameField.dirty([ super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String? value) {
    return StringValidator.minLength(minLength: 3).validate(value).isValid ? null : NameValidationError.incorrect;
  }
}