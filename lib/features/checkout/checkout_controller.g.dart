// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckoutController on _CheckoutController, Store {
  final _$generatePdfAndOpenFileAsyncAction =
      AsyncAction('_CheckoutController.generatePdfAndOpenFile');

  @override
  Future<void> generatePdfAndOpenFile() {
    return _$generatePdfAndOpenFileAsyncAction
        .run(() => super.generatePdfAndOpenFile());
  }

  final _$generatePdfAndShareAsyncAction =
      AsyncAction('_CheckoutController.generatePdfAndShare');

  @override
  Future<void> generatePdfAndShare() {
    return _$generatePdfAndShareAsyncAction
        .run(() => super.generatePdfAndShare());
  }

  final _$_CheckoutControllerActionController =
      ActionController(name: '_CheckoutController');

  @override
  void refreshCart() {
    final _$actionInfo = _$_CheckoutControllerActionController.startAction(
        name: '_CheckoutController.refreshCart');
    try {
      return super.refreshCart();
    } finally {
      _$_CheckoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
