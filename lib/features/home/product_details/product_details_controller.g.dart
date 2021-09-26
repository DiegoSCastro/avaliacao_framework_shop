// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailsController on _ProductDetailsController, Store {
  Computed<double>? _$getSumPriceComputed;

  @override
  double get getSumPrice =>
      (_$getSumPriceComputed ??= Computed<double>(() => super.getSumPrice,
              name: '_ProductDetailsController.getSumPrice'))
          .value;

  final _$quantityAtom = Atom(name: '_ProductDetailsController.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$_ProductDetailsControllerActionController =
      ActionController(name: '_ProductDetailsController');

  @override
  void increment() {
    final _$actionInfo = _$_ProductDetailsControllerActionController
        .startAction(name: '_ProductDetailsController.increment');
    try {
      return super.increment();
    } finally {
      _$_ProductDetailsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_ProductDetailsControllerActionController
        .startAction(name: '_ProductDetailsController.decrement');
    try {
      return super.decrement();
    } finally {
      _$_ProductDetailsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToCart(BuildContext context) {
    final _$actionInfo = _$_ProductDetailsControllerActionController
        .startAction(name: '_ProductDetailsController.addToCart');
    try {
      return super.addToCart(context);
    } finally {
      _$_ProductDetailsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity},
getSumPrice: ${getSumPrice}
    ''';
  }
}
