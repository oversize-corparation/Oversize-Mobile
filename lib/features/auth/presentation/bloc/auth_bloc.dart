import 'package:bloc/bloc.dart';
import 'package:oversize/features/auth/domain/usecase/login_usecase.dart';
import 'package:oversize/features/auth/presentation/bloc/auth_event.dart';
import 'package:oversize/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await loginUseCase(email: event.email, password: event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
