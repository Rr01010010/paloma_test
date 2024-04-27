part of '../ice_flutter_toolkit.dart';

abstract class RouteController {
  final RouteCore core = RouteCore.get;

  static T get<T extends RouteController>([bool forcePush = false]) {
  // static Future<T> get<T extends RouteController>([bool forcePush = false]) async {
    // await Future.delayed(const Duration(milliseconds: 1000));
    // var v = T as RouteController;
    var path = paths[T]!();
    print("GET $T -> PATH: $path");
    var service = RouteCore.get.tree.getService<T>(path);
    // service ??= RouteController.create() as T;
    // (_controllersMap[T] ?? controllersFactories[T]!(forcePush)) as T;
    if(service == null) throw Exception("RouteController.get<$T>(path: $path) not found service");
    return service;
  }

  //
  // T getOrMe<T extends RouteController>({bool replaceNew = false}) {
  //   if (replaceNew) {
  //     _setService(this);
  //   } else {
  //     var service = RouteCore.get().tree.getService<T>();
  //     if (service != null) {
  //       return service;
  //     }
  //   }
  //
  //   return this as T;
  // }

  // external factory RouteController.create();

  // static final Map<Type, RouteController> _controllersMap = {};
  // static final Map<Type, RouteController Function([bool])> controllersFactories = {};
  RouteController([bool forcePush = false]) {
  //   var service = forcePush ? null : _getService();
  //   if (service == null) _setService();
  }

  Future<void> initController();
  Future<void> disposeController();
  //
  // void _setService<T extends RouteController>([T? service]) {
  //   service ??= this as T;
  //   // _controllersMap[T] = service;
  //   core.tree.setService<T>(service, path);
  // }
  //
  // T? _getService<T extends RouteController>() => core.tree.getService<T>(path);


  ///for navigation with controller
  StackRouter? router;

  static final Map<Type,String Function()> paths = {};
  String get path => routeInfo.fullPath;
  late RouteInfo _routeInfo;

  RouteInfo get routeInfo => _routeInfo;

  set routeInfo(RouteInfo value) {
    _routeInfo = value;
    paths[runtimeType] = ()=>routeInfo.fullPath;
  }
  // String get path => _path;

  // set path(String value) {
  //   print("SET PATH: $value");
  //   _path = value;
  //   paths[runtimeType] = _path;
  // }// => AppRouterBase.singleton.fullForServices[runtimeType] ?? "";
  String get name => path.split('/').last;

  navigateRoute([StackRouter? sRouter, useName = false]) =>
      (sRouter ?? router)?.navigateNamed(
          useName ? name : path);//(path.startsWith('/') ? path.substring(1) : path));

  pushRoute([StackRouter? sRouter, useName = false]) =>
      (sRouter ?? router)?.pushNamed(
          useName ? name : (path.startsWith('/') ? path.substring(1) : path));

  replaceRoute([StackRouter? sRouter, useName = false]) =>
      (sRouter ?? router)?.replaceNamed(
          useName ? name : (path.startsWith('/') ? path.substring(1) : path));
}