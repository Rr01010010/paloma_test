import 'package:mobx/mobx.dart';
import 'package:paloma_test/foundation/ice_flutter_toolkit.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    print("LINKS: $links");
    links.addAll(
    [
        (
        "1984\nДжордж Оруэлл",
        "https://cdn.eksmo.ru/v2/ITD000000001222810/COVER/cover1__w820.jpg",
        ),
        (
        "Нейромант\nУильям Гибсон",
        "https://games.mail.ru/hotbox/content_files/gallery/c1/46/78e08098.jpeg",
        ),
        (
        "Дюна\nФрэнк Герберт",
        "https://img4.labirint.ru/rc/5c37c7af7b72722fb122d3494e57396e/363x561q80/books81/805594/cover.jpg?1653323143",
        ),
        (
        "Тень над Иннсмутом\nГовардт Лавкрафт",
        "https://2books.su/assets/img/covers/the-shadow-over-innsmouth-h-p-lovecraft.jpg",
        ),
        (
        "Солярис\nСтанислав Лем",
        "https://img3.labirint.ru/rc/111843981e1d94e5a5924104cf1a4ab7/363x561q80/books58/578929/cover.jpg?1687328748"
        ),
      ]
    );
  }

  @action
  @override
  Future<void> disposeController() async {
  }

}
