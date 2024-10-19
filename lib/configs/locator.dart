import 'package:get_it/get_it.dart';
import 'package:skin_scanner/configs/app_dio.dart';
import 'package:skin_scanner/configs/app_route.dart';
import 'package:http/http.dart' as http;
import 'package:skin_scanner/data/repositories/chat_repository.dart';

final getIt = GetIt.instance;

final dio = getIt<AppDio>().dio;

void setupLocator() {
  getIt.registerSingleton<AppRoute>(AppRoute());
  getIt.registerSingleton<AppDio>(AppDio());
  getIt.registerSingleton<http.Client>(http.Client());
  getIt.registerSingleton<ChatRepository>(ChatRepository());

}