import 'package:auto_route/auto_route.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRoute extends $AppRoute {
  @override
    List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ScanRoute.page, initial: false),
        AutoRoute(page: ChatRoute.page, initial: false),
        AutoRoute(page: UploadRoute.page, initial: false),
        AutoRoute(page: ResultRoute.page, initial: false),
        AutoRoute(page: LoginRoute.page, initial: false),
        AutoRoute(page: RegisterRoute.page, initial: false),  
        AutoRoute(page: ForgotPasswordRoute.page, initial: false),
        AutoRoute(page: SettingRoute.page, initial: false),
    ];
}