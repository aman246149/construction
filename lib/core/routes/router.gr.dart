// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:architecture/features/home/desktop/desktop_home.dart' as _i3;
import 'package:architecture/features/home/home.dart' as _i2;
import 'package:architecture/features/home/mobile/mobile_home.dart' as _i4;
import 'package:architecture/features/splashScreen/splash_screen.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    DesktopHomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.DesktopHome(),
      );
    },
    MobileHomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.MobileHome(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          SplashScreenRoute.name,
          path: '',
        ),
        _i5.RouteConfig(
          HomePageRoute.name,
          path: '',
        ),
        _i5.RouteConfig(
          DesktopHomeRoute.name,
          path: '',
        ),
        _i5.RouteConfig(
          MobileHomeRoute.name,
          path: '',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.DesktopHome]
class DesktopHomeRoute extends _i5.PageRouteInfo<void> {
  const DesktopHomeRoute()
      : super(
          DesktopHomeRoute.name,
          path: '',
        );

  static const String name = 'DesktopHomeRoute';
}

/// generated route for
/// [_i4.MobileHome]
class MobileHomeRoute extends _i5.PageRouteInfo<void> {
  const MobileHomeRoute()
      : super(
          MobileHomeRoute.name,
          path: '',
        );

  static const String name = 'MobileHomeRoute';
}
