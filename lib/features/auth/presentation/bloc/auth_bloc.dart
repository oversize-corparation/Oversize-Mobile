import 'package:bloc/bloc.dart';
import 'package:oversize/features/auth/domain/usecase/create_account_usecase.dart';
import 'package:oversize/features/auth/domain/usecase/login_usecase.dart';
import 'package:oversize/features/auth/domain/usecase/otp_verify_usecase.dart';
import 'package:oversize/features/auth/presentation/bloc/auth_event.dart';
import 'package:oversize/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final CreateAccountUsecase createAccountUsecase;
  final OtpVerifyUsecase otpVerifyUsecase;

  AuthBloc(this.loginUseCase,this.createAccountUsecase,this.otpVerifyUsecase) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await loginUseCase(email: event.email, password: event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<CreateAccountRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await createAccountUsecase(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          password: event.password,
          phone: event.phone,
        );
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<OtpVerifyRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await otpVerifyUsecase(
          email: event.email,
          code: event.code,
          restoration: event.restoration,
        );
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
