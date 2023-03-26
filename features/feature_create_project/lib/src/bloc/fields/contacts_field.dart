import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum ContactsValidationError { incorrect }

class ContactsField extends FormzInput<String, ContactsValidationError> {
  const ContactsField.pure([ super.value = '' ]) : super.pure();
  const ContactsField.dirty([ super.value = '' ]) : super.dirty();

  @override
  ContactsValidationError? validator(String? value) {
    return StringValidator.minLength(minLength: 3).validate(value).isValid ? null : ContactsValidationError.incorrect;
  }
}