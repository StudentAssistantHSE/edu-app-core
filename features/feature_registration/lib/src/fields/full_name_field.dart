import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum FullNameValidationError { incorrect }

class FullNameField extends FormzInput<String, FullNameValidationError> {
  const FullNameField.pure() : super.pure('');
  const FullNameField.dirty([ super.value = '']) : super.dirty();

  @override
  FullNameValidationError? validator(String? value) {
    return StringValidator.minLength(minLength: 3).validate(value).isValid ? null : FullNameValidationError.incorrect;
  }
}