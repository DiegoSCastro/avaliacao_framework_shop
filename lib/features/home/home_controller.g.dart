// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$searchAtom = Atom(name: '_HomeController.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$searchVisibleAtom = Atom(name: '_HomeController.searchVisible');

  @override
  bool get searchVisible {
    _$searchVisibleAtom.reportRead();
    return super.searchVisible;
  }

  @override
  set searchVisible(bool value) {
    _$searchVisibleAtom.reportWrite(value, super.searchVisible, () {
      super.searchVisible = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic setSearch(String value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleSearchVisible() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.toggleSearchVisible');
    try {
      return super.toggleSearchVisible();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
searchVisible: ${searchVisible}
    ''';
  }
}
