import 'package:bind3/bind3.dart';
import 'package:mobx/mobx.dart';
part 'menu_main_controller.g.dart';

class MenuMainController = MenuMainControllerBase with _$MenuMainController;

abstract class MenuMainControllerBase extends RouteController with Store {

  @observable
  ObservableList<(String,String)> links = ObservableList();
  @action
  void add(String title,String link) => links.add((title,link));
  @action
  void removeAt(int index) => links.removeAt(index);
  @action
  void removeWithTitle(String title) => links.removeWhere((link) => link.$1.compareTo(title) == 0);

  @action
  @override
  Future<void> initController() async {
  }

  @action
  @override
  Future<void> disposeController() async {
  }
}
