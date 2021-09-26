import 'package:avaliacao_framework_shop/app_styles/app_colors.dart';
import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:avaliacao_framework_shop/features/cart/cart_controller.dart';
import 'package:avaliacao_framework_shop/features/cart/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CartButton extends StatelessWidget {
  CartButton({Key? key}) : super(key: key);

  final cartController = GetIt.I<CartController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      backgroundColor: AppColors.green,
      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CartScreen())),
      child: Stack(
        children: [
          const Icon(
            Icons.shopping_cart,
            size: 50,
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: AppColors.purple,
                shape: BoxShape.circle,
              ),
              child: Center(child: Observer(builder: (_) {
                return Text(
                  cartController.cartProducts.length.toString(),
                  style: AppTextStyles.shoppingCart,
                );
              })),
            ),
          )
        ],
      ),
    );
  }
}
