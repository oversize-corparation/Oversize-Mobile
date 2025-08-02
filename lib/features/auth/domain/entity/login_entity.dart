class LoginResponseEntity {
  final String accessToken;
  final int status;
  final String message;

  LoginResponseEntity({
    required this.accessToken,
    required this.status,
    required this.message,
  });
}
