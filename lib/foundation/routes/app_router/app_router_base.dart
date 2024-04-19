part of '../../ice_flutter_toolkit.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class EmptyRouter extends AppRouterBase {
  @override
  List<RouteInfo> get infoRoutes => throw Exception(
      "Не реализован AppRouterBase и/или не передан в синглтон");
}

mixin class AppRouterBase implements RootStackRouter {
  static AppRouterBase? _singleton;

  static set singleton(AppRouterBase router) => _singleton ??= router;

  static AppRouterBase get singleton {
    _singleton ??= EmptyRouter();
    return _singleton!;
  }

  @override
  List<AutoRoute> get routes => infoRoutes.route((e) => e.route).toList();
  // List<AutoRoute> get routes => infoRoutes.map((e) => e.route).toList();

  RouteInfo get infoRoutes;

  // Map<Type, String>? _fullForServices;

  // set fullForServices(Map<Type, String> val) => _fullForServices = val;

  // Map<Type, String> get fullForServices {
  //   _fullForServices ??= RouteInfo.controllerTypePaths(infoRoutes)
  //       .asMap()
  //       .map((key, value) => value);
  //   return _fullForServices!;
  // }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class RouteInfo {
  final bool initial;
  final PageInfo<dynamic> page;
  final RouteController? routeController;
  final String name;
  RouteInfo? parent;
  final List<RouteInfo>? children;

  RouteInfo({
    this.initial = false,
    required this.page,
    this.routeController,
    required this.name,
    this.children,
  }) {
    routeController?.path = fullPath;

    if (childrenControllers.isEmpty) getTypes();

    // children?.map((e) => e.getTypes())

    // children?.forEach((element) => element.parent = this);
    // if (routeController != null) {
    //   childrenControllers.add(
    //       routeController.runtimeType, MapTypeRoutes(routeController!, child));
    // }
  }

  // final List<SetsMapEntry<E, V>> entries = [];
  // Set<Type> setParent(RouteInfo? parent) {
  SetsMapEntry<Type, RouteInfo> getTypes() {//RouteInfo? parent) {
    if (routeController != null) {
      childrenControllers
        .addAll<SetsMapEntry<Type, RouteInfo>>(children?.map((child) {
              child.parent = this;
              return child.getTypes();
              // return child.getTypes(child).keys.reduce((first, second) {
              //   first.addAll(second);
              //   return first;
              // });
            }) ??
            []);
    }
    var types = childrenControllers.keys.reduce((first, second) {
      first.addAll(second);
      return first;
    }).toSet();

    if (routeController != null) {
      types.add(routeController.runtimeType);
    }

    return SetsMapEntry(types, this);
    // // .reduce((first, second) {
    // //
    // // first.addAll(second);
    // // return first;
    // // }) ?? {};///Получил все дочерние типы
    // types.add(routeController.runtimeType);
    //
    // childrenControllers.add(key, value)
    // // childrenControllers =
    // // MapTypeRoutes(routeController!, child)
    //
    // childrenControllers.add(
    //     routeController.runtimeType, MapTypeRoutes(routeController!, child))
    // childrenControllers.add(
    //     routeController.runtimeType, MapTypeRoutes(routeController!, child))
    // return childrenControllers;
    // return s;
  }

  SetsMap<Type, RouteInfo> childrenControllers = SetsMap();

  ///like: general/home/
  String? get parentPath => parent?.fullPath;

  String get fullPath {
    String? parent = parentPath;
    if (parent == null) return name;

    return parent.endsWith('/')
        ? "${parentPath ?? ""}$name"
        : "${parentPath ?? ""}/$name";
  }

  CustomRoute get route => CustomRoute(
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 400,
        initial: initial,
        page: page,
        path: name,
        children: children?.map((info) => info.route).toList(),
      );
}
//
// class MapTypeRoutes {
//   MapTypeRoutes(this.controller, this.child);
//
//   MapTypeRoutes? child;
//   RouteController controller;
// }
