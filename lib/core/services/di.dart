import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oversize/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:oversize/features/auth/data/repository/auth_repository_impl.dart';
import 'package:oversize/features/auth/domain/repository/auth_repository.dart';
import 'package:oversize/features/auth/domain/usecase/login_usecase.dart';
import 'package:oversize/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => AuthBloc(sl()));

  // UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // DataSources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(dio: sl()));

  // External
  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'https://oversize-backend-fe9t.onrender.com')));
}
