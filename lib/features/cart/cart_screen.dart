import 'package:avaliacao_framework_shop/app_styles/app_text_styles.dart';
import 'package:avaliacao_framework_shop/features/cart/cart_controller.dart';
import 'package:avaliacao_framework_shop/features/cart/components/cart_list_item.dart';
import 'package:avaliacao_framework_shop/features/checkout/checkout_screen.dart';
import 'package:avaliacao_framework_shop/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final cartController = GetIt.I<CartController>();

  @override
  Widget build(BuildContext context) {
    cartController.calculateCartPrice();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          children: [
            const Text('Carrinho de Compras'),
            Observer(builder: (_) {
              return Text(cartController.getTotalCartPrice);
            })
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Arraste para a esquerda para remover',
                style: AppTextStyles.textButtonWhite,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Observer(builder: (_) {
                return ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartController.cartProducts.length,
                  itemBuilder: (context, index) {
                    var product = cartController.cartProducts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CartListItem(
                        index: index,
                        product: product,
                        key: UniqueKey(),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              if (cartController.cartProducts.isNotEmpty) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 48,
                  child: CustomButton(
                    labelText: 'Finalizar Pedido',
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CheckoutScreen())),
                  ),
                );
              }
              return Container();
            }),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
