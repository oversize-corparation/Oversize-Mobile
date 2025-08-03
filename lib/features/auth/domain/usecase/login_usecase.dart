import 'package:oversize/features/auth/domain/entity/auth_entity.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthEntity> call({required String email, required String password}) {
    return repository.login(email: email, password: password);
  }
}
