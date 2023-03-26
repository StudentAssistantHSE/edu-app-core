import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { empty }

class EmailField extends FormzInput<String, EmailValidationError> {
  const EmailField.pure([ super.value = '' ]) : super.pure();
  const EmailField.dirty([ super.value = '' ]) : super.dirty();

  @override
  EmailValidationError? validator(String? value) {
    return StringValidator.notEmpty().validate(value).isValid ? null : EmailValidationError.empty;
  }
}