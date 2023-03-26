import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_core/edu_core.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_registration/src/bloc/fields/fields.dart';
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
  ) => emit(state.copyWith(email: EmailField.pure(event.email)));

  void _onFullNameChanged(
    RegistrationFullNameFieldChanged event,
    Emitter<RegistrationState> emit,
  ) => emit(state.copyWith(fullName: FullNameField.pure(event.fullName)));

  void _onPasswordChanged(
    RegistrationPasswordFieldChanged event,
    Emitter<RegistrationState> emit,
  ) => emit(state.copyWith(password: PasswordField.pure(event.password)));

  void _onRepeatedPasswordChanged(
    RegistrationRepeatedPasswordFieldChanged event,
    Emitter<RegistrationState> emit,
  ) => emit(state.copyWith(repeatedPassword: RepeatedPasswordField.pure(event.repeatedPassword)));

  Future<void> _onSubmitted(
    RegistrationSubmitted event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(
      email: EmailField.dirty(state.email.value),
      fullName: FullNameField.dirty(state.fullName.value),
      password: PasswordField.dirty(state.password.value),
      repeatedPassword: RepeatedPasswordField.dirty(state.repeatedPassword.value),
    ));
    final isValid = Formz.validate([state.email, state.fullName, state.password, state.repeatedPassword]);
    if (!isValid) {
      return;
    }

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
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError ? RegistrationStatus.connectionError : RegistrationStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
