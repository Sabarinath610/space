
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../usecases/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final AuthRepositoryInterface repo;

  AuthBloc({required this.loginUseCase, required this.repo}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    final res = await repo.login(event.email, event.password);
    res.fold(
          (f) => emit(AuthError(f.message)),
          (user) => emit(AuthAuthenticated(user)),
    );
  }

  void _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) =>
      emit(AuthUnauthenticated());
}
