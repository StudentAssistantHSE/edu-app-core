import 'package:edu_core/edu_core.dart';
import 'package:formz/formz.dart';

enum MessageValidationError { incorrect }

class MessageField extends FormzInput<String, MessageValidationError> {
  const MessageField.pure([ super.value = '' ]) : super.pure();
  const MessageField.dirty([ super.value = '' ]) : super.dirty();

  @override
  MessageValidationError? validator(String? value) {
    return StringValidator.minLength(minLength: 3).validate(value).isValid ? null : MessageValidationError.incorrect;
  }
}