// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:skin_scanner/ui/chat/chat_page.dart' as _i1;
import 'package:skin_scanner/ui/home/home_page.dart' as _i2;
import 'package:skin_scanner/ui/scan/scan_page.dart' as _i3;

abstract class $AppRoute extends _i4.RootStackRouter {
  $AppRoute({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChatPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    ScanRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ScanPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i4.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i4.PageInfo<ChatRouteArgs> page =
      _i4.PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ScanPage]
class ScanRoute extends _i4.PageRouteInfo<void> {
  const ScanRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
