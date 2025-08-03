import 'package:oversize/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required String accessToken,
    required int status,
    required String message,
  }) : super(accessToken: accessToken, status: status, message: message);

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      message: json['message'],
      status: json['status'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'status': status, 'access': accessToken};
  }
}
