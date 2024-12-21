import 'package:dio/dio.dart';

class AppDio {
  final Dio dio;

  AppDio()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'https://lab-moving-grizzly.ngrok-free.app',
            validateStatus: (status) =>
                status != null &&
                status < 500, // Accept status codes less than 500
            followRedirects: true,
            responseType: ResponseType.json,
            sendTimeout: const Duration(milliseconds: 30000),
            receiveTimeout: const Duration(milliseconds: 30000),
            headers: {'Content-Type': 'application/json'},
          ),
        );
}
