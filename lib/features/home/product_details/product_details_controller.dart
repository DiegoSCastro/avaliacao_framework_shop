import 'package:avaliacao_framework_shop/features/cart/cart_controller.dart';
import 'package:avaliacao_framework_shop/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'product_details_controller.g.dart';

class ProductDetailsController = _ProductDetailsController
    with _$ProductDetailsController;

abstract class _ProductDetailsController with Store {
  final Product product;
  _ProductDetailsController({required this.product});

  final cartController = GetIt.I<CartController>();

  @observable
  int quantity = 1;

  @action
  void increment() {
    quantity++;
  }

  @action
  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @action
  void addToCart(BuildContext context) {
    Product productAdd = product.copyWith(
      quantity: quantity,
    );
    cartController.cartProducts.add(productAdd);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Adicionado ${productAdd.quantity} kg de ${productAdd.name}'),
      ),
    );
  }

  @computed
  double get getSumPrice => quantity * product.price;
}
