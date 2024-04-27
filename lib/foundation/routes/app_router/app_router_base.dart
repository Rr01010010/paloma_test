part of '../../ice_flutter_toolkit.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class EmptyRouter extends AppRouterBase {
  @override
  RouteInfo get infoRoute => throw Exception(
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
  List<AutoRoute> get routes => [infoRoute.route]; //((e) => e.route).toList();
  // List<AutoRoute> get routes => infoRoutes.map((e) => e.route).toList();

  RouteInfo get infoRoute;

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
    // if (childrenControllers.isEmpty) getTypes();

    // children?.map((e) => e.getTypes())

    print("$name   : CHILDRENS -> ${children?.length}");
    children?.forEach((element) {
      print("$name   : CHILDRENS -> ${element.name}");
      element.parent = this;
      paths[element.name] = element;
      // element.routeController?.path = element.fullPath;
    });
    routeController?.routeInfo = this;

    // setPath();
    // if (routeController != null) {
    //   childrenControllers.add(
    //       routeController.runtimeType, MapTypeRoutes(routeController!, child));
    // }
  }
  // Future<void> setPath() async {
  //   routeController?.path = fullPath;
  // }



  T? getService<T extends RouteController>([String? path]) {
    // return AppRouterBase.singleton.infoRoute.getPath<T>()?.routeController as T?;
    // var routeInfo = AppRouterBase.singleton.infoRoute.getPath<T>();

    // path ??= AppRouterBase.singleton.infoRoute.getPath<T>()?.fullPath ?? "";
    if(path == null && RouteController.paths.containsKey(T)) {
      path = RouteController.paths[T]!();
    }
    path ??= "";


    // print("HASH T ${T.hashCode}, HASH controller ${routeInfo?.routeController.hashCode} $T ${routeInfo?.routeController.runtimeType.hashCode}");
    // print("getService $path -> $routeInfo : ${routeInfo?.routeController.runtimeType}");
    // if(routeInfo?.routeController != null) {
    //   return routeInfo!.routeController as T;
    // }
    if (path.startsWith('/')) path = path.substring(1);
    var splits = path.split('/');
    var node = getNodeTree(splits);

    print("getService PATH : $path -> ${node.name}");
    // print("PATH OF $T, is $path");
    return node.routeController != null ? (node.routeController as T) : null;
  }

  RouteInfo getNodeTree(List<String> splits) {
    print("getNodeTree $splits, ${paths.keys}");

    if (splits.isEmpty) return this;
    if (paths.isEmpty) return this;
    if (splits.length == 1 && splits[0] == "") return this;

    if (!paths.containsKey(splits.first)) {
      print("NodeTree with name $name haven't ${splits.first}, then I'm return myself");
      return this;
    }
    if (paths[splits.first] == null) {
      print("NodeTree with name $name has null Node by key ${splits.first}, then I'm return myself");
      return this;
    }

    if (splits.length > 1) {
      print("paths.length > 1 return $name.getNodeTree");
      return paths[splits.first]!.getNodeTree(splits.sublist(1));
    }
    print("return paths[${splits.first}]");
    return paths[splits.first]!;
  }


  // final List<SetsMapEntry<E, V>> entries = [];
  // Set<Type> setParent(RouteInfo? parent) {
  // SetsMapEntry<Type, RouteInfo> getTypes() {
  //   //RouteInfo? parent) {
  //   if (childrenControllers.isEmpty) {
  //     childrenControllers.addAll(children?.map((child) {
  //           child.parent = this;
  //           return child.getTypes();
  //           // return child.getTypes(child).keys.reduce((first, second) {
  //           //   first.addAll(second);
  //           //   return first;
  //           // });
  //         }) ??
  //         []);
  //   }
  //
  //   // if(childrenControllers.isNotEmpty) {
  //   //   print("CHILDREN CONTROLLERS : ${childrenControllers.entries}");
  //   // }
  //
  //   Set<Type> types = (childrenControllers.keys.isEmpty
  //       ? {}
  //       : childrenControllers.keys.reduce((first, second) {
  //           first.addAll(second);
  //           return first;
  //         }));
  //
  //   // if(childrenControllers.isNotEmpty) {
  //   //   print("CHILDREN TYPES : ${types}");
  //   // }
  //
  //
  //   if (routeController != null) {
  //     types.add(routeController.runtimeType);
  //   }
  //
  //   // childrenControllers
  //
  //   print("${name.padRight(14)} getTypes result: $types");
  //   return SetsMapEntry(types, this);
  //   // // .reduce((first, second) {
  //   // //
  //   // // first.addAll(second);
  //   // // return first;
  //   // // }) ?? {};///Получил все дочерние типы
  //   // types.add(routeController.runtimeType);
  //   //
  //   // childrenControllers.add(key, value)
  //   // // childrenControllers =
  //   // // MapTypeRoutes(routeController!, child)
  //   //
  //   // childrenControllers.add(
  //   //     routeController.runtimeType, MapTypeRoutes(routeController!, child))
  //   // childrenControllers.add(
  //   //     routeController.runtimeType, MapTypeRoutes(routeController!, child))
  //   // return childrenControllers;
  //   // return s;
  // }


  final Map<String, RouteInfo?> paths = {};


//   T? getService<T extends RouteController>([String? path]) {
//     // return AppRouterBase.singleton.infoRoute.getPath<T>()?.routeController as T?;
//     // var routeInfo = AppRouterBase.singleton.infoRoute.getPath<T>();
//
//     // path ??= AppRouterBase.singleton.infoRoute.getPath<T>()?.fullPath ?? "";
//     path ??= RouteController.paths[T]!();// ?? "";
//
//
//     // print("HASH T ${T.hashCode}, HASH controller ${routeInfo?.routeController.hashCode} $T ${routeInfo?.routeController.runtimeType.hashCode}");
//     // print("getService $path -> $routeInfo : ${routeInfo?.routeController.runtimeType}");
//     // if(routeInfo?.routeController != null) {
//     //   return routeInfo!.routeController as T;
//     // }
//     if (path.startsWith('/')) path = path.substring(1);
//     var splits = path.split('/');
//     var node = getNodeTree(splits);
//
//     print("getService PATH : $path -> ${node.service}");
//     // print("PATH OF $T, is $path");
//     return node.service != null ? (node.service as T) : null;
//   }

  // SetsMap<Type, RouteInfo> childrenControllers = SetsMap();

  ///like: general/home/
  String? get parentPath => parent?.fullPath;

  String get fullPath {
    String? parent = parentPath;
    if (parent == null) return name;

    parent = parent.endsWith('/')
        ? "${parentPath ?? ""}$name"
        : "${parentPath ?? ""}/$name";

    return parent;
  }

  CustomRoute get route => CustomRoute(
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 400,
        initial: initial,
        page: page,
        path: name,
        children: children?.map((info) => info.route).toList(),
      );

// RouteInfo? getPath<T>() {
//   print("SEARCHING TYPE $T -> ${routeController?.runtimeType}");
//
//   if(routeController is T) return this;
//
//   print("$name: entries.${childrenControllers.entries.length}");
//   for (var element in childrenControllers.keys) {
//     print("$name: ${element.toList()} : TYPES");
//   }
//   if (childrenControllers.containsKey(T)) {
//     print("$name: childrenControllers contain : $T TYPE");
//     return childrenControllers[T]?.getPath<T>();
//   }
//
//
//   print("RETURN NULL");
//   return null;
// }
}
//
// class MapTypeRoutes {
//   MapTypeRoutes(this.controller, this.child);
//
//   MapTypeRoutes? child;
//   RouteController controller;
// }
