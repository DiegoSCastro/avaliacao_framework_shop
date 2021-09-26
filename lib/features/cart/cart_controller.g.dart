// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartController, Store {
  Computed<double>? _$getCartPriceComputed;

  @override
  double get getCartPrice =>
      (_$getCartPriceComputed ??= Computed<double>(() => super.getCartPrice,
              name: '_CartController.getCartPrice'))
          .value;
  Computed<String>? _$getTotalCartPriceComputed;

  @override
  String get getTotalCartPrice => (_$getTotalCartPriceComputed ??=
          Computed<String>(() => super.getTotalCartPrice,
              name: '_CartController.getTotalCartPrice'))
      .value;

  final _$cartSumAtom = Atom(name: '_CartController.cartSum');

  @override
  double? get cartSum {
    _$cartSumAtom.reportRead();
    return super.cartSum;
  }

  @override
  set cartSum(double? value) {
    _$cartSumAtom.reportWrite(value, super.cartSum, () {
      super.cartSum = value;
    });
  }

  final _$_CartControllerActionController =
      ActionController(name: '_CartController');

  @override
  void calculateCartPrice() {
    final _$actionInfo = _$_CartControllerActionController.startAction(
        name: '_CartController.calculateCartPrice');
    try {
      return super.calculateCartPrice();
    } finally {
      _$_CartControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int index) {
    final _$actionInfo = _$_CartControllerActionController.startAction(
        name: '_CartController.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_CartControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCart(Product product) {
    final _$actionInfo = _$_CartControllerActionController.startAction(
        name: '_CartController.addCart');
    try {
      return super.addCart(product);
    } finally {
      _$_CartControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCart(Product product) {
    final _$actionInfo = _$_CartControllerActionController.startAction(
        name: '_CartController.removeCart');
    try {
      return super.removeCart(product);
    } finally {
      _$_CartControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartSum: ${cartSum},
getCartPrice: ${getCartPrice},
getTotalCartPrice: ${getTotalCartPrice}
    ''';
  }
}
