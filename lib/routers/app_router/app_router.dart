import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/foundation/ice_flutter_toolkit.dart';
import 'package:paloma_test/routers/general_wrapper.dart';
import 'package:paloma_test/routers/home_wrapper.dart';
import 'package:paloma_test/routers/menu_wrapper.dart';
import 'package:paloma_test/routers/orders_wrapper.dart';
import 'package:paloma_test/ui/menu_main/menu_main_controller.dart';
import 'package:paloma_test/ui/menu_main/menu_main_page.dart';
import 'package:paloma_test/ui/orders_main/orders_main_controller.dart';
import 'package:paloma_test/ui/orders_main/orders_main_page.dart';

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
class AppRouter extends _$AppRouter with AppRouterBase {
  @override
  RouteInfo get infoRoute =>
      RouteInfo(name: '/', page: GeneralWrapperRoute.page, children: [
        RouteInfo(initial: true,

            name: 'home', page: HomeWrapperRoute.page, children: [
          RouteInfo(//initial: true,
              page: OrdersWrapperRoute.page,
              name: "ordersTab",
              children: [
                RouteInfo(
                  initial: true,
                  page: OrdersMainRoute.page,
                  name: "ordersMain",
                  routeController: OrdersMainController(),
                ),
                // AutoRoute(page: FeedRoute.page, path: ""),
                // AutoRoute(page: NotificationsRoute.page, path: "notifications"),
                // AutoRoute(page: NotificationsSettingsRoute.page, path: "settings"),
                // AutoRoute(page: PostRoute.page, path: "post"),
              ]),
          RouteInfo(initial: true, page: MenuWrapperRoute.page, name: "menuTab", children: [
            RouteInfo(
              initial: true,
              page: MenuMainRoute.page,
              name: "menuMain",
              routeController: MenuMainController(),
            ),
          ]),
        ]),
      ]);


// throw Exception("Не реализован AppRouterBase и/или не передан в синглтон");
}
