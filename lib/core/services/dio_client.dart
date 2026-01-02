import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/app_config.dart';
import 'logger.dart';

/// Dio client configuration
class DioClient {
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        sendTimeout: AppConfig.sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token if available
          // final token = storageService.getString(AppConfig.keyAuthToken);
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          AppLogger.d('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.d('Response: ${response.statusCode} ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (error, handler) {
          AppLogger.e(
            'Error: ${error.response?.statusCode} ${error.requestOptions.path}',
            error: error,
          );
          return handler.next(error);
        },
      ),
    );
  }

  late final Dio _dio;

  Dio get dio => _dio;
}

/// Provider for Dio client
final dioClientProvider = Provider<DioClient>((ref) => DioClient());

