part of '../ice_flutter_toolkit.dart';

class RouteCore extends RouteCoreBase with _$RouteCore {
  static RouteCollection getRouteCollection(BuildContext ctx) =>
      AutoRouter.of(ctx).routeCollection;

  static final RouteCore get = RouteCore._();

  RouteCore._();

  factory RouteCore.create(
      RepositoriesContainerBase repositoryContainer, AppRouterBase appRouter) {
    AppRouterBase.singleton = appRouter;

    if(!get.initialized) {
      get._load(repositoryContainer, appRouter);
    }
    // _singleton ??= RouteCore._(repositoryContainer,
    //     routeCollection: appRouter.routeCollection);



    return get;
  }
  //
  // factory RouteCore.get() {
  //   _singleton ??=
  //       RouteCore.create(EmptyRepositoriesContainer(), EmptyRouter());
  //   return _singleton!;
  // }
}

abstract class RouteCoreBase with Store {
  // RouteCoreBase(
  //     RepositoriesContainerBase? container, RouteCollection? routeCollection) {
  //   if (container != null) this.container = container;
  //   load(routeCollection);
  // }
  bool initialized = false;

  @observable
  RepositoriesContainerBase container = EmptyRepositoriesContainer();
  @observable
  bool _loading = false;

  @computed
  get loading => container.loading || _loading;

  @observable
  late RouteInfo tree; //= AppRouterBase.singleton.infoRoute;// RouteInfo(page: page, name: name); = RouteNode.create([], 0);

  Future<void> _load(RepositoriesContainerBase con, AppRouterBase appRouter) async {
    initialized = true;

    _loading = true;
    container = con;
    var loading = container.initialize();

    var paths = appRouter.routeCollection.getPath();
    tree = appRouter.infoRoute;

    // for (var element in paths) {
    //   // ignore: avoid_print
    //   print('ice_flutter_toolkit: $element');
    // }
    // tree = RouteNode.create(paths, 0);
    await loading;

    _loading = false;
  }
}

extension PathOfRouteCollection on RouteCollection {
  List<String> getPath([String? parent]) {
    List<String> paths = [];
    for (var route in routes) {
      String fullPath = route.path;
      if (parent != null) {
        fullPath = parent.endsWith('/')
            ? "$parent${route.path}"
            : "$parent/${route.path}";
      }

      paths.add(fullPath);
      paths.addAll(route.children?.getPath(fullPath) ?? []);
    }
    return paths;
  }
}
// -> [path:[tree,tree,tree]] routeCollection
// -> generate RouteCore with collection and controllers tree require container
// -> set in main material app
