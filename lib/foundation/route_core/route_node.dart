// part of '../ice_flutter_toolkit.dart';
//
// class RouteNode {
//   RouteNode({required this.paths, required this.rank, required this.name});
//
//   factory RouteNode.create(List<String> subPath, int rank,
//       {String? name}) {
//     RouteNode emptyNode = RouteNode(paths: {}, rank: rank, name: name ?? "");
//     if (subPath.isEmpty) return emptyNode;
//
//     int slashIndex;
//     String v1, v2;
//
//     List<(String, String?)> resources = subPath.map((s) {
//       slashIndex = s.indexOf("/");
//       if (s == "") return ("", null);
//       if (slashIndex == -1) return (s, null);
//
//       v1 = s.substring(0, slashIndex).trim();
//       v2 = s.substring(slashIndex + 1).trim();
//       return (v1, v2);
//     }).toList();
//     if (resources.isEmpty) return emptyNode;
//
//     //res.map((e) => e.$1).toSet() - ключи мапы, и по ним создается мапа с пустыми массивами, но если ключ '' то вместо пустого массива Нулл
//     Map<String, List<String>?> nodes = {};
//     for (var res in resources) {
//       if (nodes[res.$1] == null) {
//         nodes[res.$1] = <String>[];
//       }
//       if (res.$2 != null) {
//         nodes[res.$1]!.add(res.$2!);
//       }
//     }
//     var paths = nodes.map((key, value) {
//       return MapEntry(
//         key,
//         RouteNode.create(value ?? [], rank + 1, name: key),
//       );
//     });
//
//     if(name == null) return paths.values.firstOrNull ?? emptyNode;
//
//     var route = RouteNode(
//       paths: paths,
//       rank: rank,
//       name: name,
//     );
//     return route;
//   }
//   // Type
//   final Map<String, RouteNode?> paths;
//   final int rank;
//   final String name;
//   // RouteController? service;
//
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
//
//   T setService<T extends RouteController>(T value, [String? path]) {
//     path ??= RouteController.paths[T]!();//[T] ?? "";
//     // path ??= AppRouterBase.singleton.infoRoute.getPath<T>()?.fullPath ?? "";
//
//     // print("setService $path");
//     if (path!.startsWith('/')) path = path.substring(1);
//     var splits = path.split('/');
//     var node = getNodeTree(splits);
//
//     node.service = value;
//     return value;
//   }
//
//   RouteNode getNodeTree(List<String> splits) {
//     if (splits.isEmpty) return this;
//     if (paths.isEmpty) return this;
//     if (splits.length == 1 && splits[0] == "") return this;
//
//     if (!paths.containsKey(splits.first)) {
//       // print("NodeTree with name $name haven't ${splits.first}, then I'm return myself");
//       return this;
//     }
//     if (paths[splits.first] == null) {
//       // print("NodeTree with name $name has null Node by key ${splits.first}, then I'm return myself");
//       return this;
//     }
//
//     if (paths.length > 1) {
//       return paths[splits.first]!.getNodeTree(splits.sublist(1));
//     }
//     return paths[splits.first]!;
//   }
//
//   @override
//   String toString() {
//     var list = paths
//         .map((key, value) =>
//             MapEntry(key, "PathEntry($key,${value?.toString()})"))
//         .values
//         .toList();
//     var pathString = list.isEmpty
//         ? ""
//         : list.reduce((previousValue, element) => "$previousValue,$element");
//     return "RouteNode($name,$rank,$pathString)";
//   }
// }
