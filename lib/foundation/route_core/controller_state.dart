import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:paloma_test/foundation/ice_flutter_toolkit.dart';

abstract class BindStateController<T extends StatefulWidget, E extends RouteController> extends State<T> {
  // late final E routeController = await RouteController.get<E>()
  late final E routeController = RouteController.get<E>();

  @override
  void initState() {


    Future.microtask(() async {
      // routeController = await RouteController.get<E>();
      routeController.router = AutoRouter.of(context);
      routeController.initController();
    });

    super.initState();
  }

  @override
  void dispose() {
    routeController.disposeController();
    super.dispose();
  }
}