import 'package:dio/dio.dart';
import 'package:oversize/core/api/dio_client.dart';
import 'package:oversize/features/auth/data/model/auth_model.dart';
import 'package:oversize/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRemoteDataSource {
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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl({required this.dioClient});
  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.dioClient.post(
        '/api/auth/login',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {'email': email, 'password': password},
      );
      print('Response: ${response.data}');
      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
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

  @override
  Future<AuthEntity> createAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await dioClient.dioClient.post(
        '/api/auth/register',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {
          'firstname': firstName,
          'lastname': lastName,
          'email': email,
          'password': password,
          'phone_number': phone,
        },
      );

      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        throw Exception(response.data['detail'] ?? 'Account creation failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final message =
            e.response?.data['detail'] ??
            e.response?.data['message'] ??
            'Server error: ${e.response?.statusCode}';
        throw Exception(message);
      } else {
        throw Exception('No Internet connection or server not responding');
      }
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }
  @override
  Future<AuthEntity> otpVerify({
    required String email,
    required String code,
    required bool restoration,
  }) async {
    try {
      final response = await dioClient.dioClient.post(
        '/api/auth/verify-otp',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {'email': email, 'code': code, 'restoration': restoration},
      );

      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        throw Exception(response.data['detail'] ?? 'OTP verification failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final message =
            e.response?.data['detail'] ??
            e.response?.data['message'] ??
            'Server error: ${e.response?.statusCode}';
        throw Exception(message);
      } else {
        throw Exception('No Internet connection or server not responding');
      }
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }
}
