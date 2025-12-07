import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Configuration class for Dio HTTP client
class DioConfig {
  // Backend API base URL
  // Для macOS/iOS Simulator используйте: http://localhost:8000
  // Для Android Emulator используйте: http://10.0.2.2:8000
  static const String baseUrl = 'http://localhost:8000';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  /// Create configured Dio instance
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        // Принимаем все статусы для ручной обработки ошибок
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );

    // Добавляем логирование для отладки
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 75,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
        logPrint: (obj) => logger.d(obj),
      ),
    );

    // Interceptor для обработки ошибок
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) {
          logger.e(
            'HTTP Error: ${error.type}\n'
            'Message: ${error.message}\n'
            'URL: ${error.requestOptions.uri}',
          );
          handler.next(error);
        },
      ),
    );

    return dio;
  }
}
