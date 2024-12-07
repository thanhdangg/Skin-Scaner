import 'package:auto_route/auto_route.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRoute extends $AppRoute {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ScanRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: UploadRoute.page),
        AutoRoute(page: ResultRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: SettingRoute.page),
      ];
}
