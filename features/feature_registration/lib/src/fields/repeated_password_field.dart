import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum RepeatedPasswordValidationError { empty, noMatchWithRepeated }

class RepeatedPasswordField extends FormzInput<String, RepeatedPasswordValidationError> {
  const RepeatedPasswordField.pure() : super.pure('');
  const RepeatedPasswordField.dirty([ super.value = '']) : super.dirty();

  @override
  RepeatedPasswordValidationError? validator(String? value) {
    return StringValidator.notEmpty().validate(value).isValid ? null : RepeatedPasswordValidationError.empty;
  }

  RepeatedPasswordValidationError? validateWithPassword(String? password) {
    return value == password ? null : RepeatedPasswordValidationError.noMatchWithRepeated;
  }
}