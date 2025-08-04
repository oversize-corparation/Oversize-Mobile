abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}
class CreateAccountRequested extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;

  CreateAccountRequested({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
  });
}
class OtpVerifyRequested extends AuthEvent {
  final String email;
  final String code;
  final bool restoration;

  OtpVerifyRequested({
    required this.email,
    required this.code,
    required this.restoration,
  });
}
