import 'package:dio/dio.dart';
import 'package:oversize/features/auth/data/model/login_model.dart';
import 'package:oversize/features/auth/domain/entity/login_entity.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseEntity> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});
  @override
  Future<LoginResponseEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/api/auth/login',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data['detail'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // Agar backend xatolik qaytarsa
        final message =
            e.response?.data['detail'] ??
            e.response?.data['message'] ??
            'Server error: ${e.response?.statusCode}';
        throw Exception(message);
      } else {
        // Tarmoq xatoliklari, timeout, yoki boshqa sabablardan
        throw Exception('No Internet connection or server not responding');
      }
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }
}
