class AuthEntity {
  final String accessToken;
  final int status;
  final String message;

  AuthEntity({
    required this.accessToken,
    required this.status,
    required this.message,
  });
}
