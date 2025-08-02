import 'package:oversize/features/auth/domain/entity/login_entity.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponseEntity> call({required String email, required String password}) {
  return repository.login(email: email, password: password);
}

}
