import 'package:oversize/features/auth/domain/entity/auth_entity.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';

class CreateAccountUsecase {
  final AuthRepository repository;

  CreateAccountUsecase(this.repository);

  Future<AuthEntity> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) {
    return repository.createAccount(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
    );
  }
}
