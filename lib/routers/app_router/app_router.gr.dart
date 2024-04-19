// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GeneralWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GeneralWrapperPage(),
      );
    },
    HomeWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<HomeWrapperRouteArgs>(
          orElse: () => const HomeWrapperRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeWrapperPage(key: args.key),
      );
    },
    MenuWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuWrapperPage(),
      );
    },
    OrdersWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [GeneralWrapperPage]
class GeneralWrapperRoute extends PageRouteInfo<void> {
  const GeneralWrapperRoute({List<PageRouteInfo>? children})
      : super(
          GeneralWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeWrapperPage]
class HomeWrapperRoute extends PageRouteInfo<HomeWrapperRouteArgs> {
  HomeWrapperRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeWrapperRoute.name,
          args: HomeWrapperRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeWrapperRoute';

  static const PageInfo<HomeWrapperRouteArgs> page =
      PageInfo<HomeWrapperRouteArgs>(name);
}

class HomeWrapperRouteArgs {
  const HomeWrapperRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeWrapperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MenuWrapperPage]
class MenuWrapperRoute extends PageRouteInfo<void> {
  const MenuWrapperRoute({List<PageRouteInfo>? children})
      : super(
          MenuWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersWrapperPage]
class OrdersWrapperRoute extends PageRouteInfo<void> {
  const OrdersWrapperRoute({List<PageRouteInfo>? children})
      : super(
          OrdersWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
