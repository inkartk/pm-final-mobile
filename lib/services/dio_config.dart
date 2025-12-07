import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioConfig {
  static const String baseUrl = 'http://localhost:8000';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

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
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );

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
