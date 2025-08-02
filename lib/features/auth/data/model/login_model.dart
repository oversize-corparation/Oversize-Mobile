import 'package:oversize/features/auth/domain/entity/login_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
    required String accessToken,
    required int status,
    required String message,
  }) : super(accessToken: accessToken, status: status, message: message);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      status: json['status'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'status': status, 'access': accessToken};
  }
}
