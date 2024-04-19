import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/foundation/ice_flutter_toolkit.dart';
import 'package:paloma_test/routers/general_wrapper.dart';
import 'package:paloma_test/routers/home_wrapper.dart';
import 'package:paloma_test/routers/menu_wrapper.dart';
import 'package:paloma_test/routers/orders_wrapper.dart';

part 'app_router.gr.dart';
//
// @AutoRouterConfig()
// class AppRouter extends _$AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(path: '/', page: GeneralWrapperRoute.page, children: [
//           AutoRoute(path: '/', page: HomeWrapperRoute.page, children: [
//             AutoRoute(
//                 page: OrdersWrapperRoute.page,
//                 path: "ordersTab",
//                 children: [
//                   // AutoRoute(page: FeedRoute.page, path: ""),
//                   // AutoRoute(page: NotificationsRoute.page, path: "notifications"),
//                   // AutoRoute(page: NotificationsSettingsRoute.page, path: "settings"),
//                   // AutoRoute(page: PostRoute.page, path: "post"),
//                 ]),
//             AutoRoute(page: MenuWrapperRoute.page, path: "menuTab", children: [
//               // AutoRoute(page: FeedRoute.page, path: ""),
//               // AutoRoute(page: NotificationsRoute.page, path: "notifications"),
//               // AutoRoute(page: NotificationsSettingsRoute.page, path: "settings"),
//               // AutoRoute(page: PostRoute.page, path: "post"),
//             ]),
//           ]),
//         ]),
//       ];
// }
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends AppRouterBase {

  @override
  List<RouteInfo> get infoRoutes =>

      [
        RouteInfo(name: '/', page: GeneralWrapperRoute.page, children: [
          RouteInfo(name: '/', page: HomeWrapperRoute.page, children: [
            RouteInfo(
                page: OrdersWrapperRoute.page,
                name: "ordersTab",
                children: [
                  // AutoRoute(page: FeedRoute.page, path: ""),
                  // AutoRoute(page: NotificationsRoute.page, path: "notifications"),
                  // AutoRoute(page: NotificationsSettingsRoute.page, path: "settings"),
                  // AutoRoute(page: PostRoute.page, path: "post"),
                ]),
            RouteInfo(page: MenuWrapperRoute.page, name: "menuTab", children: [
              // AutoRoute(page: FeedRoute.page, path: ""),
              // AutoRoute(page: NotificationsRoute.page, path: "notifications"),
              // AutoRoute(page: NotificationsSettingsRoute.page, path: "settings"),
              // AutoRoute(page: PostRoute.page, path: "post"),
            ]),
          ]),
        ]),
      ];

    // throw Exception("Не реализован AppRouterBase и/или не передан в синглтон");
}