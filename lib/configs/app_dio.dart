import 'package:dio/dio.dart';

class AppDio {
  final Dio dio;

  AppDio()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://yourapi.com', 
          responseType: ResponseType.json,
          sendTimeout: const Duration(milliseconds: 30000),  
          receiveTimeout: const Duration(milliseconds: 30000),  
          headers: {'Content-Type': 'application/json'},  
        ));
}
