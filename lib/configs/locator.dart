import 'package:get_it/get_it.dart';
import 'package:skin_scanner/configs/app_dio.dart';
import 'package:skin_scanner/configs/app_route.dart';

final getIt = GetIt.instance;

final dio = getIt<AppDio>().dio;

void setupLocator() {
  getIt.registerSingleton<AppRoute>(AppRoute());
  getIt.registerSingleton<AppDio>(AppDio());
}