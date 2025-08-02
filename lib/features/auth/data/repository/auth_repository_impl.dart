import 'package:oversize/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:oversize/features/auth/domain/entity/login_entity.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResponseEntity> login({required String email, required String password}) {
  return remoteDataSource.login(email: email, password: password);
}

}
