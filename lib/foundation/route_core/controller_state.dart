import 'package:flutter/material.dart';
import 'package:paloma_test/foundation/ice_flutter_toolkit.dart';

abstract class ControllerState<T extends StatefulWidget, E extends RouteController> extends State<T> {
  final E routeController = RouteController.get<E>();
}