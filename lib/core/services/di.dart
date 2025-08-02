import 'package:get_it/get_it.dart';
import 'package:oversize/core/api/dio_client.dart';
import 'package:oversize/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:oversize/features/auth/data/repository/auth_repository_impl.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';
import 'package:oversize/features/auth/domain/usecase/login_usecase.dart';
import 'package:oversize/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _client();
  _styles();
  _dataSources();
  _repositories();
  _useCase();
  _blocs();
}

void _client() {
  sl.registerFactory(() => DioClient());
}

void _styles() {}

void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl()),
  );
}

void _repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}

void _useCase() {
  sl.registerLazySingleton(() => LoginUseCase(sl()));
}

void _blocs() {
  sl.registerFactory(() => AuthBloc(sl()));
}
  // Bloc

  // // UseCases

  // // Repositories

  // // DataSources


  // // External
  // sl.registerLazySingleton(
  //   () =>
  //       Dio(BaseOptions(baseUrl: 'https://oversize-backend-fe9t.onrender.com')),
  // );

