// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:skin_scanner/ui/chat/chat_page.dart' as _i1;
import 'package:skin_scanner/ui/forgot_password/forgot_password_page.dart'
    as _i2;
import 'package:skin_scanner/ui/history/history_page.dart' as _i3;
import 'package:skin_scanner/ui/home/home_page.dart' as _i4;
import 'package:skin_scanner/ui/knowledge/knowledge_page.dart' as _i5;
import 'package:skin_scanner/ui/login/login_page.dart' as _i6;
import 'package:skin_scanner/ui/photo_preview/photo_preview_page.dart' as _i7;
import 'package:skin_scanner/ui/register/register_page.dart' as _i8;
import 'package:skin_scanner/ui/result/result_page.dart' as _i9;
import 'package:skin_scanner/ui/scan/scan_page.dart' as _i10;
import 'package:skin_scanner/ui/setting/setting_page.dart' as _i11;
import 'package:skin_scanner/ui/splash/splash_page.dart' as _i12;
import 'package:skin_scanner/ui/upload/upload_page.dart' as _i13;

abstract class $AppRoute extends _i14.RootStackRouter {
  $AppRoute({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChatPage(key: args.key),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordPage(),
      );
    },
    HistoryRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HistoryPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    KnowledgeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.KnowledgePage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginPage(key: args.key),
      );
    },
    PhotoPreviewRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoPreviewRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.PhotoPreviewPage(
          key: args.key,
          imagePath: args.imagePath,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.RegisterPage(key: args.key),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ResultPage(
          key: args.key,
          serverResponse: args.serverResponse,
        ),
      );
    },
    ScanRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ScanPage(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SettingPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashPage(),
      );
    },
    UploadRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.UploadPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i14.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i14.PageInfo<ChatRouteArgs> page =
      _i14.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HistoryPage]
class HistoryRoute extends _i14.PageRouteInfo<void> {
  const HistoryRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.KnowledgePage]
class KnowledgeRoute extends _i14.PageRouteInfo<void> {
  const KnowledgeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          KnowledgeRoute.name,
          initialChildren: children,
        );

  static const String name = 'KnowledgeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<LoginRouteArgs> page =
      _i14.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.PhotoPreviewPage]
class PhotoPreviewRoute extends _i14.PageRouteInfo<PhotoPreviewRouteArgs> {
  PhotoPreviewRoute({
    _i15.Key? key,
    required String imagePath,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          PhotoPreviewRoute.name,
          args: PhotoPreviewRouteArgs(
            key: key,
            imagePath: imagePath,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoPreviewRoute';

  static const _i14.PageInfo<PhotoPreviewRouteArgs> page =
      _i14.PageInfo<PhotoPreviewRouteArgs>(name);
}

class PhotoPreviewRouteArgs {
  const PhotoPreviewRouteArgs({
    this.key,
    required this.imagePath,
  });

  final _i15.Key? key;

  final String imagePath;

  @override
  String toString() {
    return 'PhotoPreviewRouteArgs{key: $key, imagePath: $imagePath}';
  }
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i14.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i14.PageInfo<RegisterRouteArgs> page =
      _i14.PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ResultPage]
class ResultRoute extends _i14.PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    _i15.Key? key,
    required Map<String, dynamic> serverResponse,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            key: key,
            serverResponse: serverResponse,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const _i14.PageInfo<ResultRouteArgs> page =
      _i14.PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    this.key,
    required this.serverResponse,
  });

  final _i15.Key? key;

  final Map<String, dynamic> serverResponse;

  @override
  String toString() {
    return 'ResultRouteArgs{key: $key, serverResponse: $serverResponse}';
  }
}

/// generated route for
/// [_i10.ScanPage]
class ScanRoute extends _i14.PageRouteInfo<void> {
  const ScanRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SettingPage]
class SettingRoute extends _i14.PageRouteInfo<void> {
  const SettingRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.UploadPage]
class UploadRoute extends _i14.PageRouteInfo<void> {
  const UploadRoute({List<_i14.PageRouteInfo>? children})
      : super(
          UploadRoute.name,
          initialChildren: children,
        );

  static const String name = 'UploadRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
