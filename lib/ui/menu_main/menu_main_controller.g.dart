// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuMainController on MenuMainControllerBase, Store {
  late final _$linksAtom =
      Atom(name: 'MenuMainControllerBase.links', context: context);

  @override
  ObservableList<(String, String)> get links {
    _$linksAtom.reportRead();
    return super.links;
  }

  @override
  set links(ObservableList<(String, String)> value) {
    _$linksAtom.reportWrite(value, super.links, () {
      super.links = value;
    });
  }

  late final _$initControllerAsyncAction =
      AsyncAction('MenuMainControllerBase.initController', context: context);

  @override
  Future<void> initController() {
    return _$initControllerAsyncAction.run(() => super.initController());
  }

  late final _$disposeControllerAsyncAction =
      AsyncAction('MenuMainControllerBase.disposeController', context: context);

  @override
  Future<void> disposeController() {
    return _$disposeControllerAsyncAction.run(() => super.disposeController());
  }

  late final _$MenuMainControllerBaseActionController =
      ActionController(name: 'MenuMainControllerBase', context: context);

  @override
  void add(String title, String link) {
    final _$actionInfo = _$MenuMainControllerBaseActionController.startAction(
        name: 'MenuMainControllerBase.add');
    try {
      return super.add(title, link);
    } finally {
      _$MenuMainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAt(int index) {
    final _$actionInfo = _$MenuMainControllerBaseActionController.startAction(
        name: 'MenuMainControllerBase.removeAt');
    try {
      return super.removeAt(index);
    } finally {
      _$MenuMainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeWithTitle(String title) {
    final _$actionInfo = _$MenuMainControllerBaseActionController.startAction(
        name: 'MenuMainControllerBase.removeWithTitle');
    try {
      return super.removeWithTitle(title);
    } finally {
      _$MenuMainControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
links: ${links}
    ''';
  }
}
