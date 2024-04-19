// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:paloma_test/routers/general_wrapper.dart' as _i1;
import 'package:paloma_test/routers/home_wrapper.dart' as _i2;
import 'package:paloma_test/routers/menu_wrapper.dart' as _i3;
import 'package:paloma_test/routers/orders_wrapper.dart' as _i4;

abstract class $EmptyRouter extends _i5.RootStackRouter {
  $EmptyRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    GeneralWrapperRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.GeneralWrapperPage(),
      );
    },
    HomeWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<HomeWrapperRouteArgs>(
          orElse: () => const HomeWrapperRouteArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeWrapperPage(key: args.key),
      );
    },
    MenuWrapperRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MenuWrapperPage(),
      );
    },
    OrdersWrapperRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OrdersWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.GeneralWrapperPage]
class GeneralWrapperRoute extends _i5.PageRouteInfo<void> {
  const GeneralWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(
          GeneralWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralWrapperRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeWrapperPage]
class HomeWrapperRoute extends _i5.PageRouteInfo<HomeWrapperRouteArgs> {
  HomeWrapperRoute({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          HomeWrapperRoute.name,
          args: HomeWrapperRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeWrapperRoute';

  static const _i5.PageInfo<HomeWrapperRouteArgs> page =
      _i5.PageInfo<HomeWrapperRouteArgs>(name);
}

class HomeWrapperRouteArgs {
  const HomeWrapperRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'HomeWrapperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.MenuWrapperPage]
class MenuWrapperRoute extends _i5.PageRouteInfo<void> {
  const MenuWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MenuWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuWrapperRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OrdersWrapperPage]
class OrdersWrapperRoute extends _i5.PageRouteInfo<void> {
  const OrdersWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(
          OrdersWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersWrapperRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
