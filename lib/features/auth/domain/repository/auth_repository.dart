import 'package:oversize/features/auth/domain/entity/login_entity.dart';

abstract class AuthRepository {
  Future<LoginResponseEntity> login({required String email, required String password});
}
