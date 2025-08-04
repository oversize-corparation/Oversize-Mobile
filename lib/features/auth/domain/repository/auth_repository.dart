import 'package:oversize/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login({required String email, required String password});
  Future<AuthEntity> createAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  });
  Future<AuthEntity> otpVerify({
    required String email,
    required String code,
    required bool restoration,
  });
}
