import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:edu_core/edu_core.dart';
import 'package:edu_repositories/edu_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_login/src/fields/fields.dart';
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
  ) {
    final email = EmailField.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        fieldsStatus: Formz.validate([email, state.password]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordFieldChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = PasswordField.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        fieldsStatus: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.fieldsStatus.isValidated) return;

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
    } on Exception catch (e) {
      emit(state.copyWith(
        status: e is DioError ? LoginStatus.connectionError : LoginStatus.undefinedError,
      ));
      rethrow;
    }
  }
}
