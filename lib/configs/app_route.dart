import 'package:auto_route/auto_route.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRoute extends $AppRoute {
  @override
    List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ScanRoute.page, initial: false)
    ];
  
}