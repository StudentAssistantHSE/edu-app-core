import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { incorrect }

class EmailField extends FormzInput<String, EmailValidationError> {
  const EmailField.pure() : super.pure('');
  const EmailField.dirty([ super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    return StringValidator.email().validate(value).isValid ? null : EmailValidationError.incorrect;
  }
}