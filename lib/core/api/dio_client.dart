import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:oversize/core/status_model/status_model.dart';
import 'package:oversize/core/utils/utils.dart';

class DioClient {
  final String baseUrl = "https://oversize.onrender.com";

  late final Dio dioClient;

  DioClient() {
    dioClient = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        sendTimeout: const Duration(minutes: 1),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
    );

    dioClient.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) async {
          log("Method type: ${option.method}");
          log("Method path: ${option.path}");
          log("FULL URL: ${option.uri}");
          return handler.next(option);
        },
        onResponse: (response, handler) {
          log("Resposne body ${response.data}");
          log("Response status code: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (error, handler) {
          log("Error 1: $error");
          log("Resposne body ${error.response?.data}");
          try {
            return handler.resolve(error.response!);
          } catch (e) {
            return handler.next(error);
          }
        },
      ),
    );
  }

  Future<StatusModel> get({
    required String url,
    Map<String, dynamic>? header,
    Map<String, dynamic>? params,
    bool anotherlink = false,
  }) async {
    try {
      final requestUrl = anotherlink ? "" : baseUrl;

      final response = await dioClient.get(
        "$requestUrl$url",
        options: Options(headers: {if (header != null) ...header}),
        queryParameters: params,
      );

      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }

      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log("DioException: ${e.message}");
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      log("Unknown error: $e");
      throw Exception("Unexpected error: $e");
    }
  }

  Future<StatusModel> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dioClient.post(
        "$baseUrl$url",
        data: jsonEncode(body),
      );
      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }
      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log(e.message.toString());
      throw Exception("Dio error: ${e.message}");
    }
  }

  Future<StatusModel> put({required String url, required dynamic body}) async {
    try {
      final response = await dioClient.put(
        "$baseUrl$url",
        data: jsonEncode(body),
      );
      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }
      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log(e.message.toString());
      throw Exception("Dio error: ${e.message}");
    }
  }

  Future<StatusModel> delete({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dioClient.delete(
        "$baseUrl$url",
        data: jsonEncode(body ?? {}),
      );

      if (Utils.isDioSuccess(response.statusCode)) {
        return StatusModel(
          response: response.data,
          code: response.statusCode,
          isSuccess: true,
        );
      }
      return StatusModel(
        response: response.data,
        code: response.statusCode,
        isSuccess: false,
      );
    } on DioException catch (e) {
      log("DioException: ${e.message}");
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      log("Unknown error: $e");
      throw Exception("Unexpected error: $e");
    }
  }
}
