part of '../ice_flutter_toolkit.dart';

abstract class RouteController {
  final RouteCore core = RouteCore.get();

  static T get<T extends RouteController>([bool forcePush = false]) {
    var service = RouteCore.get().tree.getService<T>();
    service ??= (_controllersMap[T] ?? controllersFactories[T]!(forcePush)) as T;
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

  static final Map<Type, RouteController> _controllersMap = {};
  static final Map<Type, RouteController Function([bool])> controllersFactories = {};
  RouteController([bool forcePush = false]) {
    var service = forcePush ? null : _getService();
    if (service == null) _setService();
  }

  // void init();
  // void recordFactory();

  void _setService<T extends RouteController>([T? service]) {
    service ??= this as T;
    _controllersMap[T] = service;
    core.tree.setService<T>(service, path);
  }

  T? _getService<T extends RouteController>() => core.tree.getService<T>(path);


  ///for navigation with controller
  StackRouter? router;

  late String path;// => AppRouterBase.singleton.fullForServices[runtimeType] ?? "";
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