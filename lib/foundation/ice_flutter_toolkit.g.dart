// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ice_flutter_toolkit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RouteCore on RouteCoreBase, Store {
  Computed<dynamic>? _$loadingComputed;

  @override
  dynamic get loading => (_$loadingComputed ??=
          Computed<dynamic>(() => super.loading, name: 'RouteCoreBase.loading'))
      .value;

  late final _$containerAtom =
      Atom(name: 'RouteCoreBase.container', context: context);

  @override
  RepositoriesContainerBase get container {
    _$containerAtom.reportRead();
    return super.container;
  }

  @override
  set container(RepositoriesContainerBase value) {
    _$containerAtom.reportWrite(value, super.container, () {
      super.container = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: 'RouteCoreBase._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$treeAtom = Atom(name: 'RouteCoreBase.tree', context: context);

  @override
  RouteNode get tree {
    _$treeAtom.reportRead();
    return super.tree;
  }

  @override
  set tree(RouteNode value) {
    _$treeAtom.reportWrite(value, super.tree, () {
      super.tree = value;
    });
  }

  @override
  String toString() {
    return '''
container: ${container},
tree: ${tree},
loading: ${loading}
    ''';
  }
}
