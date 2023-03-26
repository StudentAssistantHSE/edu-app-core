import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_core/edu_core.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_login/src/bloc/fields/fields.dart';
import 'package:feature_login/src/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository,
       super(const LoginState.initial()) {
    on<LoginEmailFieldChanged>(_onEmailChanged);
    on<LoginPasswordFieldChanged>(_onPasswordChanged);
    on<LoginSubmitted>(
      _onSubmitted,
      transformer: bloc_concurrency.droppable(),
    );
  }

  void _onEmailChanged(
    LoginEmailFieldChanged event,
    Emitter<LoginState> emit,
  ) => emit(state.copyWith(email: EmailField.pure(event.email)));

  void _onPasswordChanged(
    LoginPasswordFieldChanged event,
    Emitter<LoginState> emit,
  ) => emit(state.copyWith(password: PasswordField.pure(event.password)));

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      email: EmailField.dirty(state.email.value),
      password: PasswordField.dirty(state.password.value),
    ));
    final isValid = Formz.validate([state.email, state.password]);
    if (!isValid) {
      return;
    }

    emit(state.copyWith(status: LoginStatus.inProgress));
    try {
      final result = await _loginRepository.login(
        email: state.email.value,
        password: state.password.value,
      );
      final token = result.token;
      if (token != null) {
        emit(state.copyWith(status: LoginStatus.success, resultToken: token.asNotNull));
        return;
      }

      final errorMessage = result.errorMessage;
      if (errorMessage != null) {
        emit(state.copyWith(status: LoginStatus.incorrectCredentials));
        return;
      }

      emit(state.copyWith(status: LoginStatus.undefinedError));
    } on Object catch (e) {
      emit(state.copyWith(
        status: e is DioError ? LoginStatus.connectionError : LoginStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
