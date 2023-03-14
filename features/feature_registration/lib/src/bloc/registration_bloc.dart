import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_core/edu_core.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_registration/src/fields/fields.dart';
import 'package:feature_registration/src/fields/full_name_field.dart';
import 'package:feature_registration/src/repository/registration_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationRepository _registrationRepository;

  RegistrationBloc({
    required RegistrationRepository registrationRepository,
  }) : _registrationRepository = registrationRepository,
       super(const RegistrationState.initial()) {
    on<RegistrationEmailFieldChanged>(_onEmailChanged);
    on<RegistrationFullNameFieldChanged>(_onFullNameChanged);
    on<RegistrationPasswordFieldChanged>(_onPasswordChanged);
    on<RegistrationRepeatedPasswordFieldChanged>(_onRepeatedPasswordChanged);
    on<RegistrationSubmitted>(_onSubmitted, transformer: bloc_concurrency.droppable());
  }

  void _onEmailChanged(
    RegistrationEmailFieldChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final email = EmailField.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        fieldsStatus: Formz.validate([email, state.fullName, state.password, state.repeatedPassword]),
      ),
    );
  }

  void _onFullNameChanged(
    RegistrationFullNameFieldChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final fullName = FullNameField.dirty(event.fullName);
    emit(
      state.copyWith(
        fullName: fullName,
        fieldsStatus: Formz.validate([state.email, fullName, state.password, state.repeatedPassword]),
      ),
    );
  }

  void _onPasswordChanged(
    RegistrationPasswordFieldChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final password = PasswordField.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        fieldsStatus: Formz.validate([state.email, state.fullName, password, state.repeatedPassword]),
      ),
    );
  }

  void _onRepeatedPasswordChanged(
    RegistrationRepeatedPasswordFieldChanged event,
    Emitter<RegistrationState> emit,
  ) {
    final repeatedPassword = RepeatedPasswordField.dirty(event.repeatedPassword);
    emit(
      state.copyWith(
        repeatedPassword: repeatedPassword,
        fieldsStatus: Formz.validate([state.email, state.fullName, state.password, repeatedPassword]),
      ),
    );
  }

  Future<void> _onSubmitted(
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) async {
    if (!state.fieldsStatus.isValidated) return;

    emit(state.copyWith(status: RegistrationStatus.inProgress));
    final repeatedPasswordValidationError = state.repeatedPassword.validateWithPassword(
      state.password.value,
    );
    if (repeatedPasswordValidationError != null) {
      emit(state.copyWith(status: RegistrationStatus.noRepeatedPasswordMatch));
      return;
    }
    try {
      final result = await _registrationRepository.register(
        email: state.email.value,
        fullName: state.fullName.value,
        password: state.password.value,
      );
      final token = result.token;
      if (token != null) {
        emit(state.copyWith(status: RegistrationStatus.success, resultToken: token.asNotNull));
        return;
      }

      final errorMessage = result.errorMessage;
      if (errorMessage != null) {
        emit(state.copyWith(status: RegistrationStatus.registrationError));
        return;
      }

      emit(state.copyWith(status: RegistrationStatus.undefinedError));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: e is DioError ? RegistrationStatus.connectionError : RegistrationStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
