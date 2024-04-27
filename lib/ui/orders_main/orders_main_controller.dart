import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:paloma_test/foundation/ice_flutter_toolkit.dart';
import 'package:paloma_test/ui/menu_main/menu_main_controller.dart';

part 'orders_main_controller.g.dart';

class OrdersMainController = OrdersMainControllerBase with _$OrdersMainController;

abstract class OrdersMainControllerBase extends RouteController with Store {

  final editingController = TextEditingController();
  final photoLinkController = TextEditingController();


  late final MenuMainController menu = RouteController.get<MenuMainController>();

  @action
  void addBook() {
    if(editingController.text.isEmpty || photoLinkController.text.isEmpty) return;
    try{
      var parsed = Uri.tryParse(photoLinkController.text);
      if(parsed?.host.isEmpty ?? true) return;

      menu.add(editingController.text, photoLinkController.text);
      editingController.clear();
      photoLinkController.clear();
    } catch(e) { return;}
  }

  @action
  @override
  Future<void> initController() async {

    // menu = await RouteController.get<MenuMainController>();
  }
  @action
  @override
  Future<void> disposeController() async {
  }

}
