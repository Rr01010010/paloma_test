import 'package:auto_route/auto_route.dart';
import 'package:bind3/bind3.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/routers/general_wrapper.dart';
import 'package:paloma_test/routers/home_wrapper.dart';
import 'package:paloma_test/routers/menu_wrapper.dart';
import 'package:paloma_test/routers/orders_wrapper.dart';
import 'package:paloma_test/ui/menu_main/menu_main_controller.dart';
import 'package:paloma_test/ui/menu_main/menu_main_page.dart';
import 'package:paloma_test/ui/orders_main/orders_main_controller.dart';
import 'package:paloma_test/ui/orders_main/orders_main_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter with AppRouterBase {
  @override
  RouteNode get infoRoute =>
      RouteNode(name: '/', page: GeneralWrapperRoute.page, children: [
        RouteNode(
            initial: true,
            name: 'home',
            page: HomeWrapperRoute.page,
            children: [
              RouteNode(
                  //initial: true,
                  page: OrdersWrapperRoute.page,
                  name: "ordersTab",
                  children: [
                    RouteNode(
                      initial: true,
                      page: OrdersMainRoute.page,
                      name: "ordersMain",
                      routeController: OrdersMainController(),
                    ),
                  ]),
              RouteNode(
                  initial: true,
                  page: MenuWrapperRoute.page,
                  name: "menuTab",
                  children: [
                    RouteNode(
                      initial: true,
                      page: MenuMainRoute.page,
                      name: "menuMain",
                      routeController: MenuMainController(),
                    ),
                  ]),
            ]),
      ]);
}
