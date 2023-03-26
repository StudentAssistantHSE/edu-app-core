import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError { incorrect }

class PasswordField extends FormzInput<String, PasswordValidationError> {
  const PasswordField.pure([ super.value = '' ]) : super.pure();
  const PasswordField.dirty([ super.value = '' ]) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    return StringValidator.password().validate(value).isValid ? null : PasswordValidationError.incorrect;
  }
}