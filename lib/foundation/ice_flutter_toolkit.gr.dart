// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:paloma_test/routers/general_wrapper.dart' as _i1;
import 'package:paloma_test/routers/home_wrapper.dart' as _i2;
import 'package:paloma_test/routers/menu_wrapper.dart' as _i4;
import 'package:paloma_test/routers/orders_wrapper.dart' as _i6;
import 'package:paloma_test/ui/menu_main/menu_main_page.dart' as _i3;
import 'package:paloma_test/ui/orders_main/orders_main_page.dart' as _i5;

abstract class $EmptyRouter extends _i7.RootStackRouter {
  $EmptyRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    GeneralWrapperRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GeneralWrapperPage(),
      );
    },
    HomeWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<HomeWrapperRouteArgs>(
          orElse: () => const HomeWrapperRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeWrapperPage(key: args.key),
      );
    },
    MenuMainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MenuMainPage(),
      );
    },
    MenuWrapperRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MenuWrapperPage(),
      );
    },
    OrdersMainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OrdersMainPage(),
      );
    },
    OrdersWrapperRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OrdersWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.GeneralWrapperPage]
class GeneralWrapperRoute extends _i7.PageRouteInfo<void> {
  const GeneralWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          GeneralWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralWrapperRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeWrapperPage]
class HomeWrapperRoute extends _i7.PageRouteInfo<HomeWrapperRouteArgs> {
  HomeWrapperRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          HomeWrapperRoute.name,
          args: HomeWrapperRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeWrapperRoute';

  static const _i7.PageInfo<HomeWrapperRouteArgs> page =
      _i7.PageInfo<HomeWrapperRouteArgs>(name);
}

class HomeWrapperRouteArgs {
  const HomeWrapperRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'HomeWrapperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.MenuMainPage]
class MenuMainRoute extends _i7.PageRouteInfo<void> {
  const MenuMainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MenuMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuMainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MenuWrapperPage]
class MenuWrapperRoute extends _i7.PageRouteInfo<void> {
  const MenuWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MenuWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuWrapperRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OrdersMainPage]
class OrdersMainRoute extends _i7.PageRouteInfo<void> {
  const OrdersMainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OrdersMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersMainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OrdersWrapperPage]
class OrdersWrapperRoute extends _i7.PageRouteInfo<void> {
  const OrdersWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          OrdersWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersWrapperRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
