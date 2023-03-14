import 'package:edu_core/edu_core.dart';
import 'package:equatable/equatable.dart';
import 'package:feature_authentication/src/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(AuthenticationState(token: authenticationRepository.token.asNotNull)) {
    on<AuthenticationLoggedIn>(_onLoggedIn);
    on<AuthenticationLoggedOut>(_onLoggedOut);
  }

  Future<void> _onLoggedIn(
    AuthenticationLoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(token: event.token.asNotNull));
    await _authenticationRepository.setToken(event.token);
  }

  Future<void> _onLoggedOut(
    AuthenticationLoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(token: const NotNullObjectWrapper(null)));
    await _authenticationRepository.setToken(null);
  }
}
