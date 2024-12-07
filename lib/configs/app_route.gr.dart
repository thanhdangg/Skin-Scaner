// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:skin_scanner/ui/chat/chat_page.dart' as _i1;
import 'package:skin_scanner/ui/forgot_password/forgot_password_page.dart'
    as _i2;
import 'package:skin_scanner/ui/home/home_page.dart' as _i3;
import 'package:skin_scanner/ui/knowledge/knowledge_page.dart' as _i4;
import 'package:skin_scanner/ui/login/login_page.dart' as _i5;
import 'package:skin_scanner/ui/register/register_page.dart' as _i6;
import 'package:skin_scanner/ui/result/result_page.dart' as _i7;
import 'package:skin_scanner/ui/scan/scan_page.dart' as _i8;
import 'package:skin_scanner/ui/setting/setting_page.dart' as _i9;
import 'package:skin_scanner/ui/splash/splash_page.dart' as _i10;
import 'package:skin_scanner/ui/upload/upload_page.dart' as _i11;

abstract class $AppRoute extends _i12.RootStackRouter {
  $AppRoute({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChatPage(key: args.key),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    KnowledgeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.KnowledgePage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginPage(key: args.key),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterPage(),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ResultPage(
          key: args.key,
          serverResponse: args.serverResponse,
        ),
      );
    },
    ScanRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ScanPage(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SettingPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashPage(),
      );
    },
    UploadRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.UploadPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i12.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i12.PageInfo<ChatRouteArgs> page =
      _i12.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i12.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.KnowledgePage]
class KnowledgeRoute extends _i12.PageRouteInfo<void> {
  const KnowledgeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          KnowledgeRoute.name,
          initialChildren: children,
        );

  static const String name = 'KnowledgeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<LoginRouteArgs> page =
      _i12.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ResultPage]
class ResultRoute extends _i12.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    _i13.Key? key,
    required Map<String, dynamic> serverResponse,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            serverResponse: serverResponse,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const _i12.PageInfo<ResultRouteArgs> page =
      _i12.PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.serverResponse,
  });

  final _i13.Key? key;

  final Map<String, dynamic> serverResponse;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, serverResponse: $serverResponse}';
  }
}

/// generated route for
/// [_i8.ScanPage]
class ScanRoute extends _i12.PageRouteInfo<void> {
  const ScanRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SettingPage]
class SettingRoute extends _i12.PageRouteInfo<void> {
  const SettingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.UploadPage]
class UploadRoute extends _i12.PageRouteInfo<void> {
  const UploadRoute({List<_i12.PageRouteInfo>? children})
      : super(
          UploadRoute.name,
          initialChildren: children,
        );

  static const String name = 'UploadRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
