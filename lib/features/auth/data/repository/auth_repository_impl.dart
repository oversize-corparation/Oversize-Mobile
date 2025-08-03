import 'package:oversize/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:oversize/features/auth/domain/entity/auth_entity.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthEntity> login({required String email, required String password}) {
    return remoteDataSource.login(email: email, password: password);
  }
  @override
  Future<AuthEntity> createAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) {
    return remoteDataSource.createAccount(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
    );
  }
}
